import 'package:board_data/src/data_sources/local_opponent_data_source.dart';
import 'package:board_data/src/providers_di.br.dart';
import 'package:board_domain/board_domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_internal.br.g.dart';

@riverpod
Duration defaultOpponentThinkingTime(Ref _) => const Duration(milliseconds: 400);

@riverpod
LocalOpponentDataSource opponentDataSource(Ref ref) => LocalOpponentDataSource(
  chooseMove: ref.watch(chooseMoveProvider),
  thinkingTime: ref.watch(opponentThinkingTimeProvider),
);
