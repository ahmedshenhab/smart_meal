import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/core/app_constant.dart';
import 'package:smart_meal/core/services/shared_prefrence/cach_helper.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/profile/data/model/avoidance_model.dart';
import '../../../core/di/setup.dart';
import '../../../core/style/app_color.dart';
import '../data/model/meals_model.dart';
import '../data/repo/repo_layout.dart.dart';
import '../layout_screens/saved/saved.dart';
import '../layout_screens/search/cubit/cubit.dart';
import '../layout_screens/search/data/repo/repo.dart';
import '../../../reusable.dart';
import '../layout_screens/profile.dart';
import 'stataes.dart';

import '../layout_screens/home/home.dart';
import '../layout_screens/search/search.dart';

class MealLayoutCubit extends Cubit<MealStates> {
  MealLayoutCubit(this.repoLayout) : super(MealInitialState()) {
    for (var allergy in AvoidanceModel.allergyAvoidanceList) {
      allergies[allergy.key] = false;
    }
    for (var disease in AvoidanceModel.diseaseAvoidanceList) {
      diseases[disease.key] = false;
    }
  }
  final RepoLayout repoLayout;
  List<MealsModel> favoriteMeals = [];
  late Map<String, String> categoryMap = {};

  Map<String, List<MealsModel>> meals = {};

  Map<int, bool> isFavouriteMap = {};
  Map<String, bool> allergies = {};
  Map<String, bool> diseases = {};

  final screens = [
    const Home(),
    BlocProvider(
      create:
          (context) =>
              SearchByMealCubit(searchByMealRepo: getIt<SearchByMealRepo>()),
      child: const Search(),
    ),
    const Profile(),
    const Saved(),
  ];

  static MealLayoutCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = 0;
  void changeBottomNavIndex(int index) {
    if (index == currentIndex) return;
    currentIndex = index;
    if (index == 3) {
      getAllFavorite();
    }

    emit(MealChangeBottomNavState());
  }

  void toggleAllergy(String key, bool? value) async {
    allergies[key] = value ?? false;
    await CachHelper.setData(
      key: AppConstant.userallergy,
      value: jsonEncode(allergies),
    );
    emit(MealChangeAllergiesState(key));
  }

  void toggleDisease(String key, bool? value) {
    diseases[key] = value ?? false;
    CachHelper.setData(
      key: AppConstant.userDisease,
      value: jsonEncode(diseases),
    );

    emit(MealChangeDiseasesState(key));
  }

  void loadUserAvoidanceData() {
    final savedAllergies = CachHelper.getData(key: 'user_allergies');
    if (savedAllergies != null) {
      final decoded = jsonDecode(savedAllergies) as Map<String, bool>;
      allergies = Map<String, bool>.from(decoded);
    }

    final savedDiseases = CachHelper.getData(key: 'user_diseases');
    if (savedDiseases != null) {
      final decoded = jsonDecode(savedDiseases);
      diseases = Map<String, bool>.from(decoded);
    }
  }

  void getAllMeal(String title, IconData icon, String key) async {
    if (meals.isNotEmpty) {
      emit(MealGetAllMealSuccessState(meals[key], title, icon));
      return;
    } else {
      emit(MealGetAllMealLoadingState());
      final result = await repoLayout.getAllMeal();
      result.fold(
        (l) {
          emit(MealGetAllMealErrorState(error: l.message!));
        },
        (r) {
          meals.addAll({
            'Breakfast':
                r
                    .where(
                      (element) => element.type == categoryMap['Breakfast'],
                    )
                    .toList(),
            'Lunch':
                r
                    .where((element) => element.type == categoryMap['Lunch'])
                    .toList(),
            'Dinner':
                r
                    .where((element) => element.type == categoryMap['Dinner'])
                    .toList(),
          });
          for (var element in r) {
            isFavouriteMap.addAll({element.recipeId ?? 10: element.isFavorite});
          }

          emit(MealGetAllMealSuccessState(meals[key], title, icon));
        },
      );
    }
  }

  void searchByIngrediant(String name) async {
    // final pattern = RegExp(r'^[A-Za-z]+$');
    // if (!pattern.hasMatch(name)) {
    //   emit(MealSearchByIngrediantErrorState(error: 'invalid ingrediant'));
    //   return;
    // }

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

  void getAllFavorite() async {
    emit(MealGetAllFavoriteLoadingState());
    final result = await repoLayout.getFavorite();
    result.fold(
      (l) {
        emit(MealGetAllFavoriteErrorState(error: l));
      },
      (r) {
        if (favoriteMeals.isNotEmpty) {
          favoriteMeals.clear();
        }

        favoriteMeals = r;

        emit(MealGetAllFavoriteSuccessState());
      },
    );
  }

  changefavorite(int id) async {
    if (isFavouriteMap[id]!) {
      deleteFavorite(id);
    } else {
      addFavorite(id);
    }
  }

  void addFavorite(int id) async {
    isFavouriteMap[id] = !(isFavouriteMap[id] ?? false);
    emit(MealChangeFavoriteTemporaryState());
    final result = await repoLayout.addFavorite(id);

    result.fold(
      (l) {
        isFavouriteMap[id] = !(isFavouriteMap[id] ?? false);
        emit(MealChangeFavoriteErrorState(message: l.message ?? ''));
      },
      (r) {
        emit(MealChangeFavoriteSuccessState(message: r));
      },
    );
  }

  void deleteFavorite(int id) async {
    isFavouriteMap[id] = !(isFavouriteMap[id] ?? false);
    emit(MealChangeFavoriteTemporaryState());
    final result = await repoLayout.deleteFavoriteById(id);

    result.fold(
      (l) {
        isFavouriteMap[id] = !(isFavouriteMap[id] ?? false);
        emit(MealChangeFavoriteErrorState(message: l.message ?? ''));
      },
      (r) {
        emit(MealChangeFavoriteSuccessState(message: r));
      },
    );
  }

  void deleteFavoriteFromsaved(int id) async {
    if (isFavouriteMap.isNotEmpty) {
      isFavouriteMap[id] = !(isFavouriteMap[id] ?? false);
    }

    // facke delete(temporary)
    for (int i = 0; i < favoriteMeals.length; i++) {
      if (favoriteMeals[i].recipeId == id) {
        favoriteMeals[i] = favoriteMeals[i].copyWith(
          isFavorite: !(favoriteMeals[i].isFavorite),
        );
        break;
      }
    }
    emit(MealGetAllFavoriteSuccessState());

    // emit(MealChangeFavoriteTemporaryState());

    final result = await repoLayout.deleteFavoriteById(id);

    result.fold(
      (l) {
        if (isFavouriteMap.isNotEmpty) {
          isFavouriteMap[id] = !(isFavouriteMap[id] ?? false);
        }
        for (int i = 0; i < favoriteMeals.length; i++) {
          if (favoriteMeals[i].recipeId == id) {
            favoriteMeals[i] = favoriteMeals[i].copyWith(
              isFavorite: !(favoriteMeals[i].isFavorite),
            );
            break;
          }
        }

        // back to normal because of error on delete

        emit(MealGetAllFavoriteSuccessState());
        buildshowToast(msg: l.message ?? '', color: AppColor.deepOrange);

        // emit(MealChangeFavoriteErrorState(message: l.message ?? ''));
      },
      (r) {
        favoriteMeals.removeWhere((element) => element.recipeId == id);

        emit(MealGetAllFavoriteSuccessState());
        buildshowToast(msg: r, color: AppColor.green);
        // emit(MealChangeFavoriteSuccessState(message: r));
      },
    );
  }

  final TextEditingController nameController = TextEditingController(
    text: CachHelper.getData(key: AppConstant.userName),
  );
  final TextEditingController emailController = TextEditingController(
    text: CachHelper.getData(key: AppConstant.email),
  );
  final searchIngrediantController = TextEditingController();
  @override
  Future<void> close() {
    searchIngrediantController.dispose();

    return super.close();
  }
}
