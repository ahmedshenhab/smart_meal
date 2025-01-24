import 'package:firebase_auth/firebase_auth.dart';

abstract class MealLoginStates {}

class MealLoginIntialState extends MealLoginStates {}

class MealLoginLoadingState extends MealLoginStates {}

class MealLoginSuccessState extends MealLoginStates {
  final UserCredential value;

  MealLoginSuccessState({required this.value});
}

class MealLoginErrorState extends MealLoginStates {
  final String? error;

  MealLoginErrorState({required this.error});
}

class MealPasswordVisibilityToggledState extends MealLoginStates {}
