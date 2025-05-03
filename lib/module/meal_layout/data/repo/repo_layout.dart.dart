import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_meal/core/network/remote/api_endpoint.dart';
import 'package:smart_meal/core/network/remote/api_error_handler.dart';
import 'package:smart_meal/core/network/remote/api_error_model.dart';
import 'package:smart_meal/module/meal_layout/data/model/ingradiant_id_model.dart';
import 'package:smart_meal/module/meal_layout/data/model/meals_model.dart';

class RepoLayout {
  RepoLayout({required this.dio});

  final Dio dio;

  Future<Either<ApiErrorModel, List<MealsModel>>> getAllMeal(
   
  ) async {
    try {
      final result = await dio.get(ApiEndpoint.getAllMeal);

      final searchByMealResponseModel = MealsModel.fromList(
        result.data,
      );

      return right(searchByMealResponseModel);
    } catch (e) {
      log('Error: $e');
      return left(ApiErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, List<MealsModel>>> searchByIngrediant(
    String name,
  ) async {
    try {
      final result1 = await dio.get('${ApiEndpoint.getIngrediantId}$name');

      final ingredientId = IngredientIdsModel.fromJson(result1.data).ids;

      final resuilt2 = await dio.post(
        ApiEndpoint.searchByIngrediantId,
        options: Options(headers: {'accept': 'text/plain'}),

        data: json.encode(ingredientId),
      );

      final searchByMealResponseModel = MealsModel.fromList(resuilt2.data);
      return right(searchByMealResponseModel);
    } catch (e) {
      log('Error: $e');

      return left(ApiErrorHandler.handle(e));
    }
  }
}
