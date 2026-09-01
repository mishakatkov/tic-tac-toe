import 'package:board_domain/src/entities/mark.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'board.br.freezed.dart';

@freezed
sealed class Board with _$Board {
  static const int side = 3;
  static const int cellCount = side * side;

  /// The eight winning alignments, as cell indices.
  static const List<List<int>> winningLines = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  const factory Board({required List<Mark?> cells}) = _Board;

  const Board._();

  factory Board.empty() => Board(cells: List<Mark?>.filled(cellCount, null));

  Mark get currentPlayer => moveCount.isEven ? Mark.cross : Mark.circle;

  bool get isFull => moveCount == cellCount;

  int get moveCount => cells.whereType<Mark>().length;

  Mark? cellAt(int index) => cells[index];

  bool isFree(int index) => cells[index] == null;

  bool isPlayable(int index) => index >= 0 && index < cellCount && isFree(index);
}
