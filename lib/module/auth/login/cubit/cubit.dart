
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smart_meal/module/auth/login/meal_login_screen.dart';
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



   Future signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      return;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) =>  MealLoginScreen(),
        ),
        (route) => false,
      );
    }
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
