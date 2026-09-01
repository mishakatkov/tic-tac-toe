import 'package:auto_route/auto_route.dart';
import 'package:board_presentation/src/board_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'board_router.br.gr.dart';

@AutoRouterConfig()
abstract class BoardRouter extends RootStackRouter {}

@RoutePage(name: 'BoardRoute')
class BoardPage extends ConsumerWidget {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => const BoardScreen();
}
