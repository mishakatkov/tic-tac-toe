import 'package:board_data/src/data_sources/local_opponent_data_source.dart';
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

/// No thinking time: the specs assert the answer, not the pause.
LocalOpponentDataSource _dataSource() => const LocalOpponentDataSource(
  chooseMove: ChooseMove(evaluate: EvaluateBoard()),
  thinkingTime: Duration.zero,
);

void main() {
  group('The local opponent', () {
    given('a grid where the player threatens a line', (context) => _dataSource())
        .when(
          'the opponent move is requested',
          (sut, context) => sut.nextMove(board: _board('xx. o.. ...'), mark: Mark.circle),
        )
        .then('it should answer the blocking cell', (result, context) => result.getOrNull().should.be(2));

    given('a grid where the opponent can complete a line', (context) => _dataSource())
        .when(
          'the opponent move is requested',
          (sut, context) => sut.nextMove(board: _board('oxx .o. ...'), mark: Mark.circle),
        )
        .then('it should answer the winning cell', (result, context) => result.getOrNull().should.be(8));

    given('a round that is already over', (context) => _dataSource())
        .when(
          'the opponent move is requested anyway',
          (sut, context) => sut.nextMove(board: _board('xxx oo. ...'), mark: Mark.circle),
        )
        .then(
          'it should report that it cannot answer',
          (result, context) => result.exceptionOrNull().should.be(const OpponentError.unavailable()),
        );
  });
}
