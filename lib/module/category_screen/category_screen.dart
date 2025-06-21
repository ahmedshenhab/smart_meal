import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/ui/style/app_color.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';
import '../shred_widget/custom_search_field.dart';
import 'widget/custom_item_meal_category.dart';
import 'widget/more_filter_category.dart';
import '../meal_details/meal_datails_screen.dart';
import '../meal_layout/cubit/cubit.dart';
import '../meal_layout/cubit/stataes.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  static const categoryScreen = '/category-screen';

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Text(CategoryScreenCubit.get(context).title),
        actionsPadding: EdgeInsetsDirectional.only(end: 10.w),
        actions: [
          Icon(
            CategoryScreenCubit.get(context).icon,

            color: AppColor.deepOrange,
            size: 25.w,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: mediaQuery.size.height * 0.01),
          CustomSearchField(
            onChanged: (String value) {
              CategoryScreenCubit.get(context).serch(value);
            },
          ),
          SizedBox(height: mediaQuery.size.height * 0.02),

          //more filters
          const MoreFilterCategory(),
          SizedBox(height: mediaQuery.size.height * 0.033),

          BlocBuilder<CategoryScreenCubit, CategoryScreenStates>(
            builder: (context, state) {
              return Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                    color: AppColor.white,
                  ),
                  padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 7.h),
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(0),

                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,

                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 20.h,
                     
                    ),
                    itemCount: state.meals.length,
                    itemBuilder:
                        (context, index) => InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              arguments: state.meals[index],
                              context,
                              MealDetailsScreen.mealDetailsScreen,
                            );
                          },
                          child: BlocProvider.value(
                            value:
                                CategoryScreenCubit.get(
                                  context,
                                ).mealLayoutCubit,

                            child: BlocBuilder<MealLayoutCubit, MealStates>(
                              buildWhen:
                                  (previous, current) =>
                                      current
                                          is MealChangeFavoriteTemporaryState ||
                                      current
                                          is MealChangeFavoriteSuccessState ||
                                      current is MealChangeFavoriteErrorState,

                              builder: (context, stateMealLayoutCubit) {
                                return CustomItemMealCategory(
                                  searchByMealResponseModel: state.meals[index],

                                  boxShadow: BoxShadow(
                                    offset: const Offset(0, 5),
                                    color: Colors.black.withValues(alpha: 0.1),
                                    blurRadius: 15,

                                    spreadRadius: 5,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
