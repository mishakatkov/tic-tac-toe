import 'package:board_domain/board_domain.dart';
import 'package:board_presentation/src/notifiers/game_notifier.br.dart';
import 'package:board_presentation/src/providers_di.br.dart';
import 'package:board_presentation/src/widgets/board_grid.dart';
import 'package:board_presentation/src/widgets/game_status_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tactics_components/tactics_components.dart';

class BoardScreen extends ConsumerWidget {
  const BoardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backgroundColor = ref.watch(boardThemeProvider.select((theme) => theme.backgroundColor));
    final state = ref.watch(gameProvider);
    final outcome = ref.watch(evaluateBoardProvider)(state.board);
    final game = ref.read(gameProvider.notifier);

    return ColoredBox(
      color: backgroundColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(TacticsSpacing.spacing400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: TacticsSpacing.spacing600,
            children: [
              Expanded(
                child: Center(
                  child: BoardGrid(board: state.board, onCellSelected: game.play, outcome: outcome),
                ),
              ),
              GameStatusBar(
                onMarkSelected: game.selectMark,
                onRestartRequested: game.restart,
                outcome: outcome,
                state: state,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
