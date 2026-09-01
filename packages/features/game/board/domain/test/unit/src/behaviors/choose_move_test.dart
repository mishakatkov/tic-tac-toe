import 'package:board_domain/board_domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:givn/givn.dart';
import 'package:shouldly/shouldly.dart';

const _chooseMove = ChooseMove(evaluate: EvaluateBoard());

/// Board read row by row: `x` cross, `o` circle, `.` free cell.
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
  group('The computer choosing its move', () {
    given('a board where the computer is one cell from a line', (context) => _board('oxx .o. ...'))
        .when('the computer takes its turn', (sut, context) => _chooseMove(sut, Mark.circle))
        .then('it should complete the line and win', (result, context) => result.should.be(8));

    given('a board where the player is one cell from a line', (context) => _board('xx. o.. ...'))
        .when('the computer takes its turn', (sut, context) => _chooseMove(sut, Mark.circle))
        .then('it should block the player', (result, context) => result.should.be(2));

    given('a board where the computer can either win or block', (context) => _board('xx. oo. ...'))
        .when('the computer takes its turn', (sut, context) => _chooseMove(sut, Mark.cross))
        .then('winning should come before blocking', (result, context) => result.should.be(2));

    given('a board where the player threatens a line and the centre is free', (context) => _board('x.o x.. ...'))
        .when('the computer takes its turn', (sut, context) => _chooseMove(sut, Mark.circle))
        .then('blocking should come before taking the centre', (result, context) => result.should.be(6));

    given('a board with nothing to win or block and a free centre', (context) => _board('x.. ... ...'))
        .when('the computer takes its turn', (sut, context) => _chooseMove(sut, Mark.circle))
        .then('it should take the centre', (result, context) => result.should.be(4));

    given('a board whose centre is already taken', (context) => _board('... .x. ...'))
        .when('the computer takes its turn', (sut, context) => _chooseMove(sut, Mark.circle))
        .then('it should fall back to a corner', (result, context) => result.should.be(0));

    given('a round the player has already won', (context) => _board('xxx oo. ...'))
        .when('the computer takes its turn', (sut, context) => _chooseMove(sut, Mark.circle))
        .then('it should not play at all', (result, context) => result.should.beNull());

    given('a full board', (context) => _board('xox xoo oxx'))
        .when('the computer takes its turn', (sut, context) => _chooseMove(sut, Mark.circle))
        .then('it should not play at all', (result, context) => result.should.beNull());
  });
}
