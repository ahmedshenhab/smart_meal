// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/style/app_color.dart';
import 'package:smart_meal/module/meal_details/meal_datails_screen.dart';

import 'package:smart_meal/module/meal_layout/layout_screens/search/cubit/cubit.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/search/widgets/more_filter_search.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/search/widgets/search_text_field.dart';
import 'package:smart_meal/module/shred_widget/custom_item_meal.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Column(
      children: [
        SizedBox(height: mediaQuery.size.height * 0.03),
        SearchTextField(),
        SizedBox(height: mediaQuery.size.height * 0.02),

        //more filters
        MoreFilterSearch(),
        SizedBox(height: mediaQuery.size.height * 0.033),
        BlocBuilder<SearchByMealCubit, SearchByMealStates>(
          buildWhen:
              (previous, current) =>
                  current is SearchByMealChangeBottomCategoryState,

          builder: (context, state) {
            final cubit = BlocProvider.of<SearchByMealCubit>(context);

            return Row(
              spacing: 10.w,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...cubit.categorys.map(
                  (e) => ElevatedButton(
                    key: Key(cubit.categorys.indexOf(e).toString()),
                    onPressed: () => cubit.changeCategory(e),
                    style: ElevatedButton.styleFrom(
                      overlayColor: Colors.transparent,
                      // shadowColor: Colors.transparent,
                      backgroundColor:
                          cubit.selectedCategory == e
                              ? Colors.orange
                              : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                    ),
                    child: Text(
                      e,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color:
                            cubit.selectedCategory == e
                                ? Colors.white
                                : Colors.black,
                        fontFamily: 'Sofia Pro',
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),

        SizedBox(height: mediaQuery.size.height * 0.02),

        Expanded(
          child: Container(
            // foregroundDecoration: BoxDecoration(
            //   borderRadius: BorderRadius.only(

            //   ),
            // ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
              color: AppColor.white,
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
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColor.deepOrange,
                        backgroundColor: AppColor.deepOrange,
                      ),
                    );

                  case SearchByMealSuccess _:
                    
                   
                    return state.searchByMealResponseModel!.isEmpty
                        ? Center(child: Text('search with meal name'))
                        : GridView.builder(
                          padding: const EdgeInsets.all(0),

                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,

                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,

                                crossAxisSpacing: 10.w,
                                mainAxisSpacing: 20.h,
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
                                        state.searchByMealResponseModel![index],
                                  );
                                },
                                child: CustomItemMeal(
                                  searchByMealResponseModel:
                                      state.searchByMealResponseModel![index],

                                  boxShadow: BoxShadow(
                                    offset: Offset(0, 5),
                                    color: Colors.black.withValues(alpha: 0.1),
                                    blurRadius: 15,

                                    spreadRadius: 5,
                                  ),
                                ),
                              ),
                        );

                  case SearchByMealError _:
                    return Center(child: Text(state.error));

                  default:
                    return Center(child: Text('search with meal name'));
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
