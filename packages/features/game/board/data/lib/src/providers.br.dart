import 'package:board_data/src/providers_internal.br.dart';
import 'package:board_domain/board_domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.br.g.dart';

@riverpod
OpponentRepository opponentRepository(Ref ref) => ref.watch(opponentDataSourceProvider);
