import 'package:board_domain/src/repositories/opponent_repository.dart';
import 'package:exceptions/exceptions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_di.br.g.dart';

// Incoming contracts: they throw until composition provides them.
// This file is never exported by the package barrel.
@riverpod
OpponentRepository opponentRepository(Ref ref) {
  throw UnregisteredProviderException(opponentRepositoryProvider);
}
