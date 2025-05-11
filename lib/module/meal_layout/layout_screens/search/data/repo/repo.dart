import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../../core/network/remote/api_endpoint.dart';
import '../../../../../../core/network/remote/api_error_handler.dart';
import '../../../../../../core/network/remote/api_error_model.dart';
import '../../../../data/model/meals_model.dart';

class SearchByMealRepo {
  SearchByMealRepo({required Dio dio}) : _dio = dio;
  final Dio _dio;

  Future<Either<ApiErrorModel, List<MealsModel>>> searchByMeal(
    String mealName,
  ) async {
    try {
      final result = await _dio.get("${ApiEndpoint.searchFoodByName}$mealName");

      final searchByMealResponseModel = MealsModel.fromList(
        result.data ,
      );
   

      return right(searchByMealResponseModel);
    } catch (e) {
      log('Error: $e');
      return left(ApiErrorHandler.handle(e));
    }
  }
}
