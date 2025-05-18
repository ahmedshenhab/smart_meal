
import '../data/model/login_response/login_model_response.dart';

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
class MealForggetPasswordLoadingState extends MealLoginStates {}

class MealForggetPasswordSuccessState extends MealLoginStates {
  MealForggetPasswordSuccessState({required this.message});
  final String? message;
  
} 

class MealForggetPasswordErrorState extends MealLoginStates {
  MealForggetPasswordErrorState({required this.error});
  final String? error;
}

