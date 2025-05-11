import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'state.dart';
import '../../meal_layout/cubit/cubit.dart';
import '../../meal_layout/data/model/meals_model.dart';

class CategoryScreenCubit extends Cubit<CategoryScreenStates> {
  CategoryScreenCubit(this.meals, this.title, this.icon, this.mealLayoutCubit)
    : super(CategoryScreenStates(meals: meals));
  final List<MealsModel> meals;
  final String title;
  final IconData icon;
  final MealLayoutCubit mealLayoutCubit;

  double calories = 1000;
  double protein = 100;
  double sugar = 100;
  double fats = 100;
  double carbs = 100;

  static CategoryScreenCubit get(context) =>
      BlocProvider.of<CategoryScreenCubit>(context);

  void filterSearch() {
    if (meals.isEmpty) {
      emit(CategoryScreenStates(meals: []));
      return;
    }

    final filteredList =
        meals.where((meal) {
          return (meal.calories100g ?? 0) <= calories &&
              (meal.protein100g ?? 0) <= protein &&
              (meal.sugar100g ?? 0) <= sugar &&
              (meal.fat100g ?? 0) <= fats &&
              (meal.carb100 ?? 0) <= carbs;
        }).toList();

    log('Filtered: ${filteredList.length}');
    emit(CategoryScreenStates(meals: filteredList));
  }

  void serch(String name) {
    if (meals.isEmpty) return;

    final query = name.trim().toLowerCase();

    final filteredList =
        meals.where((meal) {
          final mealName = (meal.recipeName ?? 'default').toLowerCase();

          final matchesText =
              mealName == query ||
              mealName.startsWith(query) ||
              mealName.contains(query);

          final matchesNutrition =
              (meal.calories100g ?? 0) <= calories &&
              (meal.protein100g ?? 0) <= protein &&
              (meal.sugar100g ?? 0) <= sugar &&
              (meal.fat100g ?? 0) <= fats &&
              (meal.carb100 ?? 0) <= carbs;

          return matchesText && matchesNutrition;
        }).toList();
    emit(CategoryScreenStates(meals: filteredList));
  }
}
