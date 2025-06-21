
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/ui/style/app_color.dart';
import 'package:smart_meal/generated/l10n.dart';
import 'package:smart_meal/module/meal_details/meal_datails_screen.dart';
import 'package:smart_meal/module/meal_layout/data/model/meals_model.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/home/widget/custom_item_meal_recomendation.dart';
import 'package:smart_meal/module/recommendation_meal_screen/recommendation_meal_screen.dart';

class RecommendSuccess extends StatelessWidget {
  const RecommendSuccess({super.key, required this.meals});
  final List<MealsModel> meals;

  @override
  Widget build(BuildContext context) {
    final displayedMeals = meals.take(2).toList();
    final mediaQuery = MediaQuery.of(context);
  

    return Column(
      children: [
        meals.isNotEmpty
            ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...List.generate(displayedMeals.length, (index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        MealDetailsScreen.mealDetailsScreen,
                        arguments: displayedMeals[index],
                      );
                    },
                    child: CustomItemMealRecomendation(
                      meal: displayedMeals[index],
                      boxShadow: BoxShadow(
                        color: AppColor.black.withValues(alpha: 0.25),
                        offset: Offset(0.w, 5.h),
                        blurRadius: 4,
                        spreadRadius: 5,
                      ),
                    ),
                  );
                }),
              ],
            )
            : Text(
              S.of(context).buildRecommendation,
              textAlign: TextAlign.center,
            ),
        SizedBox(height: 19.h),

        Visibility(
          visible: meals.length > 2,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                RecommendationMealScreen.recommendationMealScreen,
                arguments: meals,
              );
            },
            child: Image.asset(
              'assets/images/elevatebottun.png',

              width: mediaQuery.size.width * 0.7,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
