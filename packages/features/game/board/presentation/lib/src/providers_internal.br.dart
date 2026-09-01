import 'package:board_presentation/src/theme/board_theme.br.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tactics_providers/tactics_providers.dart';

part 'providers_internal.br.g.dart';

/// The feature's default theme, derived from the DSM palette. Composition can
/// override it (brand, dark mode, A/B) without touching the feature.
@riverpod
BoardTheme defaultBoardTheme(Ref ref) {
  final palette = ref.watch(tacticsPaletteProvider);

  return BoardTheme(
    backgroundColor: palette.bgPage,
    cellColor: palette.white,
    circleColor: palette.positive,
    crossColor: palette.red,
    errorStyle: TextStyle(color: palette.red, fontSize: 14, fontWeight: FontWeight.w700),
    gridColor: palette.n100,
    sideOptionSize: 40,
    statusStyle: TextStyle(color: palette.night, fontSize: 18, fontWeight: FontWeight.w700),
    winningLineColor: palette.n500,
  );
}
