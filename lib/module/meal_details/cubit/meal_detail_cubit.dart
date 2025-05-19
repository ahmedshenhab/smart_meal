import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/core/app_constant.dart';
import 'package:smart_meal/core/services/shared_prefrence/cach_helper.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/profile/data/model/avoidance_model.dart';
import '../../../core/services/sql/sqldb.dart';
import 'meal_detail_state.dart';
import '../../meal_layout/data/model/meals_model.dart';

class MealDetailCubit extends Cubit<MealDetailStatess> {
  MealDetailCubit({required this.mealsModel, required this.databaseHelper})
    : super(MealDetailTitleButtonChangeState()) {
    loadcases();
    checkDinger();
  }

  final MealsModel mealsModel;
  final DatabaseHelper databaseHelper;
  Map<String, bool>? diseases;
  Map<String, bool>? allergies;
  String selectedCategory = 'ingredients';
  bool isdinger = false;
  int get servingCount {
    final text = servingController.text.replaceAll(RegExp(r'[^\d]'), '').trim();

    if (text.isEmpty) return 1;

    return int.tryParse(text) ?? 1;
  }

  void checkDinger() {
    if (allergies == null || diseases == null) {
      return;
    }

    isdinger = false;

    // 🔎 Check allergies
    for (final entry in allergies!.entries) {
      if (entry.value) {
        final avoidance = AvoidanceModel.allergyAvoidanceList.firstWhere(
          (element) => element.key == entry.key,
          orElse: () => AvoidanceModel(key: '', items: []),
        );

        for (final item in avoidance.items) {
          final found = mealsModel.ingredients?.any(
            (ingredient) => ingredient.ingredientName.toLowerCase().contains(
              item.toLowerCase(),
            ),
          );

          if (found == true) {
            isdinger = true;
            return; // 🚨 Stop immediately once a dangerous item is found
          }
        }
      }
    }

    // 🔎 Check diseases
    for (final entry in diseases!.entries) {
      if (entry.value) {
        final avoidance = AvoidanceModel.diseaseAvoidanceList.firstWhere(
          (element) => element.key == entry.key,
          orElse: () => AvoidanceModel(key: '', items: []),
        );

        for (final item in avoidance.items) {
          final found = mealsModel.ingredients?.any(
            (ingredient) => ingredient.ingredientName.toLowerCase().contains(
              item.toLowerCase(),
            ),
          );

          if (found == true) {
            isdinger = true;
            return; // 🚨 Stop immediately once a dangerous item is found
          }
        }
      }
    }
  }

  void loadcases() {
    final savedAllergyJson = CachHelper.getData(key: AppConstant.userallergy);
    final savedDiseaseJson = CachHelper.getData(key: AppConstant.userDisease);
    if (savedAllergyJson != null && savedAllergyJson.isNotEmpty) {
      allergies = Map<String, bool>.from(json.decode(savedAllergyJson));
    }
    if (savedDiseaseJson != null && savedDiseaseJson.isNotEmpty) {
      diseases = Map<String, bool>.from(json.decode(savedDiseaseJson));
    }
  }

  static MealDetailCubit get(context) => BlocProvider.of(context);

  void changeCategory(String e) {
    if (selectedCategory == e) {
      return;
    }
    selectedCategory = e;

    emit(MealDetailTitleButtonChangeState());
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

    final selectedIngrediant =
        selectedIngredientIndexes.map((element) {
          return mealsModel.ingredients?[element].ingredientName ?? '';
        }).toList();

    databaseHelper.insertIngrediantsBatch(
      mealsModel.recipeName ?? '',
      selectedIngrediant,
    );

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
