part of 'cubit.dart';

sealed class SearchByMealStates {}

class SearchByMealInitial extends SearchByMealStates {}

class SearchByMealChangeBottomCategoryState extends SearchByMealStates {
  SearchByMealChangeBottomCategoryState();
  
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

// class FilterMealSuccess extends SearchByMealStates {}
// class FilterMealError extends SearchByMealStates {
//   FilterMealError({required this.error});

//   String error;
// }