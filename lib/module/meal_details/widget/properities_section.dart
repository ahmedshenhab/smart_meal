import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_meal/core/style/app_color.dart';
import 'package:smart_meal/module/meal_details/widget/costom_read_more_text.dart';
import 'package:smart_meal/module/meal_details/widget/properity_meal.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Farm Fries Salad',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 27.sp,
              ),
            ),
            SvgPicture.asset(
              'assets/images/Sun.svg',
              height: 30.h,
              width: 30.w,
            ),
          ],
        ),

        SizedBox(height: 10.h),

        // Description
        CustomReadMoreText(
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColor.gray.withValues(alpha: 0.8),
            fontSize: 15,
            fontFamily: 'SofiaSans',
            fontWeight: FontWeight.bold,
          ),
          linkStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColor.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'SofiaSans',
            fontSize: 15.5,
          ),
          text:
              'Savor the perfect blend of crispy fries and fresh vegetables, all tossed in a tangy ',
        ),

        SizedBox(height: 10.h),
        GridView.count(
          padding: EdgeInsets.zero,
          childAspectRatio: 2.5.w,
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 20.w,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            ProperitylItemMeal(
              image: 'assets/images/cal.png',
              title: '120 cal',
            ),
            ProperitylItemMeal(
              image: 'assets/images/protien.png',
              title: '20g protein',
            ),
            ProperitylItemMeal(
              image: 'assets/images/carb.png',
              title: '40g carbs',
            ),
            ProperitylItemMeal(
              image: 'assets/images/suger.png',
              title: '0g sugar',
            ),
            ProperitylItemMeal(
              image: 'assets/images/fat.png',
              title: '5g fats',
            ),
          ],
        ),
      ],
    );
  }
}
