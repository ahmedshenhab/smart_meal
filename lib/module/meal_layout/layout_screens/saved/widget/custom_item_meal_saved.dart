import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_meal/core/extention/extention.dart';
import '../../../../../core/ui/style/app_color.dart';
import '../../../cubit/cubit.dart';
import '../../../data/model/meals_model.dart';

class CustomItemMealSaved extends StatelessWidget {
  const CustomItemMealSaved({super.key, this.boxShadow, required this.meal});

  final BoxShadow? boxShadow;

  final MealsModel meal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        boxShadow: boxShadow != null ? [boxShadow!] : [],
        color: context.isDark ? AppColor.scaffolddark : AppColor.white,
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

                child:
                    meal.imageUrl == '' || meal.imageUrl == null
                        ? Image.asset(
                          'assets/images/m1.png',
                          fit: BoxFit.cover,
                          width: 135.w,
                          height: 80.h,
                        )
                        : CachedNetworkImage(
                          width: 135.w,
                          height: 80.h,
                          fit: BoxFit.cover,
                          imageUrl: meal.imageUrl!,
                          placeholder:
                              (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                          errorWidget:
                              (context, url, error) =>
                                  const Center(child: Icon(Icons.error)),
                        ),
              ),

              InkWell(
                onTap: () {
                  Fluttertoast.cancel();

                  MealLayoutCubit.get(
                    context,
                  ).deleteFavoriteFromsaved(meal.recipeId ?? 3);
                },
                child: CircleAvatar(
                  backgroundColor:
                      meal.isFavorite
                          ? (AppColor.deepOrange)
                          : (context.isDark ? AppColor.black : AppColor.white),
                  child: Icon(
                    Icons.bookmark,
                    color:
                        meal.isFavorite
                            ? (context.isDark ? AppColor.black : AppColor.white)
                            : AppColor.gray,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 1.h),
          Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,

            meal.recipeName ?? 'default',
            style: theme.textTheme.bodyMedium!.copyWith(
              fontFamily: 'RobotoSerif',
              color: context.isDark ? AppColor.white : AppColor.black,
              fontWeight: FontWeight.normal,
              fontSize: 13.sp,
            ),
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
                        'default',
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
                          text: meal.calories100g.toString(),
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
