import 'package:smart_meal/module/meal_layout/data/model/meals_model.dart';

class MealStates {}

class MealInitialState extends MealStates {}

class MealChangeBottomNavState extends MealStates {}

class MealGetAllMealLoadingState extends MealStates {}

class MealGetAllMealSuccessState extends MealStates {
  MealGetAllMealSuccessState(this.breakFast, this.lunch, this.dinner);
  final List<MealsModel>? breakFast;
  final List<MealsModel>? lunch;
  final List<MealsModel>? dinner;
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
