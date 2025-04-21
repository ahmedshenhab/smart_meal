import 'package:dio/dio.dart';

import 'register_error_model.dart';

class RegisterErrorHandler implements Exception {
  static RegisterErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return RegisterErrorModel(detail: 'connection to server failed');

        case DioExceptionType.connectionTimeout:
          return RegisterErrorModel(detail: 'connection timed out with server');

        case DioExceptionType.cancel:
          return RegisterErrorModel(detail: 'request to server was cancelled');

        case DioExceptionType.receiveTimeout:
          return RegisterErrorModel(detail: 'receive timeout with server');

        case DioExceptionType.unknown:
          return RegisterErrorModel(
            detail: ' connection to server failed due to internet connection',
          );

        case DioExceptionType.sendTimeout:
          return RegisterErrorModel(detail: 'send timeout with server');

        case DioExceptionType.badResponse:
          return _handleError(error);

        default:
          return RegisterErrorModel(detail: 'something went wrong');
      }
    } else {
      return RegisterErrorModel(detail: 'unknown error occured');
    }
  }
}

RegisterErrorModel _handleError(dynamic e) {
  if (e is DioException) {
    if (e.response?.statusCode == 400) {
      return RegisterErrorModel.fromMap(e.response!.data);
    }
  }

  return RegisterErrorModel(
    detail: ' something went wrong try change password or email',
  );
}
