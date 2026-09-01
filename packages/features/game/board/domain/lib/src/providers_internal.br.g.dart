// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_internal.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dummyInternalBoardDomain)
final dummyInternalBoardDomainProvider = DummyInternalBoardDomainProvider._();

final class DummyInternalBoardDomainProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  DummyInternalBoardDomainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dummyInternalBoardDomainProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dummyInternalBoardDomainHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return dummyInternalBoardDomain(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$dummyInternalBoardDomainHash() =>
    r'481347d573bd9575ae33f99388759ff40db70dc7';
