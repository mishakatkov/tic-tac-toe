import 'package:board_domain/board_domain.dart';
import 'package:board_presentation/src/notifiers/game_state.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_notifier.br.g.dart';

@riverpod
class GameNotifier extends _$GameNotifier {
  int _round = 0;

  @override
  GameState build() => GameState.newRound(playerMark: Mark.cross);

  Future<void> play(int index) async {
    if (state.isComputerThinking || !state.isPlayerTurn) return;

    final board = ref.read(playMoveProvider)(state.board, index);

    if (board == state.board) return;

    state = state.copyWith(board: board);

    await _playComputerMove();
  }

  Future<void> restart() => _startRound(state.playerMark);

  Future<void> selectMark(Mark mark) async {
    if (mark == state.playerMark) return;

    await _startRound(mark);
  }

  Future<void> _startRound(Mark playerMark) {
    _round++;
    state = GameState.newRound(playerMark: playerMark);

    return _playComputerMove();
  }

  Future<void> _playComputerMove() async {
    if (state.isPlayerTurn) return;

    final round = _round;
    state = state.copyWith(isComputerThinking: true, opponentError: null);

    final move = await ref.read(requestOpponentMoveProvider)(state.board, state.computerMark);

    if (!ref.mounted || _round != round) return;

    // A null answer means the round was already over — nothing to apply.
    state =
        move?.fold(
          (cell) => state.copyWith(board: ref.read(playMoveProvider)(state.board, cell), isComputerThinking: false),
          (error) => state.copyWith(isComputerThinking: false, opponentError: error),
        ) ??
        state.copyWith(isComputerThinking: false);
  }
}
