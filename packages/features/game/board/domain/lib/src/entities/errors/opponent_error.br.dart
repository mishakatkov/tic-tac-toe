import 'package:freezed_annotation/freezed_annotation.dart';

part 'opponent_error.br.freezed.dart';

/// Business failures of the opponent, expressed domain-side: presentation
/// switches on these cases, never on a transport exception. One case per
/// displayable message.
@freezed
sealed class OpponentError with _$OpponentError {
  const factory OpponentError.unavailable() = UnavailableOpponentError;
}
