import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_configurations.br.freezed.dart';

/// Family parameter of `httpClientProvider`: each data source asks for a client
/// configured for *its* backend, without ever building that client.
@freezed
sealed class HttpClientConfiguration with _$HttpClientConfiguration {
  const factory HttpClientConfiguration({
    required String baseUrl,
    @Default(Duration(seconds: 15)) Duration connectTimeout,
    @Default(Duration(seconds: 15)) Duration receiveTimeout,
  }) = _HttpClientConfiguration;
}
