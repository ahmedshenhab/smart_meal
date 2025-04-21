
import 'package:smart_meal/module/auth/login/data/model/login_response/login_model_response.dart';

abstract class MealLoginStates {}

class MealLoginIntialState extends MealLoginStates {}

class MealLoginLoadingState extends MealLoginStates {}

class MealLoginSuccessState extends MealLoginStates {
  MealLoginSuccessState({required this.loginModelResponse});
  LoginModelResponse loginModelResponse;
}

class MealLoginErrorState extends MealLoginStates {
  MealLoginErrorState({required this.error});
  final String? error;
}

