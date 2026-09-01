import 'package:board_domain/board_domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_state.br.freezed.dart';

@freezed
sealed class GameState with _$GameState {
  const factory GameState({
    required Board board,
    required bool isComputerThinking,
    required Mark playerMark,
    OpponentError? opponentError,
  }) = _GameState;

  const GameState._();

  factory GameState.newRound({required Mark playerMark}) =>
      GameState(board: Board.empty(), isComputerThinking: false, playerMark: playerMark);

  Mark get computerMark => playerMark.opponent;

  bool get isPlayerTurn => board.currentPlayer == playerMark;
}
