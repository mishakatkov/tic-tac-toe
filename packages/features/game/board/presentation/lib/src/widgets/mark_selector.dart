import 'package:board_domain/board_domain.dart';
import 'package:board_presentation/src/l10n/board_strings.dart';
import 'package:board_presentation/src/providers_di.br.dart';
import 'package:board_presentation/src/theme/mark_color_extension.dart';
import 'package:board_presentation/src/widgets/mark_glyph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tactics_components/tactics_components.dart';

/// Crosses first, because crosses open the game: picking circles hands the first
/// move to the computer.
const _selectableMarks = [Mark.cross, Mark.circle];

class MarkSelector extends ConsumerWidget {
  final void Function(Mark mark) onMarkSelected;
  final Mark selectedMark;

  const MarkSelector({required this.onMarkSelected, required this.selectedMark, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusStyle = ref.watch(boardThemeProvider.select((theme) => theme.statusStyle));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: TacticsSpacing.spacing200,
      children: [
        Text(BoardStrings.sideLabel, style: statusStyle.copyWith(fontSize: 14)),
        for (final mark in _selectableMarks)
          _MarkOption(
            mark: mark,
            onTap: () => onMarkSelected(mark),
            selected: mark == selectedMark,
          ),
      ],
    );
  }
}

class _MarkOption extends ConsumerWidget {
  final Mark mark;
  final VoidCallback onTap;
  final bool selected;

  const _MarkOption({required this.mark, required this.onTap, required this.selected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(boardThemeProvider);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: selected ? theme.colorOf(mark) : theme.gridColor),
          borderRadius: BorderRadius.circular(TacticsRadius.sm),
          color: selected ? theme.cellColor : theme.backgroundColor,
        ),
        child: SizedBox.square(
          dimension: theme.sideOptionSize,
          child: MarkGlyph(mark: mark),
        ),
      ),
    );
  }
}
