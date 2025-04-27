part of 'cubit.dart';

sealed class SearchByMealStates {}

class SearchByMealInitial extends SearchByMealStates {}

class SearchByMealChangeBottomCategoryState extends SearchByMealStates {
  SearchByMealChangeBottomCategoryState({required this.title});
  final String title;
}

class SearchByMealLoading extends SearchByMealStates {}

class SearchByMealSuccess extends SearchByMealStates {
  SearchByMealSuccess({required this.searchByMealResponseModel});

  final List<MealsModel>? searchByMealResponseModel;
}

class SearchByMealError extends SearchByMealStates {
  SearchByMealError({required this.error});


  final String error;
}
