import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/style/app_color.dart';
import 'package:smart_meal/module/category_screen/cubit/cubit.dart';
import 'package:smart_meal/module/category_screen/cubit/state.dart';
import 'package:smart_meal/module/category_screen/widget/category_search_field.dart';
import 'package:smart_meal/module/category_screen/widget/more_filter_category.dart';
import 'package:smart_meal/module/meal_details/meal_datails_screen.dart';

import 'package:smart_meal/module/shred_widget/custom_item_meal.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  static const categoryScreen = '/category-screen';

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);

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
          // SvgPicture.asset('assets/images/Sun.svg', width: 30.w, height: 30.h),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: mediaQuery.size.height * 0.01),
          const CategorySearchField(),
          SizedBox(height: mediaQuery.size.height * 0.02),

          //more filters
          const MoreFilterCategory(),
          SizedBox(height: mediaQuery.size.height * 0.033),

          BlocBuilder<CategoryScreenCubit, CategoryScreenStates>(
         
            
            builder: (context, state) {
              
              return
              Expanded(
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
                              arguments:
                                  state.meals[index],
                              context,
                              MealDetailsScreen.mealDetailsScreen,
                            );
                          },
                          child: CustomItemMeal(

                            
                            searchByMealResponseModel:
                               state.meals[index],
                               favoritIcon: IconButton(
                    alignment: AlignmentDirectional.center,
                    constraints: BoxConstraints(
                      minWidth: 30.w,
                      minHeight: 30.h,
                      maxWidth: 30.w,
                      maxHeight: 30.h,
                    ),
                    onPressed: () {},

                    icon: const Icon(Icons.bookmark),
                    style: Theme.of(context).iconButtonTheme.style!.copyWith(
                      iconSize: WidgetStateProperty.all(19.h),
                      backgroundColor: WidgetStateProperty.all(AppColor.white),
                      foregroundColor: WidgetStateProperty.all(AppColor.deepOrange),
                      padding: WidgetStateProperty.all(EdgeInsets.zero),
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                    ),
                  ),

                         

                            boxShadow: BoxShadow(
                              offset: const Offset(0, 5),
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 15,

                              spreadRadius: 5,
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
