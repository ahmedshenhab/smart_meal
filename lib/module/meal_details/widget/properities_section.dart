import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_meal/generated/l10n.dart';
import '../../../core/ui/style/app_color.dart';
import '../cubit/meal_detail_cubit.dart';
import 'costom_read_more_text.dart';
import 'properity_meal.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    final cubit = MealDetailCubit.get(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,

                cubit.mealsModel.recipeName ?? 'defult',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 27.sp,
                ),
              ),
            ),
            SvgPicture.asset(
              'assets/images/Sun.svg',
              height: 20.h,
              width: 20.w,
            ),
          ],
        ),

        SizedBox(height: 10.h),
        Visibility(
          visible: cubit.isdinger,
          child: Column(
            children: [
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                localization.dinger,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColor.deepOrange,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),

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
          text: cubit.mealsModel.description ?? 'defult',
        ),

        SizedBox(height: 10.h),
        GridView.count(
          padding: EdgeInsets.zero,
          childAspectRatio: 2.5.w,
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 20.w,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ProperitylItemMeal(
              image: 'assets/images/time.png',
              title:
                  '${MealDetailCubit.get(context).mealsModel.time ?? '0'} ${localization.minute}',
            ),

            ProperitylItemMeal(
              image: 'assets/images/cal.png',
              title:
                  '${MealDetailCubit.get(context).mealsModel.calories100g ?? '0'} ${localization.calories}',
            ),
            ProperitylItemMeal(
              image: 'assets/images/protien.png',
              title:
                  '${MealDetailCubit.get(context).mealsModel.protein100g ?? '0'} ${localization.protein}',
            ),
            ProperitylItemMeal(
              image: 'assets/images/carb.png',
              title:
                  '${MealDetailCubit.get(context).mealsModel.carb100 ?? '0'} ${localization.carbs}',
            ),
            ProperitylItemMeal(
              image: 'assets/images/suger.png',
              title:
                  '${MealDetailCubit.get(context).mealsModel.sugar100g ?? '0'} ${localization.sugar}',
            ),
            ProperitylItemMeal(
              image: 'assets/images/fat.png',
              title:
                  '${MealDetailCubit.get(context).mealsModel.fat100g ?? '0'} ${localization.fats}',
            ),
          ],
        ),
      ],
    );
  }
}
