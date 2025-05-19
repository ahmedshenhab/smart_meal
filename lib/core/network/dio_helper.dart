// ignore_for_file: avoid_redundant_argument_values

import 'dart:ui' as ui;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:smart_meal/core/app_constant.dart';
import 'package:smart_meal/core/network/api_endpoint.dart';
import 'package:smart_meal/core/services/shared_prefrence/cach_helper.dart';


class DioHelper {
  DioHelper._();
  static Dio? _dio;

  static Dio get init {
    if (_dio == null) {
      _dio = Dio(
        BaseOptions(
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer ${CachHelper.getData(key: AppConstant.tokenKey)}',
          },
          baseUrl: ApiEndpoint.baseUrl,
        ),
      );

      // 🧩 Add custom interceptors
      _dio?.interceptors.add(LanguageInterceptor());

      if (kDebugMode) {
        _dio?.interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: true,
            error: true,
            compact: true,
            maxWidth: 90,
          ),
        );
      }
    }

    return _dio!;
  }
}

class LanguageInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.putIfAbsent(
      'Accept-Language',
      () => ui.PlatformDispatcher.instance.locale.languageCode,
    );

    super.onRequest(options, handler);
  }
}