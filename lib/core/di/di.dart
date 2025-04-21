import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_meal/core/network/remote/dio_helper.dart';
import 'package:smart_meal/module/auth/login/data/repo/login_repo.dart';
import 'package:smart_meal/module/auth/register/data/repo/register_repo.dart';

final GetIt getIt = GetIt.instance;

setupGetIt() {
  getIt.registerLazySingleton<Dio>(() => DioHelper.init);

  // login

  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(dio: getIt<Dio>()));

  // register
  getIt.registerLazySingleton(() => RegisterRepo(dio: getIt<Dio>()));
}
