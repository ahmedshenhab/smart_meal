import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/style/app_color.dart';
import 'package:smart_meal/module/shred_widget/custom_item_meal.dart';

class HomeSection4 extends StatelessWidget {
  const HomeSection4({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);

    return Container(
      height: mediaQuery.size.height * 0.55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        color: AppColor.brownBurn,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Made Just  For\nYou",
            style: theme.textTheme.bodyMedium!.copyWith(
              color: AppColor.white,
              fontSize: 22.sp,
            ),
            textAlign: TextAlign.center,
          ),

          Text(
            "Recommended Meals",
            style: theme.textTheme.bodyMedium!.copyWith(
              color: Colors.deepOrange,
              fontSize: 22.sp,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: mediaQuery.size.height * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomItemMeal(
                boxShadow: BoxShadow(
                  color: AppColor.black.withValues(alpha: 0.25),
                  offset: Offset(0.w, 5.h),
                  blurRadius: 4,
                  spreadRadius: 5,
                ),

                color1: AppColor.deepOrange,

                color2: AppColor.white,
              ),
              CustomItemMeal(
                boxShadow: BoxShadow(
                  color: AppColor.black.withValues(alpha: 0.25),
                  offset: Offset(0.w, 5.h),
                  blurRadius: 4,
                  spreadRadius: 5,
                ),
                color1: AppColor.deepOrange,

                color2: AppColor.white,
              ),
            ],
          ),
          SizedBox(height: 19.h),
          InkWell(
            onTap: () {},
            child: Image.asset(
              'assets/images/elevatebottun.png',

              width: mediaQuery.size.width * 0.7,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
