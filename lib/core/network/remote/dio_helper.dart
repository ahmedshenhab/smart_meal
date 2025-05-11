// ignore_for_file: avoid_redundant_argument_values

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:smart_meal/core/app_constant.dart';
import 'package:smart_meal/core/network/local/shared_pref/cach_helper.dart';
import 'package:smart_meal/core/network/remote/api_endpoint.dart';

class DioHelper {
  DioHelper._();
  static Dio? _dio;

  static Dio get init {
    {
      if (_dio == null) {

        _dio = Dio(
          BaseOptions(
            receiveDataWhenStatusError: true,
            
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
            headers: {
              'Content-Type': 'application/json',


              'Authorization': 'Bearer ${CachHelper.getData(key: AppConstant.tokenKey)}',
                 

            },

            baseUrl: ApiEndpoint.baseUrl,
          ),
        );

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

        log('Dio initialized successfully');

        return _dio!;
      }

      return _dio!;
    }
  }
}
