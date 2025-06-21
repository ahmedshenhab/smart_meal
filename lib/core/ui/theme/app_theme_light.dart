import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/ui/style/app_color.dart';

class AppThemeLight {
  static ThemeData lighTheme = ThemeData(
    brightness: Brightness.light,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.scaffoldBackgroundLight,
    ),
    scaffoldBackgroundColor: AppColor.scaffoldBackgroundLight,

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: AppColor.gray.withValues(alpha: 0.3),
          width: 1.3.w,
        ),

        padding: EdgeInsets.symmetric(horizontal: 12.w),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.deepOrange,
        foregroundColor: AppColor.white,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.r),
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom()),

    fontFamily: 'cambria',
    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: AppColor.black,
      fontFamily: 'cambria',
      displayColor: AppColor.black,
    ),
  );
}
