import 'dart:async';

import 'package:board_domain/board_domain.dart';
import 'package:board_presentation/src/notifiers/game_notifier.br.dart';
import 'package:board_presentation/src/notifiers/game_state.br.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:givn/givn.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shouldly/shouldly.dart';
import 'package:types_result_domain/types_result_domain.dart';

/// An opponent that answers at once, by the same rules the real one uses.
final class _InstantOpponent implements OpponentRepository {
  const _InstantOpponent();

  @override
  Future<Result<int, OpponentError>> nextMove({required Board board, required Mark mark}) async {
    final cell = const ChooseMove(evaluate: EvaluateBoard())(board, mark);

    return cell == null ? const Failure(OpponentError.unavailable()) : Success(cell);
  }
}

/// An opponent that cannot be reached at all.
final class _UnavailableOpponent implements OpponentRepository {
  const _UnavailableOpponent();

  @override
  Future<Result<int, OpponentError>> nextMove({required Board board, required Mark mark}) async =>
      const Failure(OpponentError.unavailable());
}

/// An opponent held mid-answer, so a request can be observed while in flight.
final class _HeldOpponent implements OpponentRepository {
  final Completer<void> answered = Completer<void>();

  @override
  Future<Result<int, OpponentError>> nextMove({required Board board, required Mark mark}) async {
    await answered.future;

    return const Success(0);
  }
}

/// Tests reach the opponent through the same DI seam composition uses.
List<Override> _against(OpponentRepository opponent) =>
    bindProviders(repository: Provider<OpponentRepository>((_) => opponent));

/// The subscription matters: the provider is auto-dispose, so without a listener
/// it would be thrown away between the read and the assertion.
GameNotifier _game(TestContext context) {
  context.ref.listen(gameProvider, (_, _) {});

  return context.ref.read(gameProvider.notifier);
}

GameState _state(TestContext context) => context.ref.read(gameProvider);

void main() {
  group('Playing a round against the computer', () {
    given('a fresh round', _game, providers: (context) => _against(const _InstantOpponent()))
        .when('the player looks at the board', (sut, context) => _state(context))
        .then('the player should be crosses and open the round', (result, context) {
          result.playerMark.should.be(Mark.cross);
          result.board.moveCount.should.be(0);
          result.isPlayerTurn.should.beTrue();
        });

    given('a fresh round', _game, providers: (context) => _against(const _InstantOpponent()))
        .when('the player plays the centre', (sut, context) async {
          await sut.play(4);

          return _state(context);
        })
        .then('the computer should answer, handing the turn back', (result, context) {
          result.board.cellAt(4).should.be(Mark.cross);
          result.board.moveCount.should.be(2);
          result.isPlayerTurn.should.beTrue();
          result.isComputerThinking.should.beFalse();
        });

    given('a round where the player picks circles', _game, providers: (context) => _against(const _InstantOpponent()))
        .when('the player switches sides', (sut, context) async {
          await sut.selectMark(Mark.circle);

          return _state(context);
        })
        .then('the computer should open with a cross', (result, context) {
          result.playerMark.should.be(Mark.circle);
          result.board.cellAt(4).should.be(Mark.cross);
          result.board.moveCount.should.be(1);
          result.isPlayerTurn.should.beTrue();
        });

    given(
          'a round the player has already played into',
          _game,
          providers: (context) => _against(const _InstantOpponent()),
        )
        .when('the player asks to play again', (sut, context) async {
          await sut.play(0);
          await sut.restart();

          return _state(context);
        })
        .then('the board should be empty and the player to move', (result, context) {
          result.board.moveCount.should.be(0);
          result.isPlayerTurn.should.beTrue();
        });

    given('a fresh round', _game, providers: (context) => _against(const _InstantOpponent()))
        .when('the player tries to take a cell the computer owns', (sut, context) async {
          await sut.play(4);
          await sut.play(_state(context).board.cells.indexOf(Mark.circle));

          return _state(context);
        })
        .then('the board should not change', (result, context) => result.board.moveCount.should.be(2));

    given('a round in progress', _game, providers: (context) => _against(const _InstantOpponent()))
        .when('the player leaves the computer two cells in a row', (sut, context) async {
          for (final index in [4, 8, 6]) {
            await sut.play(index);
          }

          return _state(context);
        })
        .then('the computer should complete its line and win', (result, context) {
          const evaluate = EvaluateBoard();

          evaluate(result.board).should.be(const GameOutcome.win(Mark.circle, [0, 1, 2]));
        });
  });

  group('Waiting on the opponent', () {
    given('an opponent that has not answered yet', _game, providers: (context) => _against(_HeldOpponent()))
        .when('the player has just moved', (sut, context) async {
          unawaited(sut.play(4));
          await pumpEventQueue();

          return _state(context);
        })
        .then('the computer should be thinking, and the player should not be able to move', (result, context) {
          result.isComputerThinking.should.beTrue();
          result.isPlayerTurn.should.beFalse();
          result.board.moveCount.should.be(1);
        });

    given('an opponent that cannot be reached', _game, providers: (context) => _against(const _UnavailableOpponent()))
        .when('the player moves', (sut, context) async {
          await sut.play(4);

          return _state(context);
        })
        .then('the player should be told, not left waiting', (result, context) {
          result.opponentError.should.be(const OpponentError.unavailable());
          result.isComputerThinking.should.beFalse();
          result.board.moveCount.should.be(1);
        });
  });

  group('An answer that arrives too late', () {
    given(
          'an opponent still answering the previous round',
          (context) => (game: _game(context), opponent: context.namedParameterOf<_HeldOpponent>('opponent')),
          namedParameters: {'opponent': _HeldOpponent()},
          providers: (context) => _against(context.namedParameterOf<_HeldOpponent>('opponent')),
        )
        .when('the player restarts before it lands', (sut, context) async {
          unawaited(sut.game.play(4));
          await pumpEventQueue();

          await sut.game.restart();
          sut.opponent.answered.complete();
          await pumpEventQueue();

          return _state(context);
        })
        .then('the stale move should be dropped', (result, context) {
          result.board.moveCount.should.be(0);
          result.isComputerThinking.should.beFalse();
        });
  });
}
