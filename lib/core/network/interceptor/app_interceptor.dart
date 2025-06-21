import 'dart:ui' as ui;

import 'package:dio/dio.dart';
import 'package:smart_meal/core/app_constant.dart';
import 'package:smart_meal/core/services/shared_prefrence/cach_helper.dart';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final lang =
        ui.PlatformDispatcher.instance.locale.languageCode == 'ar'
            ? 'ar'
            : 'en';
    options.headers.addAll({
      "Content-Type": "application/json",
      "Authorization":
          "Bearer ${CachHelper.getData(key: AppConstant.tokenKey)}",

      "Accept-Language": lang,
    });

    super.onRequest(options, handler);
  }
}
