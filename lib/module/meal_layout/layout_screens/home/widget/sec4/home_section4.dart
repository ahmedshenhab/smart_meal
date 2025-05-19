import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/extention/extention.dart';
import 'package:smart_meal/core/setup/setup.dart';
import 'package:smart_meal/core/ui/style/app_color.dart';
import 'package:smart_meal/generated/l10n.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/home/widget/sec4/widget/recommend_success.dart';
import 'package:smart_meal/module/recommendation_meal_screen/cubit/recommendation_cubit.dart';
import 'package:smart_meal/module/recommendation_meal_screen/data/repo.dart';

class HomeSection4 extends StatelessWidget {
  const HomeSection4({super.key});

  @override
  Widget build(BuildContext context) {
    log('home section 4');

    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);

    return BlocProvider(
      create:
          (context) =>
              RecommendationCubit(repo: getIt<RepoRecommendation>())
                ..getRecommendation(),
      child: Container(
        height: mediaQuery.size.height * 0.55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          color: AppColor.brownBurn,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).makeForYou,
              style: theme.textTheme.bodyMedium!.copyWith(
                color:   context.isDark ? AppColor.black : AppColor.white,
                fontSize: 22.sp,
              ),
              textAlign: TextAlign.center,
            ),

            Text(
              S.of(context).recommendedMeals,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: Colors.deepOrange,
                fontSize: 22.sp,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: mediaQuery.size.height * 0.05),
            BlocBuilder<RecommendationCubit, RecommendationStates>(
              buildWhen:
                  (previous, current) =>
                      current is RecommendationSuccess ||
                      current is RecommendationError ||
                      current is RecommendationLoading,

              builder: (context, state) {
                switch (state) {
                  case RecommendationLoading _:
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.deepOrange,
                      ),
                    );

                  case RecommendationSuccess _:
                    return RecommendSuccess(meals: state.meals);

                  case RecommendationError _:
                    return Column(
                      children: [
                        Text(
                          state.error,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: AppColor.white,
                            fontSize: 18.sp,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            BlocProvider.of<RecommendationCubit>(
                              context,
                            ).getRecommendation();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 2.w,
                              vertical: 1.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.deepOrange,

                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Text(
                              textAlign: TextAlign.center,
                              S.of(context).tryAgain,
                              style: theme.textTheme.bodyMedium!.copyWith(
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );

                  default:
                    return const SizedBox.shrink();
                }
              },
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
