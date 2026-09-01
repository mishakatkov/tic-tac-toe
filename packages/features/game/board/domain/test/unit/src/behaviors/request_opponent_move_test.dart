import 'package:board_domain/board_domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:givn/givn.dart';
import 'package:shouldly/shouldly.dart';
import 'package:types_result_domain/types_result_domain.dart';

/// Records whether the opponent was consulted at all.
final class _SpyOpponent implements OpponentRepository {
  int requests = 0;

  @override
  Future<Result<int, OpponentError>> nextMove({required Board board, required Mark mark}) async {
    requests++;

    return const Success(4);
  }
}

RequestOpponentMove _request(_SpyOpponent opponent) =>
    RequestOpponentMove(evaluate: const EvaluateBoard(), repository: opponent);

void main() {
  group('Requesting the opponent move', () {
    given('a round still in progress', (context) => _SpyOpponent())
        .when('the opponent is asked', (sut, context) => _request(sut)(Board.empty(), Mark.circle))
        .then('the answer should come from the opponent', (result, context) => result?.getOrNull().should.be(4));

    given('a round already won', (context) => _SpyOpponent())
        .when('the opponent is asked', (sut, context) async {
          const board = Board(cells: [Mark.cross, Mark.cross, Mark.cross, null, null, null, null, null, null]);

          return (answer: await _request(sut)(board, Mark.circle), opponent: sut);
        })
        .then('nothing should be asked of the opponent', (result, context) {
          result.answer.should.beNull();
          result.opponent.requests.should.be(0);
        });
  });
}
