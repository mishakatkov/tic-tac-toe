// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(opponentRepository)
final opponentRepositoryProvider = OpponentRepositoryProvider._();

final class OpponentRepositoryProvider
    extends
        $FunctionalProvider<
          OpponentRepository,
          OpponentRepository,
          OpponentRepository
        >
    with $Provider<OpponentRepository> {
  OpponentRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'opponentRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$opponentRepositoryHash();

  @$internal
  @override
  $ProviderElement<OpponentRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OpponentRepository create(Ref ref) {
    return opponentRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OpponentRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OpponentRepository>(value),
    );
  }
}

String _$opponentRepositoryHash() =>
    r'1659ac52a8872dd378342d28afad4092b8cdb052';
