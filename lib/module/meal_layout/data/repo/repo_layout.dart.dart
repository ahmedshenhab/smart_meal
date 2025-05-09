import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_meal/core/app_constant.dart';
import 'package:smart_meal/core/network/local/shared_pref/cach_helper.dart';
import 'package:smart_meal/core/network/remote/api_endpoint.dart';
import 'package:smart_meal/core/network/remote/api_error_handler.dart';
import 'package:smart_meal/core/network/remote/api_error_model.dart';
import 'package:smart_meal/module/meal_layout/data/model/ingradiant_id_model.dart';
import 'package:smart_meal/module/meal_layout/data/model/meals_model.dart';

class MealsParser {
  static List<MealsModel> parse(dynamic data) {
    return MealsModel.fromList(data);
  }
}

class RepoLayout {
  RepoLayout({required this.dio});

  final Dio dio;

  Future<Either<ApiErrorModel, List<MealsModel>>> getAllMeal() async {
    try {
      final result = await dio.get(ApiEndpoint.getAllMeal);

      // Parse in background thread
      final parsedMeals = await compute(MealsParser.parse, result.data);

      return right(parsedMeals);
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

        data: json.encode(ingredientId),
      );

      final searchByMealResponseModel = MealsModel.fromList(resuilt2.data);
      return right(searchByMealResponseModel);
    } catch (e) {
      log('Error: $e');

      return left(ApiErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, String>> addFavorite(int mealId) async {
    try {
      final result = await dio.post(
        '${ApiEndpoint.addFavorite}$mealId',
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${CachHelper.getData(key: AppConstant.tokenKey)}',
          },
        ),
      );
      return right((result.data['message']) as String);
    } catch (e) {
      log('Error: $e');
      if (e is DioException) {
        if (e.response?.statusCode == 400) {
          return left(ApiErrorModel(message: e.response.toString()));
        }
      }

      return left(ApiErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, List<MealsModel>>> getFavorite() async {
    try {
      final result = await dio.get(
        ApiEndpoint.getAllFavorite,
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${CachHelper.getData(key: AppConstant.tokenKey)}',
          },
        ),
      );
      final searchByMealResponseModel = MealsModel.fromList(result.data);
      return right(searchByMealResponseModel);
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 404) {
          log(e.response.toString());
          return left(ApiErrorModel(message: e.response!.data.toString()));
        }
      }
      log('Error: $e');
      return left(ApiErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, String>> deleteFavoriteById(int mealId) async {
    try {
      await dio.delete(
        '${ApiEndpoint.deleteFavoriteId}$mealId',
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${CachHelper.getData(key: AppConstant.tokenKey)}',
          },
        ),
      );
      return right(('Deleted Successfully'));
    } catch (e) {
      log('Error: $e');
      if (e is DioException) {
        if (e.response?.statusCode == 404) {
          return left(
            ApiErrorModel(message: e.response!.data['title'].toString()),
          );
        }
      }
      return left(ApiErrorHandler.handle(e));
    }
  }
}
