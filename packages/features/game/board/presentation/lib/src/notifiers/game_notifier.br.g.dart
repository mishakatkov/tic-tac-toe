// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_notifier.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GameNotifier)
final gameProvider = GameNotifierProvider._();

final class GameNotifierProvider
    extends $NotifierProvider<GameNotifier, GameState> {
  GameNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gameProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gameNotifierHash();

  @$internal
  @override
  GameNotifier create() => GameNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GameState>(value),
    );
  }
}

String _$gameNotifierHash() => r'8b0bc956dd56aed515d8bd59e1cffa4a97fb9290';

abstract class _$GameNotifier extends $Notifier<GameState> {
  GameState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<GameState, GameState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GameState, GameState>,
              GameState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
