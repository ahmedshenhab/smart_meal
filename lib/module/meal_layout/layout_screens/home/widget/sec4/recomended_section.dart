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

class RecomendedSection extends StatelessWidget {
  const RecomendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create:
          (context) =>
              RecommendationCubit(repo: getIt<RepoRecommendation>())
                ..getRecommendation(),
      child: Container(
        padding: EdgeInsetsDirectional.only(top: 20.w, bottom: 30.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          color: AppColor.brownBurn,
        ),
        child: Column(
          children: [
            Text(
              S.of(context).makeForYou,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: context.isDark ? AppColor.black : AppColor.white,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),

            Text(
              S.of(context).recommendedMeals,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: Colors.deepOrange,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 20.h),

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
                        SizedBox(height: 8.h),
                        InkWell(
                          onTap: () {
                            BlocProvider.of<RecommendationCubit>(
                              context,
                            ).getRecommendation();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 2.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.deepOrange,

                              borderRadius: BorderRadius.circular(20.r),
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
          ],
        ),
      ),
    );
  }
}
