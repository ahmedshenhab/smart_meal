import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/core/di/di.dart';
import 'package:smart_meal/core/network/local/sql/sqldb.dart';
import 'package:smart_meal/module/auth/login/cubit/cubit.dart';
import 'package:smart_meal/module/auth/login/data/repo/login_repo.dart';
import 'package:smart_meal/module/auth/login/meal_login_screen.dart';
import 'package:smart_meal/module/auth/register/cubit/cubit.dart';
import 'package:smart_meal/module/auth/register/data/repo/register_repo.dart';
import 'package:smart_meal/module/auth/register/meal_register_screen.dart';
import 'package:smart_meal/module/category_screen/category_screen.dart';
import 'package:smart_meal/module/category_screen/cubit/cubit.dart';
import 'package:smart_meal/module/meal_details/cubit/meal_detail_cubit.dart';
import 'package:smart_meal/module/meal_details/meal_datails_screen.dart';
import 'package:smart_meal/module/meal_layout/cubit/cubit.dart';
import 'package:smart_meal/module/meal_layout/data/model/meals_model.dart';
import 'package:smart_meal/module/meal_layout/data/repo/repo_layout.dart.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/meal_layout_screen.dart';

import 'package:flutter/material.dart';
import 'package:smart_meal/module/shopping/cubit/shopping_cubit.dart';
import 'package:smart_meal/module/shopping/shoping_screen.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      //login

      case MealLoginScreen.loginScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<MealLoginCubit>(
                create:
                    (context) => MealLoginCubit(loginRepo: getIt<LoginRepo>()),
                child: const MealLoginScreen(),
              ),
        );

      // register
      case MealRegisterScreen.registerScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        MealRegisterCubit(loginRepo: getIt<RegisterRepo>()),
                child: const MealRegisterScreen(),
              ),
        );

      //homeScreen
      case MealLayoutScreen.homeScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) {
                  return MealLayoutCubit(getIt<RepoLayout>())..getAllMeal();
                },
                child: const MealLayoutScreen(),
              ),
        );
      // mealDetailsScreen
      case MealDetailsScreen.mealDetailsScreen:
        final args = setting.arguments as MealsModel;

        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<MealDetailCubit>(
                create:
                    (context) => MealDetailCubit(
                      mealsModel: args,
                      databaseHelper: getIt<DatabaseHelper>(),
                    ),
                child: const MealDetailsScreen(),
              ),
        );

      case ShopingScreen.shopingScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        ShoppingCubit(getIt<DatabaseHelper>())..getAllCarts(),
                child: const ShopingScreen(),
              ),
        );

      case CategoryScreen.categoryScreen:
        final args = setting.arguments as Map<String, dynamic>;

        final meals = args['meals'] as List<MealsModel>;
        final title = args['title'] as String;
        final icon = args['icon'] as IconData;

        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => CategoryScreenCubit(meals, title, icon),
                child: const CategoryScreen(),
              ),
        );

      default:
        return null;
    }
  }
}
