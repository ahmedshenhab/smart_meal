// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/style/app_color.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/home/widget/home_section4.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/home/widget/home_section5.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/home/widget/home_section1.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/home/widget/home_section2.dart';

import 'widget/home_section3.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          color: AppColor.scaffoldBackgroundheavy,
        ),
        margin: EdgeInsets.only(
          left: mediaQuery.size.width * 0.02,
          right: mediaQuery.size.width * 0.02,
          top: mediaQuery.size.height * 0.02,
        ),
        padding: EdgeInsets.only(
          left: mediaQuery.size.width * 0.02,
          right: mediaQuery.size.width * 0.02,
          top: mediaQuery.size.height * 0.02,
        ),
        child: Column(
          children: [
            ///1
            const HomeSection1(),
            const SizedBox(height: 20),

            //2
            const HomeSection2(),

            ////3
            const SizedBox(height: 20),
             HomeSection3(),
            const SizedBox(height: 20),

            ////4
            const HomeSection4(),
            ////5
            const SizedBox(height: 20),
            const HomeSection5(),
            SizedBox(height: mediaQuery.size.height * 0.02),
          ],
        ),
      ),
    );
  }
}
