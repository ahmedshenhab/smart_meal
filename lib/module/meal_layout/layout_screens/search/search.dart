import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/extention/extention.dart';
import 'package:smart_meal/generated/l10n.dart';
import '../../../../core/ui/style/app_color.dart';
import '../../../meal_details/meal_datails_screen.dart';

import 'cubit/cubit.dart';
import 'widgets/custom_item_meal_search.dart';
import 'widgets/more_filter_search.dart';
import 'widgets/search_text_field.dart';

// Category model
class MealKeyValue {
  MealKeyValue({required this.key, required this.label});
  final String key;
  final String label;
}

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  void initState() {
    log('Search');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final categories = [
      MealKeyValue(key: 'Breakfast', label: S.of(context).breakfast),
      MealKeyValue(key: 'Lunch', label: S.of(context).lunch),
      MealKeyValue(key: 'Dinner', label: S.of(context).dinner),
    ];

    SearchByMealCubit.get(context).selectedCategory = categories[0].label;

    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: mediaQuery.size.height * 0.03),
          const SearchTextField(),
          SizedBox(height: mediaQuery.size.height * 0.02),

          const MoreFilterSearch(),
          SizedBox(height: mediaQuery.size.height * 0.033),

          BlocBuilder<SearchByMealCubit, SearchByMealStates>(
            buildWhen:
                (previous, current) =>
                    current is SearchByMealChangeBottomCategoryState,
            builder: (context, state) {
              final cubit = SearchByMealCubit.get(context);

              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...categories.map((category) {
                    final isSelected = cubit.selectedCategory == category.label;

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: ElevatedButton(
                        key: Key(category.key),
                        onPressed: () => cubit.changeCategory(category.label),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isSelected
                                  ? (AppColor.primary)
                                  : (context.isDark
                                      ? AppColor.black
                                      : AppColor.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                        ),
                        child: Text(
                          category.label,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color:
                                isSelected
                                    ? context.isDark
                                        ? AppColor.black
                                        : Colors.white
                                    : context.isDark
                                    ? Colors.white
                                    : Colors.black,
                            fontFamily: 'Sofia Pro',
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              );
            },
          ),

          SizedBox(height: mediaQuery.size.height * 0.02),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                color: context.isDark ? AppColor.black : AppColor.white,
              ),
              padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 7.h),
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: BlocBuilder<SearchByMealCubit, SearchByMealStates>(
                buildWhen:
                    (previous, current) =>
                        current is SearchByMealSuccess ||
                        current is SearchByMealLoading ||
                        current is SearchByMealError,
                builder: (context, state) {
                  switch (state) {
                    case SearchByMealLoading _:
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primary,
                        ),
                      );
                    case SearchByMealSuccess _:
                      return state.searchByMealResponseModel!.isEmpty
                          ? Center(
                            child: Text(
                              S.of(context).noMealsFound,
                              style: TextStyle(
                                color:
                                    context.isDark
                                        ? AppColor.white
                                        : AppColor.black,
                                fontSize: 15.sp,
                                fontFamily: 'Sofia Pro',
                              ),
                            ),
                          )
                          : GridView.builder(
                            padding: const EdgeInsets.all(0),
                            keyboardDismissBehavior:
                                ScrollViewKeyboardDismissBehavior.onDrag,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.w,
                                  mainAxisSpacing: 20.h,
                                  childAspectRatio: 0.92,
                                ),
                            itemCount:
                                state.searchByMealResponseModel?.length ?? 0,
                            itemBuilder:
                                (context, index) => InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      MealDetailsScreen.mealDetailsScreen,
                                      arguments:
                                          state
                                              .searchByMealResponseModel![index],
                                    );
                                  },
                                  child: CustomItemMealSearch(
                                    meal:
                                        state.searchByMealResponseModel![index],
                                    boxShadow: BoxShadow(
                                      offset: const Offset(0, 5),
                                      color: Colors.black.withValues(
                                        alpha: 0.1,
                                      ),
                                      blurRadius: 15,
                                      spreadRadius: 5,
                                    ),
                                  ),
                                ),
                          );
                    case SearchByMealError _:
                      return Center(child: Text(state.error));
                    default:
                      return Center(
                        child: Text(S.of(context).searchWithMealName),
                      );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
