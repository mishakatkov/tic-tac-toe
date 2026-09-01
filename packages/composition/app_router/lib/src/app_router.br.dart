import 'package:auto_route/auto_route.dart';
import 'package:board_presentation/board_presentation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.br.g.dart';
part 'app_router.br.gr.dart';

enum RoutePath {
  board(path: '/');

  final String path;

  const RoutePath({required this.path});
}

@Riverpod(keepAlive: true)
AppRouter appRouter(Ref _) => AppRouter();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(initial: true, page: BoardRoute.page, path: RoutePath.board.path),
  ];
}
