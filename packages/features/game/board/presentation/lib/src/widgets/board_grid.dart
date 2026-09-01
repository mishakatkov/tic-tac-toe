import 'package:board_domain/board_domain.dart';
import 'package:board_presentation/src/providers_di.br.dart';
import 'package:board_presentation/src/widgets/mark_glyph.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tactics_components/tactics_components.dart';

/// Layout of the grid, shared by the cells and by the strike that crosses them —
/// the two must agree on where a cell's centre is.
const double _gridPadding = TacticsSpacing.spacing100;
const double _cellSpacing = TacticsSpacing.spacing100;

/// Proportions of a cell, not design tokens: the strike stays in step with the
/// marks at any grid size.
const double _strikeRatio = 0.08;
const double _overshootRatio = 0.3;

class BoardGrid extends ConsumerWidget {
  final Board board;
  final void Function(int index) onCellSelected;
  final GameOutcome outcome;

  const BoardGrid({required this.board, required this.onCellSelected, required this.outcome, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(boardThemeProvider);

    return AspectRatio(
      aspectRatio: 1,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.gridColor,
          borderRadius: BorderRadius.circular(TacticsRadius.xl),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            GridView.count(
              crossAxisCount: Board.side,
              crossAxisSpacing: _cellSpacing,
              mainAxisSpacing: _cellSpacing,
              padding: const EdgeInsets.all(_gridPadding),
              physics: const NeverScrollableScrollPhysics(),
              children: [
                for (var index = 0; index < Board.cellCount; index++)
                  _BoardCell(mark: board.cellAt(index), onTap: () => onCellSelected(index)),
              ],
            ),
            // Drawn over the cells, so it reads as struck through rather than behind.
            if (outcome case WinGameOutcome(:final line))
              IgnorePointer(
                child: CustomPaint(
                  painter: _WinningLinePainter(color: theme.winningLineColor, line: line),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _BoardCell extends ConsumerWidget {
  final Mark? mark;
  final VoidCallback onTap;

  const _BoardCell({required this.mark, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cellColor = ref.watch(boardThemeProvider.select((theme) => theme.cellColor));

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: RepaintBoundary(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: cellColor,
            borderRadius: BorderRadius.circular(TacticsRadius.sm),
          ),
          child: switch (mark) {
            null => const SizedBox.shrink(),
            final Mark mark => MarkGlyph(mark: mark),
          },
        ),
      ),
    );
  }
}

class _WinningLinePainter extends CustomPainter {
  final Color color;
  final List<int> line;

  const _WinningLinePainter({required this.color, required this.line});

  @override
  void paint(Canvas canvas, Size size) {
    final cellSize = (size.shortestSide - _gridPadding * 2 - _cellSpacing * (Board.side - 1)) / Board.side;
    final start = _centreOf(line.first, cellSize);
    final end = _centreOf(line.last, cellSize);

    // Reach past the outer marks, so the line strikes through them rather than
    // stopping on top of them.
    final overshoot = (end - start) / (end - start).distance * cellSize * _overshootRatio;

    canvas.drawLine(
      start - overshoot,
      end + overshoot,
      Paint()
        ..color = color
        ..strokeCap = StrokeCap.round
        ..strokeWidth = cellSize * _strikeRatio,
    );
  }

  @override
  bool shouldRepaint(_WinningLinePainter oldDelegate) =>
      oldDelegate.color != color || !listEquals(oldDelegate.line, line);

  Offset _centreOf(int index, double cellSize) => Offset(
    _gridPadding + (index % Board.side) * (cellSize + _cellSpacing) + cellSize / 2,
    _gridPadding + (index ~/ Board.side) * (cellSize + _cellSpacing) + cellSize / 2,
  );
}
