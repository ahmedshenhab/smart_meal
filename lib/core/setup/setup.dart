import 'dart:ui' as ui;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smart_meal/core/network/interceptor/app_interceptor.dart';
import 'package:smart_meal/core/network/interceptor/logger_interceptor.dart';
import 'package:smart_meal/core/services/shared_prefrence/cach_helper.dart';
import 'package:smart_meal/module/recommendation_meal_screen/data/repo.dart';
import '../app_constant.dart';
import '../services/sql/sqldb.dart';
import '../network/dio_helper.dart';
import '../observer/observer.dart';
import '../../module/auth/login/data/repo/login_repo.dart';
import '../../module/auth/login/meal_login_screen.dart';
import '../../module/auth/register/data/repo/register_repo.dart';
import '../../module/meal_layout/data/repo/repo_layout.dart.dart';
import '../../module/meal_layout/layout_screens/meal_layout_screen.dart';
import '../../module/meal_layout/layout_screens/search/data/repo/repo.dart';

final GetIt getIt = GetIt.instance;

setupGetIt() {
  getIt.registerLazySingleton<AppInterceptor>(() => AppInterceptor());
  getIt.registerLazySingleton<LoggerInterceptor>(() => LoggerInterceptor());
  getIt.registerLazySingleton<Dio>(() => DioHelper.init);
  getIt.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  getIt.registerLazySingleton<RepoRecommendation>(
    () => RepoRecommendation(
      databaseHelper: getIt<DatabaseHelper>(),
      dio: getIt<Dio>(),
    ),
  );

  // login

  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(dio: getIt<Dio>()));

  // register
  getIt.registerLazySingleton(() => RegisterRepo(dio: getIt<Dio>()));

  // searchbyname
  getIt.registerLazySingleton(() => SearchByMealRepo(dio: getIt<Dio>()));
  //searchbyingrediant
  getIt.registerLazySingleton(() => RepoLayout(dio: getIt<Dio>()));
}

Future<void> setupApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getTemporaryDirectory()).path,
    ),
  );

  await Future.wait([
    CachHelper.init,
    ScreenUtil.ensureScreenSize(),
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]),
  ]);
  CachHelper.setData(
    key: AppConstant.lang,
    value: ui.PlatformDispatcher.instance.locale.languageCode,
  );

  setupGetIt();
}

String get getIntialRoute {
  final token = CachHelper.getData(key: AppConstant.tokenKey);
  if (token != null && token.isNotEmpty) {
    return MealLayoutScreen.homeScreen;
  } else {
    return MealLoginScreen.loginScreen;
  }
}
