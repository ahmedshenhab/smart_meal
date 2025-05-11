import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/network/local/sql/sqldb.dart';
import 'meal_detail_state.dart';
import '../../meal_layout/data/model/meals_model.dart';

class MealDetailCubit extends Cubit<MealDetailStatess> {
  MealDetailCubit({required this.mealsModel, required this.databaseHelper})
    : super(const MealDetailTitleButtonChangeState(title: 'ingredients'));
  final MealsModel mealsModel;
  final DatabaseHelper databaseHelper;

  final Set<String> mealCategory = {'ingredients', 'instructions'};
  String selectedCategory = 'ingredients';

  static MealDetailCubit get(context) => BlocProvider.of(context);

  void changeCategory(String e) {
    if (selectedCategory == e) {
      return;
    }
    selectedCategory = e;

    emit(MealDetailTitleButtonChangeState(title: e));
  }

  void updateQuantity() {
    if (servingController.text.isEmpty) {
      return;
    }
    emit(MealDetailQuanttyUpdateState());
  }

  Future<void> addToCart() async {
    if (selectedIngredientIndexes.isEmpty) {
      return;
    }
     
   final selectedIngrediant = selectedIngredientIndexes.map((element) {
      return mealsModel.ingredients?[element].ingredientName ?? '';
    }).toList();
  

    databaseHelper.insertIngrediantsBatch(  mealsModel.recipeName ?? '', selectedIngrediant);


    emit(MealDetailAddSuccessToCartState());

  }



  final Set<int> selectedIngredientIndexes = {};
  void toggleIngredientSelection(int index) {
    if (selectedIngredientIndexes.contains(index)) {
      selectedIngredientIndexes.remove(index);
    } else {
      selectedIngredientIndexes.add(index);
    }

    log(selectedIngredientIndexes.toString());
   
    emit(MealDetailToggleIngredientCartState());
  }

  final servingController = TextEditingController(text: '1');

  @override
  Future<void> close() {
    servingController.clear();

    servingController.dispose();
    return super.close();
  }
}

// privat constructor
