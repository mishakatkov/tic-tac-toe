import 'dart:developer' as developer;

import 'package:app_providers/src/package_name.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Logs every provider life-cycle event, so the graph can be followed in
/// DevTools' Logging view.
///
/// Riverpod's own DevTools inspector only ships from `riverpod` 3.3.2, and this
/// workspace resolves 3.2.1 — a timeline of changes stands in for a live provider
/// tree until that upgrade happens. Wire it in debug builds only: it logs on
/// every state change.
final class LoggingProviderObserver extends ProviderObserver {
  const LoggingProviderObserver();

  @override
  void didAddProvider(ProviderObserverContext context, Object? value) => _log('+ ${_nameOf(context)} = $value');

  @override
  void didUpdateProvider(ProviderObserverContext context, Object? previousValue, Object? newValue) =>
      _log('~ ${_nameOf(context)}\n    was $previousValue\n    now $newValue');

  @override
  void providerDidFail(ProviderObserverContext context, Object error, StackTrace stackTrace) => developer.log(
    '! ${_nameOf(context)} failed',
    name: packageName,
    error: error,
    stackTrace: stackTrace,
  );

  @override
  void didDisposeProvider(ProviderObserverContext context) => _log('- ${_nameOf(context)}');
}

/// Generated providers carry their own name; a hand-written one may not.
String _nameOf(ProviderObserverContext context) => context.provider.name ?? '${context.provider.runtimeType}';

void _log(String message) => developer.log(message, name: packageName);
