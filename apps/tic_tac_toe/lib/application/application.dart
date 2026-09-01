import 'package:app_providers/app_providers.dart';
import 'package:app_router/app_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tactics_providers/tactics_providers.dart';

// The observer is debug-only: it logs on every provider change.
Widget buildApplication() => ProviderScope(
  observers: const [if (kDebugMode) LoggingProviderObserver()],
  overrides: appProviders(),
  child: const _AppWidget(),
);

class _AppWidget extends ConsumerWidget {
  const _AppWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = ref.watch(tacticsPaletteProvider);

    return MaterialApp.router(
      title: 'Tic Tac Toe',
      debugShowCheckedModeBanner: false,
      routerConfig: ref.watch(appRouterProvider).config(),
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: palette.bgPage,
        fontFamily: palette.fontBrand,
      ),
      // Features never mount a Scaffold: composition supplies the Material ancestor
      // and the system bar style once for the whole app.
      builder: (context, child) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Material(color: palette.bgPage, child: child),
      ),
    );
  }
}
