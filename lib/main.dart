import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/di/di.dart';
import 'package:smart_meal/core/routing/router.dart';
import 'package:smart_meal/core/style/app_theme.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/meal_layout_screen.dart';

void main() async {
  await setupApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

            initialRoute: MealLayoutScreen.homeScreen,
          ),
    );
  }
}
