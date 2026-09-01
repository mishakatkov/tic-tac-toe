import 'package:board_data/src/providers_internal.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_di.br.g.dart';

/// How long the opponent takes to answer. Defaults to the value below; tests set
/// it to zero rather than waiting.
/// This file is never exported by the package barrel.
@riverpod
Duration opponentThinkingTime(Ref ref) => ref.watch(defaultOpponentThinkingTimeProvider);
