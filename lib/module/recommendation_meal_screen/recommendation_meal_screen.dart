import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/generated/l10n.dart';
import 'package:smart_meal/module/meal_details/meal_datails_screen.dart';
import 'package:smart_meal/module/meal_layout/data/model/meals_model.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/home/widget/custom_item_meal_recomendation.dart';
import '../../core/ui/style/app_color.dart';

class RecommendationMealScreen extends StatelessWidget {
  const RecommendationMealScreen({super.key, required this.meals});
  static const recommendationMealScreen = '/recommendationMealScreen';
  final List<MealsModel> meals;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Text(S.of(context).recommended),
      ),
      body: Column(
        children: [
          SizedBox(height: mediaQuery.size.height * 0.01),
          // CustomSearchField(onChanged: (value) {}),
          SizedBox(height: mediaQuery.size.height * 0.02),

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
                itemCount:  meals.length,
                itemBuilder:
                    (context, index) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          arguments: meals[index],
                          context,
                          MealDetailsScreen.mealDetailsScreen,
                        );
                      },
                      child: CustomItemMealRecomendation(
                        meal: meals[index],
          
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
