import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/style/app_color.dart';
import 'package:smart_meal/module/shred_widget/custom_item_meal.dart';

class HomeSection5 extends StatelessWidget {
  const HomeSection5({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      width: double.infinity,
      height: mediaQuery.size.height * 0.56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        color: AppColor.white,
      ),
      child: Column(
        children: [
          SizedBox(height: mediaQuery.size.height * 0.045),
          Text(
            "Top Rated Meals",
            style: theme.textTheme.bodyMedium!.copyWith(
              color: AppColor.black,
              fontSize: 22.sp,
            ),
          ),
          SizedBox(height: mediaQuery.size.height * 0.004),
          Text(
            "Updated Everyday",
            style: theme.textTheme.bodyMedium!.copyWith(
              color: Colors.brown,
              fontSize: 22.sp,
            ),
          ),
          SizedBox(height: mediaQuery.size.height * 0.05),
          Row(
            spacing: 10.w,
            mainAxisAlignment: MainAxisAlignment.center,
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
          SizedBox(height: mediaQuery.size.height * 0.037),
          InkWell(
            onTap: () {},
            child: Image.asset(
              'assets/images/elevatebottun.png',

              width: mediaQuery.size.width * 0.7,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
