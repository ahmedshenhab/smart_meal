
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/app_constant.dart';
import 'package:smart_meal/core/di/di.dart';
import 'package:smart_meal/core/network/local/shared_pref/cach_helper.dart';
import 'package:smart_meal/core/routing/router.dart';
import 'package:smart_meal/core/style/app_theme.dart';

void main() async {
 
  await setupApp();
  
  
 log(CachHelper.getData(key: AppConstant.tokenKey)??'');
  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,});
  

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (_, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            darkTheme: AppTheme.darkTheme,
            theme: AppTheme.lighTheme,
            themeMode: ThemeMode.light,
            onGenerateRoute: AppRouter.onGenerateRoute,

            initialRoute: getIntialRoute,
          ),
    );
  }
}
