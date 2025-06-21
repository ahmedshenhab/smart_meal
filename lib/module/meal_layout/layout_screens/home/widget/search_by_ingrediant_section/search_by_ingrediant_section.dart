import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/extention/extention.dart';
import 'package:smart_meal/core/setup/setup.dart';
import 'package:smart_meal/core/services/sql/sqldb.dart';
import 'package:smart_meal/generated/l10n.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/home/widget/search_by_ingrediant_section/widget/custom_search_with_ingrediant_field.dart';
import '../../../../../../core/ui/style/app_color.dart';
import '../../../../../meal_details/meal_datails_screen.dart';
import '../../../../cubit/cubit.dart';
import '../../../../cubit/stataes.dart';

class SearchByIngrediantSection extends StatelessWidget {
  const SearchByIngrediantSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsetsDirectional.only(bottom: 25.w, top: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        color: context.isDark ? AppColor.brownDark : AppColor.brownBurn,
      ),
      child: Column(
        children: [
          Text(
            S.of(context).dontKnowWhatToCook,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: context.isDark ? AppColor.black : Colors.white,
              fontSize: 22.sp,

              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            S.of(context).searchWithIngredients,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: context.isDark ? AppColor.warmOrange : AppColor.deepOrange,
              fontSize: 22.sp,

              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: mediaQuery.size.height * 0.017),
          Container(
            width: double.infinity,
            margin: EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
            height: mediaQuery.size.height * 0.4,
            decoration: BoxDecoration(
              color: context.isDark ? AppColor.black : AppColor.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              children: [
                SizedBox(height: 4.h),
                Text(
                  S.of(context).yourIngredients,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: AppColor.brown,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                const SearchWithIngrediant(),
                SizedBox(height: 4.h),

                BlocBuilder<MealLayoutCubit, MealStates>(
                  buildWhen:
                      (previous, current) =>
                          current is MealSearchByIngrediantLoadingState ||
                          current is MealSearchByIngrediantSuccessState ||
                          current is MealSearchByIngrediantErrorState,
                  builder: (context, state) {
                    switch (state) {
                      case MealSearchByIngrediantLoadingState _:
                        return const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColor.deepOrange,
                            ),
                          ),
                        );

                      case MealSearchByIngrediantSuccessState _:
                        if (state.meals.isEmpty) {
                          return Expanded(
                            child: Center(
                              child: Text(
                                S.of(context).noMealsFound,
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  color:
                                      context.isDark
                                          ? Colors.white
                                          : AppColor.black,
                                  fontSize: 20.sp,
                                ),
                              ),
                            ),
                          );
                        }

                        return Expanded(
                          child: GridView.builder(
                            padding: EdgeInsetsDirectional.only(
                              start: 12.w,
                              end: 12.w,
                              bottom: 6.h,
                              top: 6.h,
                            ),
                            itemCount:
                                state.meals.length, // No need to cast the state
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 3.3,
                                  mainAxisSpacing: 12.h,
                                  crossAxisSpacing: 20.w,
                                ),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () async {
                                  await getIt<DatabaseHelper>().insertName(
                                    state.meals[index].recipeName ?? '',
                                  );
                                  if (context.mounted) {
                                    // Check if the context is still mounted
                                    Navigator.of(context).pushNamed(
                                      MealDetailsScreen.mealDetailsScreen,
                                      arguments: state.meals[index],
                                    );
                                  }
                                },
                                child: _buildResuiltIngrediant(
                                  state.meals[index].recipeName ?? 'defualt',
                                  theme,
                                  context,
                                ),
                              );
                            },
                          ),
                        );
                      case MealSearchByIngrediantErrorState _:
                        return Expanded(
                          child: Center(child: Text(state.error)),
                        );

                      default:
                        return const SizedBox.shrink();
                    }
                  },
                ),
                SizedBox(height: 4.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResuiltIngrediant(
    String label,
    ThemeData theme,
    BuildContext context,
  ) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 4,

            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(50.r),
        color: context.isDark ? Colors.grey.shade800 : Colors.grey.shade100,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Row(
          children: [
            Icon(
              Icons.search,
              size: 16.h,
              color: AppColor.resuiltIconSearchColor,
            ),

            Expanded(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 13.sp,
                  color: AppColor.resuiltIconSearchColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
