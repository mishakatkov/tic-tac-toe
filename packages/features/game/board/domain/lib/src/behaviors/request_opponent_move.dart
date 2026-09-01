import 'package:board_domain/src/behaviors/evaluate_board.dart';
import 'package:board_domain/src/entities/board.br.dart';
import 'package:board_domain/src/entities/errors/opponent_error.br.dart';
import 'package:board_domain/src/entities/game_outcome.br.dart';
import 'package:board_domain/src/entities/mark.dart';
import 'package:board_domain/src/repositories/opponent_repository.dart';
import 'package:types_result_domain/types_result_domain.dart';

/// Asks the opponent for its move. A finished round is not a question worth
/// asking: the answer is null and the repository is never called.
class RequestOpponentMove {
  final EvaluateBoard evaluate;
  final OpponentRepository repository;

  const RequestOpponentMove({required this.evaluate, required this.repository});

  Future<Result<int, OpponentError>?> call(Board board, Mark mark) async {
    if (evaluate(board) is! InProgressGameOutcome) return null;

    return repository.nextMove(board: board, mark: mark);
  }
}
