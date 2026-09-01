import 'package:{{name.snakeCase()}}/src/data_sources/{{classname.snakeCase()}}_http_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_internal.br.g.dart';

@riverpod
{{classname.pascalCase()}}HttpDataSource {{classname.camelCase()}}DataSource(Ref ref) =>
    {{classname.pascalCase()}}HttpDataSource();
