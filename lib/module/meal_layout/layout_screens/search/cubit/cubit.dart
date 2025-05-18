import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/meals_model.dart';
import '../data/repo/repo.dart';

part 'states.dart';

class SearchByMealCubit extends Cubit<SearchByMealStates> {
  SearchByMealCubit({required SearchByMealRepo searchByMealRepo})
    : _searchByMealRepo = searchByMealRepo,
      super(SearchByMealInitial());

  static SearchByMealCubit get(context) => BlocProvider.of(context);

  final SearchByMealRepo _searchByMealRepo;
  List<MealsModel> searchByMealResponseModel = [];

  late String selectedCategory;
  double calories = 1000;
  double protein = 100;
  double sugar = 100;
  double fats = 100;
  double carbs = 100;

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

    emit(SearchByMealSuccess(searchByMealResponseModel: filteredList));
  }

  Future<void> search() async {
    if (searchController.text.isEmpty) {
      emit(SearchByMealSuccess(searchByMealResponseModel: []));
      return;
    }

    emit(SearchByMealLoading());

    final result = await _searchByMealRepo.searchByMeal(searchController.text);

    result.fold(
      (l) {
        emit(SearchByMealError(error: l.message!));
      },
      (r) {
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
      },
    );
  }

  void changeCategory(String value) {
    if (selectedCategory == value) {
      return;
    }
    selectedCategory = value;
    emit(SearchByMealChangeBottomCategoryState());

    final filteredList =
        searchByMealResponseModel.where((meal) {
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
