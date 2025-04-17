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
            "Made Just  For You",
            style: theme.textTheme.bodyMedium!.copyWith(
              color: AppColor.white,
              fontSize: 22.sp,
            ),
            textAlign: TextAlign.center,
          ),
          // SizedBox(height: mediaQuery.size.height * 0.007),
          Text(
            "Recommended Meals",
            style: theme.textTheme.bodyMedium!.copyWith(
              color: Colors.deepOrange,
              fontSize: 22.sp,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: mediaQuery.size.height * 0.05),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomItemMeal(
                color1: AppColor.deepOrange,

                color2: AppColor.white,
                text: 'salad farm fries',
                image: 'assets/images/meal2.png',
              ),
              CustomItemMeal(
                color1: AppColor.deepOrange,

                color2: AppColor.white,
                text: 'salad farm fries',
                image: 'assets/images/meal2.png',
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
