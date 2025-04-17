import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/module/auth/login/meal_login_screen.dart';
import 'package:smart_meal/module/auth/register/meal_register_screen.dart';
import 'package:smart_meal/module/meal_details/cubit/meal_detail_cubit.dart';
import 'package:smart_meal/module/meal_details/meal_datails_screen.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/meal_layout_screen.dart';

import 'package:flutter/material.dart';
import 'package:smart_meal/module/shopping/shoping_screen.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      //onboarding
      // case Routes.onBoardingScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const OnboardingScreen(),
      //   );
      //login

      case MealLoginScreen.loginScreen:
        return MaterialPageRoute(builder: (_) => MealLoginScreen());

      //register
      case MealRegisterScreen.registerScreen:
        return MaterialPageRoute(builder: (_) => const MealRegisterScreen());

      //homeScreen
      case MealLayoutScreen.homeScreen:
        return MaterialPageRoute(builder: (_) => const MealLayoutScreen());
      //mealDetailsScreen
      case MealDetailsScreen.mealDetailsScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<MealDetailCubit>(
                create: (context) => MealDetailCubit(),
                child: const MealDetailsScreen(),
              ),
        );

      case ShopingScreen.shopingScreen:
        return MaterialPageRoute(builder: (_) => const ShopingScreen());

      default:
        return null;
    }
  }
}
