import 'package:{{domainPackage.snakeCase()}}/{{domainPackage.snakeCase()}}.dart';
import 'package:{{name.snakeCase()}}/src/providers_internal.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.br.g.dart';

@riverpod
{{classname.pascalCase()}}Repository {{classname.camelCase()}}Repository(Ref ref) =>
    ref.watch({{classname.camelCase()}}DataSourceProvider);
