import 'package:board_presentation/src/providers_internal.br.dart';
import 'package:board_presentation/src/theme/board_theme.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_di.br.g.dart';

@riverpod
BoardTheme boardTheme(Ref ref) => ref.watch(defaultBoardThemeProvider);
