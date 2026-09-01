import 'package:board_domain/src/entities/mark.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_outcome.br.freezed.dart';

/// Outcome of a board. Sealed union: presentation switches on the cases, it never
/// recomputes the rules of the game.
///
/// A win carries the cells that won it, so the screen can point at them without
/// searching the grid a second time.
@freezed
sealed class GameOutcome with _$GameOutcome {
  const factory GameOutcome.draw() = DrawGameOutcome;
  const factory GameOutcome.inProgress() = InProgressGameOutcome;
  const factory GameOutcome.win(Mark mark, List<int> line) = WinGameOutcome;
}
