import 'dart:io';

import 'package:dio/dio.dart';
import 'package:network_domain/network_domain.dart';

typedef DioExceptionMapper = NetworkError Function(DioException exception);

/// Boundary between the HTTP library and the domain: past this function, nobody
/// knows about `DioException`.
NetworkError mapDioException(DioException exception) {
  switch (exception.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.transformTimeout:
      return NetworkTimeoutError(
        timeout: exception.requestOptions.connectTimeout ?? exception.requestOptions.receiveTimeout,
        originalError: exception,
      );

    case DioExceptionType.connectionError:
      if (exception.error is SocketException) {
        return NetworkNoInternetError(reason: exception.message, originalError: exception);
      }

      return NetworkConnectionError(reason: exception.message, originalError: exception);

    case DioExceptionType.badResponse:
      final statusCode = exception.response?.statusCode ?? 0;

      if (statusCode >= HttpStatus.internalServerError) {
        return NetworkServerError(
          statusCode: statusCode,
          serverMessage: exception.response?.statusMessage,
          originalError: exception,
        );
      }

      return NetworkClientError(
        statusCode: statusCode,
        clientMessage: exception.response?.statusMessage,
        originalError: exception,
      );

    case DioExceptionType.badCertificate:
      return NetworkConnectionError(reason: 'Bad certificate', originalError: exception);

    case DioExceptionType.cancel:
      return NetworkCancelledError(reason: exception.message ?? 'Request cancelled', originalError: exception);

    case DioExceptionType.unknown:
      return NetworkUnknownError(originalError: exception);
  }
}
