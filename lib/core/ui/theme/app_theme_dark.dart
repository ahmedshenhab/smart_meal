import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/ui/style/app_color.dart';

class AppThemeDark {

   static ThemeData darkTheme = ThemeData(
    brightness:  Brightness.dark,
    scaffoldBackgroundColor:  AppColor.black,
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
    textTheme: TextTheme(
      
      bodyMedium: TextStyle(
        fontFamily: 'cambria',
        fontSize: 22.sp,
        height: 1.3,
        fontWeight: FontWeight.bold,
        color: AppColor.deepOrange,
      ),
    ),
  );

  
}