import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/extention/extention.dart';
import '../../../core/ui/style/app_color.dart';
import '../../meal_layout/cubit/cubit.dart';
import '../../meal_layout/data/model/meals_model.dart';

class CustomItemMealCategory extends StatelessWidget {
  const CustomItemMealCategory({
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
                    searchByMealResponseModel.imageUrl == null ||
                            searchByMealResponseModel.imageUrl == ''
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
                          imageUrl: searchByMealResponseModel.imageUrl ?? '',
                          placeholder:
                              (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                          errorWidget:
                              (context, url, error) => const Icon(Icons.error),
                        ),
              ),

              InkWell(
                onTap: () {
                  MealLayoutCubit.get(
                    context,
                  ).changefavorite(searchByMealResponseModel.recipeId ?? 10);
                },
                child: CircleAvatar(
                  radius: 15.r,
                  backgroundColor:
                      MealLayoutCubit.get(
                                context,
                              ).isFavouriteMap[searchByMealResponseModel
                                  .recipeId] ==
                              true
                          ? AppColor.deepOrange
                          : context.isDark
                          ? AppColor.black
                          : AppColor.white,

                  child: Icon(
                    Icons.bookmark,
                    color:
                        MealLayoutCubit.get(
                                  context,
                                ).isFavouriteMap[searchByMealResponseModel
                                    .recipeId] ==
                                true
                            ? (context.isDark ? AppColor.black : AppColor.white)
                            : context.isDark
                            ? AppColor.veryDarkGray
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

            searchByMealResponseModel.recipeName ?? 'default',
            style: theme.textTheme.bodyMedium!.copyWith(
              fontFamily: 'RobotoSerif',
              color: context.isDark ? AppColor.white : AppColor.black,
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
