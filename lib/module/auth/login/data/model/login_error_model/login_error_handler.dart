import 'dart:developer';

import 'package:dio/dio.dart';

import 'login_error_model.dart';

class LoginErrorHandler implements Exception {
  // late LoginErrorModel apiErrorModel;

  static LoginErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return LoginErrorModel(message: 'connection to server failed');

        case DioExceptionType.connectionTimeout:
          return LoginErrorModel(message: 'connection timed out with server');

        case DioExceptionType.cancel:
          return LoginErrorModel(message: 'request to server was cancelled');

        case DioExceptionType.receiveTimeout:
          return LoginErrorModel(message: 'receive timeout with server');

        case DioExceptionType.unknown:
          return LoginErrorModel(
            message: ' connection to server failed due to internet connection',
          );

        case DioExceptionType.sendTimeout:
          return LoginErrorModel(message: 'send timeout with server');

        case DioExceptionType.badResponse:
          return _handleError(error);

        default:
          return LoginErrorModel(message: 'something went wrong');
      }
    } else {
      return LoginErrorModel(message: 'unknown error occured');
    }
  }
}

LoginErrorModel _handleError(dynamic e) {
  if (e is DioException) {
    log('error from server ${e.response?.statusCode}');
    log('error from server ${e.response!.data}');
    log('error from server ${e.response!.requestOptions.path}');
    log('error  server ${e.response!.requestOptions.uri}');
  }

  return LoginErrorModel(message: 'error from server ');
}
