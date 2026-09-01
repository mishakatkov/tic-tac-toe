import 'package:exceptions/exceptions.dart';
import 'package:{{name.snakeCase()}}/src/providers_internal.br.dart';
import 'package:{{name.snakeCase()}}/src/routing/{{classname.snakeCase()}}_routing.dart';
import 'package:{{name.snakeCase()}}/src/theme/{{classname.snakeCase()}}_theme.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_di.br.g.dart';

@riverpod
{{classname.pascalCase()}}Routing {{classname.camelCase()}}Routing(Ref _) {
  throw UnregisteredProviderException({{classname.camelCase()}}RoutingProvider);
}

@riverpod
{{classname.pascalCase()}}Theme {{classname.camelCase()}}Theme(Ref ref) =>
    ref.watch(default{{classname.pascalCase()}}ThemeProvider);
