import 'package:board_domain/src/entities/board.br.dart';
import 'package:board_domain/src/entities/errors/opponent_error.br.dart';
import 'package:board_domain/src/entities/mark.dart';
import 'package:types_result_domain/types_result_domain.dart';

/// Where the computer's next move comes from. Rules computed behind a fake
/// transport today, a real endpoint tomorrow: the feature only sees this contract.
///
/// Returns a `Result`: an opponent that cannot answer is a return value visible in
/// the signature, not an exception to catch in the right place.
abstract interface class OpponentRepository {
  Future<Result<int, OpponentError>> nextMove({required Board board, required Mark mark});
}
