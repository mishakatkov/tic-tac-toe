// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Incoming contract: a concrete implementation (`network_dio_data`) is bound by
/// composition. Features consume this provider, never Dio.

@ProviderFor(httpClient)
final httpClientProvider = HttpClientFamily._();

/// Incoming contract: a concrete implementation (`network_dio_data`) is bound by
/// composition. Features consume this provider, never Dio.

final class HttpClientProvider
    extends $FunctionalProvider<HttpClient, HttpClient, HttpClient>
    with $Provider<HttpClient> {
  /// Incoming contract: a concrete implementation (`network_dio_data`) is bound by
  /// composition. Features consume this provider, never Dio.
  HttpClientProvider._({
    required HttpClientFamily super.from,
    required HttpClientConfiguration super.argument,
  }) : super(
         retry: null,
         name: r'httpClientProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$httpClientHash();

  @override
  String toString() {
    return r'httpClientProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<HttpClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HttpClient create(Ref ref) {
    final argument = this.argument as HttpClientConfiguration;
    return httpClient(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HttpClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HttpClient>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is HttpClientProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$httpClientHash() => r'dd3b8dea28269affaf828b0fa6dd26313fec1897';

/// Incoming contract: a concrete implementation (`network_dio_data`) is bound by
/// composition. Features consume this provider, never Dio.

final class HttpClientFamily extends $Family
    with $FunctionalFamilyOverride<HttpClient, HttpClientConfiguration> {
  HttpClientFamily._()
    : super(
        retry: null,
        name: r'httpClientProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Incoming contract: a concrete implementation (`network_dio_data`) is bound by
  /// composition. Features consume this provider, never Dio.

  HttpClientProvider call(HttpClientConfiguration configuration) =>
      HttpClientProvider._(argument: configuration, from: this);

  @override
  String toString() => r'httpClientProvider';
}
