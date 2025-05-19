import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/network/api_endpoint.dart';
import '../model/register_error_model/register_error_handler.dart';
import '../model/register_error_model/register_error_model.dart';
import '../model/register_request/register_model_request.dart';

class RegisterRepo {
  RegisterRepo({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<Either<RegisterErrorModel, Unit>> createUser(
    RegisterModelRequest data,
  ) async {
    try {
      await _dio.post(ApiEndpoint.register, data: data.toJson());
      return right(unit);
    } catch (e) {
      return left(RegisterErrorHandler.handle(e));
    }
  }
}
