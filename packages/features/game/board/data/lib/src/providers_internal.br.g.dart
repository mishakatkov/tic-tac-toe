// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_internal.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(defaultOpponentThinkingTime)
final defaultOpponentThinkingTimeProvider =
    DefaultOpponentThinkingTimeProvider._();

final class DefaultOpponentThinkingTimeProvider
    extends $FunctionalProvider<Duration, Duration, Duration>
    with $Provider<Duration> {
  DefaultOpponentThinkingTimeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'defaultOpponentThinkingTimeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$defaultOpponentThinkingTimeHash();

  @$internal
  @override
  $ProviderElement<Duration> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Duration create(Ref ref) {
    return defaultOpponentThinkingTime(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Duration value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Duration>(value),
    );
  }
}

String _$defaultOpponentThinkingTimeHash() =>
    r'69c35af4a2bdf9f8a45a62b7122990f69613b137';

@ProviderFor(opponentDataSource)
final opponentDataSourceProvider = OpponentDataSourceProvider._();

final class OpponentDataSourceProvider
    extends
        $FunctionalProvider<
          LocalOpponentDataSource,
          LocalOpponentDataSource,
          LocalOpponentDataSource
        >
    with $Provider<LocalOpponentDataSource> {
  OpponentDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'opponentDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$opponentDataSourceHash();

  @$internal
  @override
  $ProviderElement<LocalOpponentDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalOpponentDataSource create(Ref ref) {
    return opponentDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalOpponentDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalOpponentDataSource>(value),
    );
  }
}

String _$opponentDataSourceHash() =>
    r'ad9a08f3b6bfb5d29a15fe9b16fb74b8052b946c';
