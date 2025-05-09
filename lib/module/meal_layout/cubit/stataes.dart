import 'package:smart_meal/module/meal_layout/data/model/meals_model.dart';

sealed class MealStates {}

class MealInitialState extends MealStates {}

class MealChangeBottomNavState extends MealStates {}

class MealGetAllMealLoadingState extends MealStates {}

class MealGetAllMealSuccessState extends MealStates {
  MealGetAllMealSuccessState(this.meals);

  final Map<String, List<MealsModel>> meals;
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

class MealAddFavoriteSuccessState extends MealStates {
  MealAddFavoriteSuccessState({required this.message});
  final String message;
}

class MealAddFavoriteErrorState extends MealStates {
  MealAddFavoriteErrorState({required this.error});

  final String error;
}

class MealGetAllFavoriteLoadingState extends MealStates {

  
}
class MealGetAllFavoriteSuccessState extends MealStates {

 
}
class MealGetAllFavoriteErrorState extends MealStates {
  MealGetAllFavoriteErrorState({required this.error});

  final String error;
}



 class MealDeleteFavoriteByIdLoadingState extends MealStates {}
 class MealDeleteFavoriteByIdSuccessState extends MealStates {}

class MealDeleteFavoriteByIdErrorState extends MealStates {
  MealDeleteFavoriteByIdErrorState({required this.error});

  final String error;
}