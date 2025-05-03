import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/style/app_color.dart';
import 'package:smart_meal/module/category_screen/widget/category_search_field.dart';
import 'package:smart_meal/module/category_screen/widget/more_filter_category.dart';
import 'package:smart_meal/module/meal_details/meal_datails_screen.dart';
import 'package:smart_meal/module/meal_layout/data/model/meals_model.dart';
import 'package:smart_meal/module/shred_widget/custom_item_meal.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.meals, required this.title});
  static const categoryScreen = '/category-screen';
   final List<MealsModel> meals ;
    final String title;

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);

    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title:  Text(title),
        actionsPadding: EdgeInsetsDirectional.only(end: 10.w),
        actions: [
          Icon(
            Icons.breakfast_dining_outlined,
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
                itemCount: meals.length,
                itemBuilder:
                    (context, index) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                           arguments: meals[index],
                          context,
                          MealDetailsScreen.mealDetailsScreen,
                        );
                      },
                      child: CustomItemMeal(
                        searchByMealResponseModel:  meals[index],

                        color1: AppColor.deepOrange,
                        color2: AppColor.white,

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
          ),
        ],
      ),
    );
  }
}
