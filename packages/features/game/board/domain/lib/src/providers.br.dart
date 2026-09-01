import 'package:board_domain/src/behaviors/choose_move.dart';
import 'package:board_domain/src/behaviors/evaluate_board.dart';
import 'package:board_domain/src/behaviors/play_move.dart';
import 'package:board_domain/src/behaviors/request_opponent_move.dart';
import 'package:board_domain/src/providers_di.br.dart';
import 'package:board_domain/src/repositories/opponent_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.br.g.dart';

List<Override> bindProviders({required ProviderListenable<OpponentRepository> repository}) => [
  opponentRepositoryProvider.overrideWith((ref) => ref.watch(repository)),
];

// Public API: the behaviors, never the raw repository.
@riverpod
ChooseMove chooseMove(Ref ref) => ChooseMove(evaluate: ref.watch(evaluateBoardProvider));

@riverpod
EvaluateBoard evaluateBoard(Ref _) => const EvaluateBoard();

@riverpod
PlayMove playMove(Ref ref) => PlayMove(evaluate: ref.watch(evaluateBoardProvider));

@riverpod
RequestOpponentMove requestOpponentMove(Ref ref) => RequestOpponentMove(
  evaluate: ref.watch(evaluateBoardProvider),
  repository: ref.watch(opponentRepositoryProvider),
);
