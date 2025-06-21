import 'dart:developer' as loger;
import 'dart:math';
import 'dart:ui' as ui;

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_meal/core/services/sql/sqldb.dart';
import 'package:smart_meal/core/network/api_endpoint.dart';
import 'package:smart_meal/core/network/api_error_handler.dart';
import 'package:smart_meal/core/network/api_error_model.dart';
import 'package:smart_meal/module/meal_layout/data/model/meals_model.dart';

class RepoRecommendation {
  RepoRecommendation({required DatabaseHelper databaseHelper, required Dio dio})
    : _dio = dio,
      _databaseHelper = databaseHelper;

  final Dio _dio;
  final DatabaseHelper _databaseHelper;

  Future<Either<ApiErrorModel, List<MealsModel>>> getRecommendation() async {
    try {
      final mealNames = await _databaseHelper.getAllNames();

      if (mealNames.isEmpty) {
        return right([]);
      }

      // Filter based on language
      final filteredNames =
          mealNames.where((element) {
            final name = element.name ?? '';
            if (ui.PlatformDispatcher.instance.locale.languageCode == 'ar') {
              // Arabic letters

              return RegExp(r'[\u0600-\u06FF]').hasMatch(name);
            } else {
              // English letters
              loger.log('1');
              return RegExp(r'[a-zA-Z]').hasMatch(name);
            }
          }).toList();

      if (filteredNames.isEmpty) {
        return right([]);
      }

      final randomIndex = Random().nextInt(filteredNames.length);
      final mealName = filteredNames[randomIndex].name ?? 'chicken';

      // loger.log( 'ddddddd$mealName');

      final result = await _dio.get("${ApiEndpoint.searchFoodByName}$mealName");

      return right(MealsModel.fromList(result.data));
    } catch (e) {
      return left(ApiErrorHandler.handle(e));
    }
  }
}
