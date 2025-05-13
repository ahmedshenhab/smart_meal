import 'package:flutter/widgets.dart';
import '../../../core/network/remote/api_error_model.dart';
import '../data/model/meals_model.dart';

sealed class MealStates {}

class MealInitialState extends MealStates {}

class MealChangeBottomNavState extends MealStates {}

class MealGetAllMealLoadingState extends MealStates {}

class MealGetAllMealSuccessState extends MealStates {
  MealGetAllMealSuccessState(this.meals, this.title, this.icon);

  List<MealsModel>? meals;
  final String title;
  final IconData icon;
}

class MealGetAllMealErrorState extends MealStates {
  MealGetAllMealErrorState({required this.error});

  final String error;
}

class MealSearchByIngrediantLoadingState extends MealStates {}

class MealSearchByIngrediantSuccessState extends MealStates {
  MealSearchByIngrediantSuccessState({required this.meals});

  final List<MealsModel> meals;
}

class MealSearchByIngrediantErrorState extends MealStates {
  MealSearchByIngrediantErrorState({required this.error});

  final String error;
}

class MealGetAllFavoriteLoadingState extends MealStates {}

class MealGetAllFavoriteSuccessState extends MealStates {
  MealGetAllFavoriteSuccessState();
}

class MealGetAllFavoriteErrorState extends MealStates {
  MealGetAllFavoriteErrorState({required this.error});

  final ApiErrorModel error;
}

class MealChangeFavoriteTemporaryState extends MealStates {}

class MealChangeFavoriteSuccessState extends MealStates {
  MealChangeFavoriteSuccessState({required this.message});

  final String message;
}

class MealChangeFavoriteErrorState extends MealStates {
  MealChangeFavoriteErrorState({required this.message});
  final String message;
}
