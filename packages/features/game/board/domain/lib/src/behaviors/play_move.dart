import 'package:board_domain/src/behaviors/evaluate_board.dart';
import 'package:board_domain/src/entities/board.br.dart';
import 'package:board_domain/src/entities/game_outcome.br.dart';

class PlayMove {
  final EvaluateBoard evaluate;

  const PlayMove({required this.evaluate});

  Board call(Board board, int index) {
    if (!board.isFree(index) || evaluate(board) is! InProgressGameOutcome) return board;

    final cells = [...board.cells]..[index] = board.currentPlayer;

    return Board(cells: cells);
  }
}
