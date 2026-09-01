import 'package:exceptions/exceptions.dart';
import 'package:network_domain/network_domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_di.br.g.dart';

/// Incoming contract: a concrete implementation (`network_dio_data`) is bound by
/// composition. Features consume this provider, never Dio.
@riverpod
HttpClient httpClient(Ref ref, HttpClientConfiguration configuration) {
  throw UnregisteredProviderException(httpClientProvider);
}
