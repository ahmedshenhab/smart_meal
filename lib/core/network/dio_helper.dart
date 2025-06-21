// ignore_for_file: avoid_redundant_argument_values

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_meal/core/network/api_endpoint.dart';
import 'package:smart_meal/core/network/interceptor/app_interceptor.dart';
import 'package:smart_meal/core/network/interceptor/logger_interceptor.dart';
import 'package:smart_meal/core/setup/setup.dart';

class DioHelper {
  DioHelper._();
  static Dio? _dio;

  static Dio get init {
    {
      if (_dio == null) {
        _dio = Dio(
          BaseOptions(
            receiveDataWhenStatusError: true,

            connectTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 20),
            sendTimeout: const Duration(seconds: 60),

           

            baseUrl: ApiEndpoint.baseUrl,
          ),
        );
        _dio?.interceptors.add(getIt<AppInterceptor>());

        if (kDebugMode) {
          _dio?.interceptors.add(getIt<LoggerInterceptor>());
        }

        return _dio!;
      }

      return _dio!;
    }
  }
}
