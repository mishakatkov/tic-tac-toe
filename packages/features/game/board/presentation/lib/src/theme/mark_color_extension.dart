import 'package:board_domain/board_domain.dart';
import 'package:board_presentation/src/theme/board_theme.br.dart';
import 'package:flutter/material.dart';

/// Which semantic token answers for a given mark. One lookup, so no widget has to
/// remember that crosses are `crossColor`.
extension MarkColor on BoardTheme {
  Color colorOf(Mark mark) => switch (mark) {
    Mark.circle => circleColor,
    Mark.cross => crossColor,
  };
}
