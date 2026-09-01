/// Normalized network errors: a data source switches on these types, never on
/// `DioException`. This is what makes the HTTP library replaceable.
sealed class NetworkError implements Exception {
  final Object? originalError;

  const NetworkError({this.originalError});

  String get message;

  @override
  String toString() => 'NetworkError: $message';
}

class NetworkTimeoutError extends NetworkError {
  final Duration? timeout;

  const NetworkTimeoutError({this.timeout, super.originalError});

  @override
  String get message => timeout != null ? 'Request timed out after ${timeout!.inSeconds}s' : 'Request timed out';
}

class NetworkConnectionError extends NetworkError {
  final String? reason;

  const NetworkConnectionError({this.reason, super.originalError});

  @override
  String get message => reason ?? 'Connection failed';
}

class NetworkNoInternetError extends NetworkError {
  final String? reason;

  const NetworkNoInternetError({this.reason, super.originalError});

  @override
  String get message => reason ?? 'No internet connection';
}

class NetworkClientError extends NetworkError {
  final int statusCode;
  final String? clientMessage;

  const NetworkClientError({required this.statusCode, this.clientMessage, super.originalError});

  @override
  String get message => clientMessage ?? 'Client error: $statusCode';
}

class NetworkServerError extends NetworkError {
  final int statusCode;
  final String? serverMessage;

  const NetworkServerError({required this.statusCode, this.serverMessage, super.originalError});

  @override
  String get message => serverMessage ?? 'Server error: $statusCode';
}

class NetworkDecodingError extends NetworkError {
  const NetworkDecodingError({super.originalError});

  @override
  String get message =>
      originalError != null ? 'Failed to decode response: $originalError' : 'Failed to decode response';
}

class NetworkCancelledError extends NetworkError {
  final String? reason;

  const NetworkCancelledError({this.reason, super.originalError});

  @override
  String get message => reason ?? 'Request cancelled';
}

class NetworkUnknownError extends NetworkError {
  const NetworkUnknownError({super.originalError});

  @override
  String get message => originalError != null ? 'Unknown network error: $originalError' : 'Unknown network error';
}
