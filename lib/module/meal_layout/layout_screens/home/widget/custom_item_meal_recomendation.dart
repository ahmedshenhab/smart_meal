import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/extention/extention.dart';
import 'package:smart_meal/core/ui/style/app_color.dart';

import '../../../data/model/meals_model.dart';

class CustomItemMealRecomendation extends StatelessWidget {
  const CustomItemMealRecomendation({
    super.key,

    this.boxShadow,
    required this.meal,
  });

  // final Color foreground;

  // final Color background;
  final BoxShadow? boxShadow;

  final MealsModel meal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsetsDirectional.only(
        bottom: 10.w,
        start: 5.w,
        end: 5.w,
        top: 8.h,
      ),
      decoration: BoxDecoration(
        boxShadow: boxShadow != null ? [boxShadow!] : [],
        color: context.isDark ? AppColor.scaffolddark : AppColor.white,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Column(
        spacing: 2.h,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child:
                meal.imageUrl == null || meal.imageUrl == ''
                    ? Image.asset(
                      'assets/images/m1.png',
                      width: 135.w,
                      height: 80.h,

                      fit: BoxFit.cover,
                    )
                    : CachedNetworkImage(
                      width: 135.w,
                      height: 80.h,
                      fit: BoxFit.cover,
                      imageUrl: meal.imageUrl!,
                      placeholder:
                          (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                      errorWidget:
                          (context, url, error) => const Icon(Icons.error),
                    ),
          ),

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
            textAlign: TextAlign.center,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        meal.type ?? 'default',
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
                              text: 'cal',
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
