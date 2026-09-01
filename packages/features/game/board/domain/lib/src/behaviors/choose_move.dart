import 'package:board_domain/src/behaviors/evaluate_board.dart';
import 'package:board_domain/src/entities/board.br.dart';
import 'package:board_domain/src/entities/game_outcome.br.dart';
import 'package:board_domain/src/entities/mark.dart';

/// Picks the cell a given mark should play next, or null when the round is over.
///
/// Ordered rules, first match wins: complete a line, block the opponent's line,
/// then take the centre, a corner, a side. Deliberately beatable — the rules see
/// one threat at a time, so a double threat gets past them.
class ChooseMove {
  static const List<int> _centre = [4];
  static const List<int> _corners = [0, 2, 6, 8];
  static const List<int> _sides = [1, 3, 5, 7];

  final EvaluateBoard evaluate;

  const ChooseMove({required this.evaluate});

  int? call(Board board, Mark mark) {
    if (evaluate(board) is! InProgressGameOutcome) return null;

    return _completing(board, mark) ??
        _completing(board, mark.opponent) ??
        _firstFree(board, _centre) ??
        _firstFree(board, _corners) ??
        _firstFree(board, _sides);
  }

  /// The single free cell of a line whose other two cells already carry the mark.
  int? _completing(Board board, Mark mark) {
    for (final line in Board.winningLines) {
      final free = line.where(board.isFree).toList();

      if (free.length == 1 && line.every((index) => board.isFree(index) || board.cellAt(index) == mark)) {
        return free.single;
      }
    }

    return null;
  }

  int? _firstFree(Board board, List<int> cells) {
    for (final index in cells) {
      if (board.isFree(index)) return index;
    }

    return null;
  }
}
