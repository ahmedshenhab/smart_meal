import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/module/meal_layout/data/model/meals_model.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/search/data/repo/repo.dart';

part 'states.dart';

class SearchByMealCubit extends Cubit<SearchByMealStates> {
  SearchByMealCubit({required SearchByMealRepo searchByMealRepo})
    : _searchByMealRepo = searchByMealRepo,
      super(SearchByMealInitial());

  static SearchByMealCubit get(context) => BlocProvider.of(context);

  final SearchByMealRepo _searchByMealRepo;
  List<MealsModel> searchByMealResponseModel = [];

  final categorys = ['Breakfast', 'Lunch', 'Dinner'];
  String selectedCategory = 'Lunch';
  double calories = 4000;
  double protein = 5000;
  double sugar = 5000;
  double fats = 5000;
  double carbs = 5000;

  void filterSearch() {
    

    if (searchByMealResponseModel.isEmpty) {
      emit(SearchByMealError(error: 'No meals to filter'));
      return;
    }

    final filteredList =
        searchByMealResponseModel.where((meal) {
          return (meal.calories100g ?? 0) <= calories &&
              (meal.protein100g ?? 0) <= protein &&
              (meal.sugar100g ?? 0) <= sugar &&
              (meal.fat100g ?? 0) <= fats &&
              (meal.carb100 ?? 0) <= carbs &&
              meal.type == selectedCategory;
        }).toList();

    log('Filtered: ${filteredList.length}');
    emit(SearchByMealSuccess(searchByMealResponseModel: filteredList));
  }

  search() async {

    if (searchController.text.isEmpty) {
      return;
    }
    emit(SearchByMealLoading());

    final result = await _searchByMealRepo.searchByMeal(searchController.text);

    result.fold((l) => emit(SearchByMealError(error: l.message!)), (r) {
       
      searchByMealResponseModel = r;
      final filteredList =
        r.where((meal) {
          return (meal.calories100g ?? 0) <= calories &&
              (meal.protein100g ?? 0) <= protein &&
              (meal.sugar100g ?? 0) <= sugar &&
              (meal.fat100g ?? 0) <= fats &&
              (meal.carb100 ?? 0) <= carbs &&
              meal.type == selectedCategory;
        }).toList();

      emit(SearchByMealSuccess(searchByMealResponseModel: filteredList));
    });
  }

  void changeCategory(String e) {
    if (selectedCategory == e) {
      return;
    }
    selectedCategory = e;


    emit(SearchByMealChangeBottomCategoryState(title: e));
     


 final filteredList =
       searchByMealResponseModel .where((meal) {
          return (meal.calories100g ?? 0) <= calories &&
              (meal.protein100g ?? 0) <= protein &&
              (meal.sugar100g ?? 0) <= sugar &&
              (meal.fat100g ?? 0) <= fats &&
              (meal.carb100 ?? 0) <= carbs &&
              meal.type == selectedCategory;
        }).toList();

        emit(SearchByMealSuccess(searchByMealResponseModel: filteredList));

  }

  final TextEditingController searchController = TextEditingController();
  @override
  Future<void> close() {
    searchController.dispose();

    return super.close();
  }
}
