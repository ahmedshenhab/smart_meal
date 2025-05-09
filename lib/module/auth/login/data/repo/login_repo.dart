
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_meal/core/network/remote/api_endpoint.dart';
import 'package:smart_meal/module/auth/login/data/model/login_error_model/login_error_handler.dart';
import 'package:smart_meal/module/auth/login/data/model/login_error_model/login_error_model.dart';
import 'package:smart_meal/module/auth/login/data/model/login_request/login_model_request.dart';
import 'package:smart_meal/module/auth/login/data/model/login_response/login_model_response.dart';

class LoginRepo {
  LoginRepo({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<Either<LoginErrorModel, LoginModelResponse>> loginUser(
    LoginModelRequest data,
  ) async {
    try {
      final result = await _dio.post(ApiEndpoint.login, data: data.toJson());
      

      return right(LoginModelResponse.fromJson(result.data));
    } catch (e) {
      

      return left(LoginErrorHandler.handle(e));
    }
  }
}
