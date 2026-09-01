import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_dio_data/src/dio_exception_mapper.dart';
import 'package:network_domain/network_domain.dart';
import 'package:shouldly/shouldly.dart';

final _options = RequestOptions(path: '/eventsday.php', connectTimeout: const Duration(seconds: 15));

DioException _exception(DioExceptionType type, {Object? error, int? statusCode}) => DioException(
  requestOptions: _options,
  type: type,
  error: error,
  response: statusCode == null ? null : Response<dynamic>(requestOptions: _options, statusCode: statusCode),
);

void main() {
  group('Translating HTTP library failures into the domain', () {
    test('a server that does not answer in time becomes a timeout error', () {
      final error = mapDioException(_exception(DioExceptionType.receiveTimeout));

      error.should.beOfType<NetworkTimeoutError>();
      (error as NetworkTimeoutError).timeout.should.be(const Duration(seconds: 15));
    });

    test('a device with no connection becomes a no-internet error', () {
      final error = mapDioException(
        _exception(DioExceptionType.connectionError, error: const SocketException('no route')),
      );

      error.should.beOfType<NetworkNoInternetError>();
    });

    test('a backend 500 becomes a server error', () {
      final error = mapDioException(_exception(DioExceptionType.badResponse, statusCode: 503));

      error.should.beOfType<NetworkServerError>();
      (error as NetworkServerError).statusCode.should.be(503);
    });

    test('an exceeded quota becomes a client error', () {
      final error = mapDioException(_exception(DioExceptionType.badResponse, statusCode: 429));

      error.should.beOfType<NetworkClientError>();
      (error as NetworkClientError).statusCode.should.be(429);
    });

    test('an unidentified failure stays an unknown network error', () {
      final error = mapDioException(_exception(DioExceptionType.unknown));

      error.should.beOfType<NetworkUnknownError>();
    });
  });
}
