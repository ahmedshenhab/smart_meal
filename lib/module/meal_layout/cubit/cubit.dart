import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/di.dart';
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
  MealLayoutCubit(this.repoLayout) : super(MealInitialState());
  final RepoLayout repoLayout;
  List<MealsModel> favoriteMeals = [];

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
  Map<int, bool> isFavouriteMap = {};

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

  void getAllMeal(String title, IconData icon) async {
    if (meals.isNotEmpty) {
      emit(MealGetAllMealSuccessState(meals[title], title, icon));
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
                r.where((element) => element.type == 'Breakfast').toList(),
            'Lunch': r.where((element) => element.type == 'Lunch').toList(),
            'Dinner': r.where((element) => element.type == 'Dinner').toList(),
          });
          for (var element in r) {
            isFavouriteMap.addAll({element.recipeId ?? 10: element.isFavorite});
          }

          emit(MealGetAllMealSuccessState(meals[title], title, icon));
        },
      );
    }
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

  final categoriesNames = {
    {"Breakfast": "assets/images/breakFast.png"},
    {"Lunch": "assets/images/lunch.png"},
    {"Dinner": "assets/images/dinner.png"},
  };

  final searchIngrediantController = TextEditingController();
  @override
  Future<void> close() {
    searchIngrediantController.dispose();

    return super.close();
  }
}
