import 'package:smart_meal/module/auth/login/meal_login_screen.dart';
import 'package:smart_meal/module/auth/register/meal_register_screen.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/meal_layout_screen.dart';

import 'routes_constant.dart';

import 'package:flutter/material.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      //onboarding
      // case Routes.onBoardingScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const OnboardingScreen(),
      //   );
      //login
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder:
              (_) => const MealLoginScreen(),
        );

      //register
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder:
              (_) => const MealRegisterScreen(),
        );

      //homeScreen
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder:
              (_) => const MealLayoutScreen(),
        );

      default:
        return null;
    }
  }
}
