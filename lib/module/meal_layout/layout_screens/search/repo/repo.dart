import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_meal/core/network/remote/api_endpoint.dart';
import 'package:smart_meal/core/network/remote/api_error_handler.dart';
import 'package:smart_meal/core/network/remote/api_error_model.dart';
import 'package:smart_meal/module/meal_layout/data/model/meals_model.dart';

class SearchByMealRepo {
  SearchByMealRepo({required Dio dio}) : _dio = dio;
  final Dio _dio;

  Future<Either<ApiErrorModel, List<MealsModel>>> searchByMeal(
    String mealName,
  ) async {
    try {
      final result = await _dio.get("${ApiEndpoint.searchFoodByName}$mealName");

      final searchByMealResponseModel = MealsModel.fromList(
        result.data as List<dynamic>,
      );
      log(searchByMealResponseModel.length.toString());

      return right(searchByMealResponseModel);
    } catch (e) {
      log('Error: $e');
      return left(ApiErrorHandler.handle(e));
    }
  }
}
