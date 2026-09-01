import 'package:board_presentation/src/providers_di.br.dart';
import 'package:board_presentation/src/theme/board_theme.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// The theme is optional: without it the feature renders with its own internal default theme.
List<Override> bindProviders({ProviderListenable<BoardTheme>? theme}) => [
  if (theme != null) boardThemeProvider.overrideWith((ref) => ref.watch(theme)),
];
