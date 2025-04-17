import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/style/app_color.dart';

class AppTheme {
  static ThemeData lighTheme = ThemeData(
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
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontFamily: 'cambria',
        fontSize: 22.sp,
        height: 1.3,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'cambria',
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        height: 1.3,
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.deepOrange,
    ),
  );
}
