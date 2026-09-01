// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// How long the opponent takes to answer. Defaults to the value below; tests set
/// it to zero rather than waiting.
/// This file is never exported by the package barrel.

@ProviderFor(opponentThinkingTime)
final opponentThinkingTimeProvider = OpponentThinkingTimeProvider._();

/// How long the opponent takes to answer. Defaults to the value below; tests set
/// it to zero rather than waiting.
/// This file is never exported by the package barrel.

final class OpponentThinkingTimeProvider
    extends $FunctionalProvider<Duration, Duration, Duration>
    with $Provider<Duration> {
  /// How long the opponent takes to answer. Defaults to the value below; tests set
  /// it to zero rather than waiting.
  /// This file is never exported by the package barrel.
  OpponentThinkingTimeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'opponentThinkingTimeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$opponentThinkingTimeHash();

  @$internal
  @override
  $ProviderElement<Duration> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Duration create(Ref ref) {
    return opponentThinkingTime(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Duration value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Duration>(value),
    );
  }
}

String _$opponentThinkingTimeHash() =>
    r'85078f7a1d2e959c1933600400ce9d9d63edf22b';
