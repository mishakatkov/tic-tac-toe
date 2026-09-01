import 'package:dio/dio.dart';
import 'package:network_dio_data/src/dio_http_client.dart';
import 'package:network_domain/network_domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

/// Binds the Dio implementation onto the `httpClientProvider` contract. It is the
/// package's only override: swapping the HTTP library touches no feature.
List<Override> bindProviders() => [
  httpClientProvider.overrideWith(
    (Ref ref, HttpClientConfiguration configuration) => DioHttpClient(dio: Dio(), configuration: configuration),
  ),
];
