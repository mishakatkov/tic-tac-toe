import 'package:board_domain/board_domain.dart';
import 'package:types_result_domain/types_result_domain.dart';

/// The opponent, played locally by the game's own rules.
///
/// Single source: implements the domain contract directly, so there is no
/// intermediate repository class (rule A).
///
/// It deliberately takes [_thinkingTime] to answer, so the player sees their own
/// mark land before the reply. The day the move comes from a backend, add an
/// `opponent_http_data_source.dart` beside this one and let composition pick —
/// nothing in the domain or the presentation changes.
final class LocalOpponentDataSource implements OpponentRepository {
  final ChooseMove _chooseMove;
  final Duration _thinkingTime;

  const LocalOpponentDataSource({required ChooseMove chooseMove, required Duration thinkingTime})
    : _chooseMove = chooseMove,
      _thinkingTime = thinkingTime;

  @override
  Future<Result<int, OpponentError>> nextMove({required Board board, required Mark mark}) async {
    await Future<void>.delayed(_thinkingTime);

    final cell = _chooseMove(board, mark);

    // Defensive: the behavior already declines to ask about a finished round.
    return cell == null ? const Failure(OpponentError.unavailable()) : Success(cell);
  }
}
