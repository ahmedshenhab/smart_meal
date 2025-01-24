
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'states.dart';

class MealLoginCubit extends Cubit<MealLoginStates> {
  MealLoginCubit() : super(MealLoginIntialState());

  static MealLoginCubit get(BuildContext context) => BlocProvider.of(context);
  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(MealPasswordVisibilityToggledState());
  }




userLogin({
    required String password,
    required String email,
  }) {
    emit(MealLoginLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
      (value) {
        log('email verifid from login ${value.user!.emailVerified}');
        emit(MealLoginSuccessState(value: value));
      },
    ).catchError((error) {
      emit(MealLoginErrorState(error: error.toString()));
    });
  }


}


















  // userLogin({
  //   required String password,
  //   required String email,
  // }) {
  //   emit(MealLoginLoadingState());

  //   FirebaseAuth.instance
  //       .signInWithEmailAndPassword(email: email, password: password)
  //       .then(
  //     (value) {
  //       log('email verifid from login ${value.user!.emailVerified}');
  //       emit(MealLoginSuccessState(value: value));
  //     },
  //   ).catchError((error) {
  //     emit(MealLoginErrorState(error: error.toString()));
  //   });
  // }
