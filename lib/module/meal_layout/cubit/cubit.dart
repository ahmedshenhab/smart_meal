import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/core/di/di.dart';
import 'package:smart_meal/module/meal_layout/data/model/meals_model.dart';
import 'package:smart_meal/module/meal_layout/data/repo/repo_layout.dart.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/search/cubit/cubit.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/search/data/repo/repo.dart';
import '../layout_screens/profile.dart';
import '../layout_screens/saved.dart';
import 'stataes.dart';

import '../layout_screens/home/home.dart';
import '../layout_screens/search/search.dart';

class MealLayoutCubit extends Cubit<MealStates> {
  MealLayoutCubit(this.repoLayout) : super(MealInitialState());
  final RepoLayout repoLayout;
  final mealCategories = [
    {
      'title': 'Breakfast',
      'image': 'assets/images/breakFast.png',
      'icon': Icons.breakfast_dining_outlined,
    },
    {
      'title': 'Lunch',
      'image': 'assets/images/lunch.png',
      'icon': Icons.lunch_dining_outlined,
    },
    {
      'title': 'Dinner',
      'image': 'assets/images/dinner.png',
      'icon': Icons.dinner_dining_outlined,
    },
  ];

  Map<String, List<MealsModel>> meals = {};

  final screens = [
    const Home(),
    BlocProvider(
      create:
          (context) =>
              SearchByMealCubit(searchByMealRepo: getIt<SearchByMealRepo>()),
      child: const Search(),
    ),
    const Profile(),
    // const Saved(),
  ];

  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
  ];

  static MealLayoutCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = 0;
  void changeBottomNavIndex(int index) {
    if (index == currentIndex) return;
    currentIndex = index;

    emit(MealChangeBottomNavState());
  }

  void getAllMeal() async {
    emit(MealGetAllMealLoadingState());
    final result = await repoLayout.getAllMeal();
    result.fold(
      (l) {
        emit(MealGetAllMealErrorState(error: l.message!));
      },
      (r) {
        meals.addAll({
          'Breakfast':
              r.where((element) => element.type == 'Breakfast').toList(),
          'Lunch': r.where((element) => element.type == 'Lunch').toList(),
          'Dinner': r.where((element) => element.type == 'Dinner').toList(),
        });

        log('hi${meals.keys}');

        emit(MealGetAllMealSuccessState(meals));
      },
    );
  }

  void searchByIngrediant(String name) async {
    final pattern = RegExp(r'^[A-Za-z]+$');
    if (!pattern.hasMatch(name)) {
      emit(MealSearchByIngrediantErrorState(error: 'invalid ingrediant'));
      return;
    }

    emit(MealSearchByIngrediantLoadingState());
    final result = await repoLayout.searchByIngrediant(name);
    result.fold(
      (l) {
        emit(MealSearchByIngrediantErrorState(error: l.message!));
      },
      (r) {
        emit(MealSearchByIngrediantSuccessState(meals: r));
      },
    );
  }

  final categoriesNames = {
    {"Breakfast": "assets/images/breakFast.png"},
    {"Lunch": "assets/images/lunch.png"},
    {"Dinner": "assets/images/dinner.png"},
  };

  addFavorite(String mealId) async {
    final result = await repoLayout.addFavorite(mealId);

    result.fold(
      (l) {
        emit(MealAddFavoriteErrorState(error: l.message!));
      },
      (r) {
        emit(MealAddFavoriteSuccessState(message: r));
      },
    );
  }

  final searchIngrediantController = TextEditingController();
  @override
  Future<void> close() {
    searchIngrediantController.dispose();

    return super.close();
  }
}
