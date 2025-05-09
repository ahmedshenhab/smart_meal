import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/style/app_color.dart';
import 'package:smart_meal/module/meal_layout/cubit/cubit.dart';
import 'package:smart_meal/module/meal_layout/data/model/meals_model.dart';

class CustomItemMealSaved extends StatelessWidget {
  const CustomItemMealSaved({
    super.key,

    // required this.foreground,
    // required this.background,
    this.boxShadow,
    required this.searchByMealResponseModel,
  });

  // final Color foreground;

  // final Color background;
  final BoxShadow? boxShadow;

  final MealsModel searchByMealResponseModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 150.w,
      height: 145.h,

      decoration: BoxDecoration(
        boxShadow: boxShadow != null ? [boxShadow!] : [],
        color: AppColor.white,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Column(
        spacing: 2.h,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.asset(
                  'assets/images/m1.png',
                  width: 135.w,
                  height: 80.h,

                  fit: BoxFit.cover,
                ),
              ),

              InkWell(
                onTap: () {
                  if (MealLayoutCubit.get(context).favoriteMeals
                      .map((e) => e.recipeId)
                      .contains(searchByMealResponseModel.recipeId)) {
                    MealLayoutCubit.get(
                      context,
                    ).deleteFavoriteById(searchByMealResponseModel.recipeId!);
                  } else {
                    MealLayoutCubit.get(
                      context,
                    ).addFavorite(searchByMealResponseModel.recipeId ?? 1);
                  }
                },
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  width: 30.w,
                  height: 30.h,
                  decoration: const BoxDecoration(
                    color: AppColor.deepOrange,

                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.bookmark, color: AppColor.white),
                ),
              ),
            ],
          ),

          SizedBox(height: 1.h),
          Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,

            searchByMealResponseModel.recipeName ?? 'default',
            style: theme.textTheme.bodyMedium!.copyWith(
              fontFamily: 'RobotoSerif',
              color: AppColor.black,
              fontWeight: FontWeight.normal,
              fontSize: 13.sp,
            ),
            textAlign: TextAlign.center,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10.w,
            children: [
              Row(
                spacing: 2.w,
                children: [
                  Image.asset('assets/images/Union.png', height: 14.h),
                  Baseline(
                    baseline: 15.h,
                    baselineType: TextBaseline.alphabetic,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 50),

                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        searchByMealResponseModel.type ?? 'default',
                        // 'breakfast',
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: AppColor.gray,
                          fontFamily: 'Roboto',
                          fontSize: 12.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                spacing: 2.w,
                children: [
                  Image.asset('assets/images/fire.png', height: 15.h),
                  Baseline(
                    baseline: 15.h,
                    baselineType: TextBaseline.alphabetic,

                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 40),
                      child: Text.rich(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,

                        TextSpan(
                          text:
                              searchByMealResponseModel.calories100g.toString(),
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: AppColor.gray,
                            fontFamily: 'Roboto',
                            fontSize: 12.sp,
                          ),
                          children: [
                            TextSpan(
                              text: 'cal                     ',
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: AppColor.gray,
                                fontFamily: 'Roboto',
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
