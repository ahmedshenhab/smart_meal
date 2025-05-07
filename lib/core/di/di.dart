import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_meal/core/network/local/shared_pref/cach_helper.dart';
import 'package:smart_meal/core/network/local/sql/sqldb.dart';
import 'package:smart_meal/core/network/remote/dio_helper.dart';
import 'package:smart_meal/core/observer/observer.dart';
import 'package:smart_meal/module/auth/login/data/repo/login_repo.dart';
import 'package:smart_meal/module/auth/register/data/repo/register_repo.dart';
import 'package:smart_meal/module/meal_layout/data/repo/repo_layout.dart.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/search/data/repo/repo.dart';

final GetIt getIt = GetIt.instance;

setupGetIt() {
  getIt.registerLazySingleton<Dio>(() => DioHelper.init);

  // login

  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(dio: getIt<Dio>()));

  // register
  getIt.registerLazySingleton(() => RegisterRepo(dio: getIt<Dio>()));

  // shopping
  getIt.registerLazySingleton< DatabaseHelper>(() =>  DatabaseHelper());

  // searchbyname
  getIt.registerLazySingleton(() => SearchByMealRepo(dio: getIt<Dio>()));
  //searchbyingrediant
  getIt.registerLazySingleton(() => RepoLayout(dio: getIt<Dio>()));

  
}

Future<void> setupApp() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([CachHelper.init, ScreenUtil.ensureScreenSize()]);

  setupGetIt();
}
