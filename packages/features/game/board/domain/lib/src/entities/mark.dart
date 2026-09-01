/// The two tic-tac-toe marks. `cross` always opens the game.
enum Mark {
  circle,
  cross;

  Mark get opponent => this == cross ? circle : cross;
}
