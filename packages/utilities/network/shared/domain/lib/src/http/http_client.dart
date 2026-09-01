import 'package:network_domain/network_domain.dart';

/// Domain-side HTTP contract: no data source knows about Dio.
/// The implementation throws a [NetworkError], never the underlying library's exception.
abstract interface class HttpClient {
  Future<NetworkResponse<T>> get<T>(String path, {Map<String, dynamic>? queryParameters});
}
