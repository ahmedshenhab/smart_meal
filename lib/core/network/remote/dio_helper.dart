import 'dart:developer';

import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static void  get init {
    BaseOptions baseOptions = BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: 'https://student.valuxapps.com/api/');
    dio = Dio(baseOptions);
    log('init dio succsessfully');
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json'
    };
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
    Map<String, dynamic>? data,
  }) async {
    try {
      dio!.options.headers = {
        'lang': lang,
        'Authorization': token ?? '',
        'Content-Type': 'application/json'
      };
      return await dio!.post(
        url,
        queryParameters: query,
        data: data,
      );
    } catch (e) {
      log('Error posting data: $e');
      rethrow;
    }
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
    Map<String, dynamic>? data,
  }) async {
    try {
      dio!.options.headers = {
        'lang': lang,
        'Authorization': token ?? '',
        'Content-Type': 'application/json'
      };
      return await dio!.put(
        url,
        queryParameters: query,
        data: data,
      );
    } catch (e) {
      log('Error posting data: $e');
      rethrow;
    }
  }
}
