// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/constant/constant.dart';
import 'package:smart_meal/reusable.dart';
import 'package:smart_meal/module/meal_layout/widget/home_section1.dart';
import 'package:smart_meal/module/meal_layout/widget/home_section2.dart';

import '../widget/home_section3.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return SingleChildScrollView(
      // physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.02),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: mediaQuery.size.height * 0.03,
              ),

              ///1
              const HomeSection1(),
              const SizedBox(
                height: 20,
              ),

              //2
              Container(
                width: double.infinity,
                height: mediaQuery.size.height * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.r)),
                  color: Constant.brownBurn,
                ),
                child: const HomeSection2(),
              ),

              ////3
              ///
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: double.infinity,
                  height: mediaQuery.size.height * 0.64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    color: Constant.white,
                  ),
                  child: const HomeSection3())

              ////4

              ,
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: mediaQuery.size.height * 0.62,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.r)),
                  color: Constant.brownBurn,
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: mediaQuery.size.height * 0.05,
                    ),
                    Text(
                      "Made Just  For You",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Constant.white, fontSize: 22.sp),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.014,
                    ),
                    Text(
                      "Recommended Meals",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.deepOrange, fontSize: 22.sp),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildRecomended(
                          mediaQuery: mediaQuery,
                          theme,
                          'salad farm fries',
                          Constant.deepOrange,
                          Constant.white,
                          'assets/images/meal2.png',
                        ),
                        buildRecomended(
                          mediaQuery: mediaQuery,
                          theme,
                          'Fried Chicken',
                          Constant.white,
                          Constant.saveColor,
                          'assets/images/meal1.png',
                        )
                      ],
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.047,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/elevatebottun.png',
                        width: mediaQuery.size.width * 0.7,
                        // height: mediaQuery.size.height * 0.09,
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
                ),
              ),

              ////5

              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: mediaQuery.size.height * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.r)),
                  color: Constant.white,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: mediaQuery.size.height * 0.045,
                    ),
                    Text(
                      "Top Rated Meals",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: Constant.black,
                        fontSize: 22.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.02,
                    ),
                    Text(
                      "Updated Everyday",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: Colors.brown,
                        fontSize: 22.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildRecomended(
                          mediaQuery: mediaQuery,
                          theme,
                          'salad farm fries',
                          Constant.deepOrange,
                          Constant.white,
                          'assets/images/meal2.png',
                          boxShadow: BoxShadow(
                            color: Constant.shadow.withOpacity(0.25),
                            spreadRadius: 5.r,
                            blurRadius: 4.r,
                            offset: Offset(0, 5.h),
                          ),
                        ),
                        buildRecomended(theme, 'Fried Chicken', Constant.white,
                            Constant.saveColor, 'assets/images/meal1.png',
                            boxShadow: BoxShadow(
                              color: Constant.shadow.withOpacity(0.25),
                              spreadRadius: 5.r,
                              blurRadius: 4.r,
                              offset: Offset(0, 5.h),
                            ),
                            mediaQuery: mediaQuery)
                      ],
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.047,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/elevatebottun.png',
                        width: 250,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: mediaQuery.size.height * 0.02,
              )
            ],
          ),
        ),
      ),
    );
  }
}

