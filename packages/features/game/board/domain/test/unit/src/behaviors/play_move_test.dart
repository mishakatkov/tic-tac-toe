import 'package:board_domain/board_domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:givn/givn.dart';
import 'package:shouldly/shouldly.dart';

const _playMove = PlayMove(evaluate: EvaluateBoard());

Board _board(String cells) => Board(
  cells: cells
      .replaceAll(RegExp(r'\s'), '')
      .split('')
      .map(
        (cell) => switch (cell) {
          'x' => Mark.cross,
          'o' => Mark.circle,
          _ => null,
        },
      )
      .toList(),
);

void main() {
  group('Placing a mark on the board', () {
    given('an empty board', (context) => Board.empty())
        .when('the user plays the centre cell', (sut, context) => _playMove(sut, 4))
        .then('a cross should open the game', (result, context) {
          result.cellAt(4).should.be(Mark.cross);
          result.moveCount.should.be(1);
        });

    given('a board where crosses have already played', (context) => _board('x.. ... ...'))
        .when('the user plays another cell', (sut, context) => _playMove(sut, 8))
        .then('the turn should pass to circles', (result, context) => result.cellAt(8).should.be(Mark.circle));

    given('a board whose centre is already taken', (context) => _board('....x....'))
        .when('the user plays the centre again', (sut, context) => _playMove(sut, 4))
        .then('the board should stay unchanged', (result, context) => result.moveCount.should.be(1));

    given('a game already won by crosses', (context) => _board('xxx oo. ...'))
        .when('the user still tries a move', (sut, context) => _playMove(sut, 8))
        .then('the board should stay unchanged', (result, context) => result.cellAt(8).should.beNull());
  });
}
