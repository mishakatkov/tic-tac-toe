import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:{{name.snakeCase()}}/src/theme/{{classname.snakeCase()}}_theme.br.dart';
import 'package:tactics_providers/tactics_providers.dart';

part 'providers_internal.br.g.dart';

/// The feature's default theme, derived from the DSM palette.
@riverpod
{{classname.pascalCase()}}Theme default{{classname.pascalCase()}}Theme(Ref ref) {
  final palette = ref.watch(tacticsPaletteProvider);

  return {{classname.pascalCase()}}Theme(backgroundColor: palette.bgPage);
}
