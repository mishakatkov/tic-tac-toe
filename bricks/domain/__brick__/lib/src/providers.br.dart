import 'package:{{name.snakeCase()}}/src/providers_di.br.dart';
import 'package:{{name.snakeCase()}}/src/repositories/{{classname.snakeCase()}}_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.br.g.dart';

List<Override> bindProviders({required ProviderListenable<{{classname.pascalCase()}}Repository> repository}) => [
  {{classname.camelCase()}}RepositoryProvider.overrideWith((ref) => ref.watch(repository)),
];

// Public API: expose the behaviors as providers, never the raw repository.
@riverpod
void dummy{{name.pascalCase()}}(Ref _) {}
