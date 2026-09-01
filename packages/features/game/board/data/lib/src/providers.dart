import 'package:board_data/src/providers.br.dart';
import 'package:board_data/src/providers_di.br.dart';
import 'package:board_domain/board_domain.dart' as board_domain;
import 'package:riverpod_annotation/riverpod_annotation.dart';

// The data source fulfils the domain's repository contract. The thinking time is
// optional: without it the feature runs on the internal default.
List<Override> bindProviders({ProviderListenable<Duration>? thinkingTime}) => [
  ...board_domain.bindProviders(repository: opponentRepositoryProvider),
  if (thinkingTime != null) opponentThinkingTimeProvider.overrideWith((ref) => ref.watch(thinkingTime)),
];
