import 'package:board_domain/board_domain.dart';
import 'package:board_presentation/src/l10n/board_strings.dart';
import 'package:board_presentation/src/notifiers/game_state.br.dart';
import 'package:board_presentation/src/providers_di.br.dart';
import 'package:board_presentation/src/widgets/mark_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tactics_components/tactics_components.dart';

class GameStatusBar extends ConsumerWidget {
  final void Function(Mark mark) onMarkSelected;
  final VoidCallback onRestartRequested;
  final GameOutcome outcome;
  final GameState state;

  const GameStatusBar({
    required this.onMarkSelected,
    required this.onRestartRequested,
    required this.outcome,
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(boardThemeProvider);

    final label = switch (outcome) {
      DrawGameOutcome() => BoardStrings.draw,
      InProgressGameOutcome() => state.isPlayerTurn ? BoardStrings.turnPlayer : BoardStrings.turnComputer,
      WinGameOutcome(:final mark) => mark == state.playerMark ? BoardStrings.winPlayer : BoardStrings.winComputer,
    };

    return Column(
      spacing: TacticsSpacing.spacing300,
      children: [
        Text(label, style: theme.statusStyle),
        // An opponent that could not answer is said out loud, not swallowed.
        if (state.opponentError != null)
          Text(BoardStrings.opponentUnavailable, style: theme.errorStyle, textAlign: TextAlign.center),
        _StatusAction(label: BoardStrings.restartAction, onTap: onRestartRequested),
        MarkSelector(onMarkSelected: onMarkSelected, selectedMark: state.playerMark),
      ],
    );
  }
}

class _StatusAction extends ConsumerWidget {
  final String label;
  final VoidCallback onTap;

  const _StatusAction({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(boardThemeProvider);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.cellColor,
          borderRadius: BorderRadius.circular(TacticsRadius.pill),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: TacticsSpacing.spacing400,
            vertical: TacticsSpacing.spacing200,
          ),
          child: Text(label, style: theme.statusStyle.copyWith(fontSize: 14)),
        ),
      ),
    );
  }
}
