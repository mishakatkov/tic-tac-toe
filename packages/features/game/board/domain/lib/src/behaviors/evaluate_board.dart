import 'package:board_domain/src/entities/board.br.dart';
import 'package:board_domain/src/entities/game_outcome.br.dart';

class EvaluateBoard {
  const EvaluateBoard();

  GameOutcome call(Board board) {
    for (final line in Board.winningLines) {
      final mark = board.cellAt(line.first);

      if (mark != null && line.every((index) => board.cellAt(index) == mark)) {
        return GameOutcome.win(mark, line);
      }
    }

    return board.isFull ? const GameOutcome.draw() : const GameOutcome.inProgress();
  }
}
