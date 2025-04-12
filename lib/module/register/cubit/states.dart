abstract class MealRegisterStates {}

class MealRegisterIntialState extends MealRegisterStates {}

class MealRegisterLoadingState extends MealRegisterStates {}

class MealRegisterSuccessState extends MealRegisterStates {}

class MealRegisterErrorState extends MealRegisterStates {

  MealRegisterErrorState({required this.error});
  final String error;
}

class MealCreateUserAndVerificationSuccessState extends MealRegisterStates {}

class MealCreateUserAndVerificationErrorState extends MealRegisterStates {

  MealCreateUserAndVerificationErrorState({required this.error});
  final String error;
}
class MealRegisterPasswordVisibilityToggledState
    extends MealRegisterStates {}
