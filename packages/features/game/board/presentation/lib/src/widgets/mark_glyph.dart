import 'package:board_domain/board_domain.dart';
import 'package:board_presentation/src/l10n/board_strings.dart';
import 'package:board_presentation/src/providers_di.br.dart';
import 'package:board_presentation/src/theme/mark_color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Proportions of the painted box, not design tokens: they keep a mark's shape
/// identical at any size, from a grid cell down to the side picker.
const double _strokeRatio = 0.12;
const double _crossInsetRatio = 0.28;
const double _circleInsetRatio = 0.18;

/// A mark drawn rather than typed: no dependency on a font shipping `X` and `O`,
/// and it scales to whatever box it is given.
class MarkGlyph extends ConsumerWidget {
  final Mark mark;

  const MarkGlyph({required this.mark, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(boardThemeProvider.select((theme) => theme.colorOf(mark)));

    return Semantics(
      label: _labelOf(mark),
      child: CustomPaint(
        painter: _MarkPainter(color: color, mark: mark),
        size: Size.infinite,
      ),
    );
  }
}

class _MarkPainter extends CustomPainter {
  final Color color;
  final Mark mark;

  const _MarkPainter({required this.color, required this.mark});

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = size.shortestSide * _strokeRatio;

    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = stroke
      ..style = PaintingStyle.stroke;

    switch (mark) {
      case Mark.circle:
        canvas.drawCircle(size.center(Offset.zero), size.shortestSide * (0.5 - _circleInsetRatio), paint);
      case Mark.cross:
        final inset = size.shortestSide * _crossInsetRatio;

        canvas
          ..drawLine(Offset(inset, inset), Offset(size.width - inset, size.height - inset), paint)
          ..drawLine(Offset(size.width - inset, inset), Offset(inset, size.height - inset), paint);
    }
  }

  @override
  bool shouldRepaint(_MarkPainter oldDelegate) => oldDelegate.color != color || oldDelegate.mark != mark;
}

String _labelOf(Mark mark) => switch (mark) {
  Mark.circle => BoardStrings.circleMark,
  Mark.cross => BoardStrings.crossMark,
};
