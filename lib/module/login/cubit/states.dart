import 'package:firebase_auth/firebase_auth.dart';

abstract class MealLoginStates {}

class MealLoginIntialState extends MealLoginStates {}

class MealLoginLoadingState extends MealLoginStates {}

class MealLoginSuccessState extends MealLoginStates {

  MealLoginSuccessState({required this.value});
  final UserCredential value;
}

class MealLoginErrorState extends MealLoginStates {

  MealLoginErrorState({required this.error});
  final String? error;
}

class MealPasswordVisibilityToggledState extends MealLoginStates {}
