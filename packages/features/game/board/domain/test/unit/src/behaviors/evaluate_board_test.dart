import 'package:board_domain/board_domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:givn/givn.dart';
import 'package:shouldly/shouldly.dart';

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
  group('Outcome of a board', () {
    given('a board where crosses line up the top row', (context) => _board('xxx oo. ...'))
        .when('the user looks at the result', (sut, context) => const EvaluateBoard()(sut))
        .then(
          'crosses should have won on the top row',
          (result, context) => result.should.be(const GameOutcome.win(Mark.cross, [0, 1, 2])),
        );

    given('a board where circles line up a diagonal', (context) => _board('o.x xo. x.o'))
        .when('the user looks at the result', (sut, context) => const EvaluateBoard()(sut))
        .then(
          'circles should have won on the main diagonal',
          (result, context) => result.should.be(const GameOutcome.win(Mark.circle, [0, 4, 8])),
        );

    given('a full board with no alignment', (context) => _board('xox xoo oxx'))
        .when('the user looks at the result', (sut, context) => const EvaluateBoard()(sut))
        .then('the game should be a draw', (result, context) => result.should.be(const GameOutcome.draw()));

    given('a board still incomplete', (context) => _board('xo. ... ...'))
        .when('the user looks at the result', (sut, context) => const EvaluateBoard()(sut))
        .then(
          'the game should still be in progress',
          (result, context) => result.should.be(const GameOutcome.inProgress()),
        );
  });
}
