import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/module/meal_layout/data/model/meals_model.dart';
import 'package:smart_meal/module/recommendation_meal_screen/data/repo.dart';

part 'recommendation_state.dart';

class RecommendationCubit extends Cubit<RecommendationStates> {
  RecommendationCubit({required RepoRecommendation repo})
    : _repo = repo,
      super(RecommendationInitial());
  List<MealsModel> meals = [];
  final RepoRecommendation _repo;

  static RecommendationCubit get(context) =>
      BlocProvider.of<RecommendationCubit>(context);

  double calories = 1000;
  double protein = 100;
  double sugar = 100;
  double fats = 100;
  double carbs = 100;

  Future<void> getRecommendation() async {
    emit(RecommendationLoading());
    final result = await _repo.getRecommendation();
    result.fold(
      (l) {
        emit(RecommendationError(error: l.message!));
      },
      (r) {
        meals = r;
        emit(RecommendationSuccess(meals: r));
      },
    );
  }

  // void filterSearch() {
  //   if (meals.isEmpty) {
  //     // emit(CategoryScreenStates(meals: []));
  //     return;
  //   }

  //   final filteredList =
  //       meals.where((meal) {
  //         return (meal.calories100g ?? 0) <= calories &&
  //             (meal.protein100g ?? 0) <= protein &&
  //             (meal.sugar100g ?? 0) <= sugar &&
  //             (meal.fat100g ?? 0) <= fats &&
  //             (meal.carb100 ?? 0) <= carbs;
  //       }).toList();

  //   // emit(CategoryScreenStates(meals: filteredList));
  // }

  // void serch(String name) {
  //   if (meals.isEmpty) return;

  //   final query = name.trim().toLowerCase();

  //   final filteredList =
  //       meals.where((meal) {
  //         final mealName = (meal.recipeName ?? 'default').toLowerCase();

  //         final matchesText =
  //             mealName == query ||
  //             mealName.startsWith(query) ||
  //             mealName.contains(query);

  //         final matchesNutrition =
  //             (meal.calories100g ?? 0) <= calories &&
  //             (meal.protein100g ?? 0) <= protein &&
  //             (meal.sugar100g ?? 0) <= sugar &&
  //             (meal.fat100g ?? 0) <= fats &&
  //             (meal.carb100 ?? 0) <= carbs;

  //         return matchesText && matchesNutrition;
  //       }).toList();
  //   // emit(CategoryScreenStates(meals: filteredList));
  // }
}
