abstract class MealRegisterStates {}

class MealRegisterIntialState extends MealRegisterStates {}

class MealRegisterLoadingState extends MealRegisterStates {}

class MealRegisterSuccessState extends MealRegisterStates {}

class MealRegisterErrorState extends MealRegisterStates {
  final String error;

  MealRegisterErrorState({required this.error});
}

class MealCreateUserAndVerificationSuccessState extends MealRegisterStates {}

class MealCreateUserAndVerificationErrorState extends MealRegisterStates {
  final String error;

  MealCreateUserAndVerificationErrorState({required this.error});
}
class MealRegisterPasswordVisibilityToggledState
    extends MealRegisterStates {}
