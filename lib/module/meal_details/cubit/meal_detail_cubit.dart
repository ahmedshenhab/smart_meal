import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/module/meal_details/cubit/meal_detail_state.dart';
import 'package:smart_meal/module/meal_layout/data/model/meals_model.dart';

class MealDetailCubit extends Cubit<MealDetailStates> {
  MealDetailCubit({ required this.mealsModel})
    : super(const MealDetailStates(selectedCategory: 'ingredients'));
  final MealsModel mealsModel;
  

  final Set<String> mealCategory = {'ingredients', 'instructions'};

  static MealDetailCubit get(context) => BlocProvider.of(context);

  void changeCategory(String e) {
    if (state.selectedCategory == e) {
      return;
    } else {
      emit(MealDetailStates(selectedCategory: e));
    }
  }
}

// privat constructor
