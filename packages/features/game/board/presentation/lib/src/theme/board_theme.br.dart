import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'board_theme.br.tailor.dart';

/// Semantic tokens of the board screen — never the raw palette: the feature names
/// what it needs, composition decides which color answers.
@TailorMixinComponent()
class BoardTheme extends ThemeExtension<BoardTheme> with _$BoardThemeTailorMixin {
  @override
  final Color backgroundColor;
  @override
  final Color cellColor;
  @override
  final Color circleColor;
  @override
  final Color crossColor;
  @override
  final TextStyle errorStyle;
  @override
  final Color gridColor;
  @override
  final double sideOptionSize;
  @override
  final TextStyle statusStyle;
  @override
  final Color winningLineColor;

  const BoardTheme({
    required this.backgroundColor,
    required this.cellColor,
    required this.circleColor,
    required this.crossColor,
    required this.errorStyle,
    required this.gridColor,
    required this.sideOptionSize,
    required this.statusStyle,
    required this.winningLineColor,
  });
}
