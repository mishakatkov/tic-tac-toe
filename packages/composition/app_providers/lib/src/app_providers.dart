import 'package:board_data/board_data.dart' as board_data;
import 'package:board_presentation/board_presentation.dart' as board_presentation;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tactics_components/tactics_components.dart';
import 'package:tactics_providers/tactics_providers.dart' as tactics_providers;

/// Composition root: the only place that knows every feature.
/// - DSM: the concrete palette feeds the `tacticsPaletteProvider` contract
/// - data: the local opponent data source fulfils the domain's repository contract
///
/// Each feature's theme is optional: omitted here, every feature renders with its
/// own internal default theme derived from the palette.
///
/// `network_dio_data` is deliberately **not** bound: nothing talks to a backend yet,
/// so `httpClientProvider` stays unfulfilled and throws if anyone reads it. Bind it
/// here on the day a data source needs it.
List<Override> appProviders() => [
  ...tactics_providers.bindProviders(palette: Provider((_) => TacticsPalette.light())),
  ...board_data.bindProviders(),
  ...board_presentation.bindProviders(),
];
