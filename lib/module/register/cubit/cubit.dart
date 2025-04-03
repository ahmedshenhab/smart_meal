import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smart_meal/module/login/meal_login_screen.dart';
import '../../../data/model/social_user_model.dart';
import 'states.dart';
import '../../shred_widget/reusable_widget.dart';

class MealRegisterCubit extends Cubit<MealRegisterStates> {
  MealRegisterCubit() : super(MealRegisterIntialState());

  static MealRegisterCubit get(BuildContext context) =>
      BlocProvider.of(context);
  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(MealRegisterPasswordVisibilityToggledState());
  }

  void userRegister({
    required String password,
    required String email,
    required String name,
    // required String phone
  }) {
    emit(MealRegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then(
      (value) {
        log('from register');
        log(value.user!.uid.toString());
        log(value.user!.email.toString());

        // emit(MealRegisterSuccessState());
        userCreate(
          uId: value.user!.uid,
          email: email,
          name: name,
          // phone: phone,
          isEmailVerivied: false,
        );
      },
    ).catchError((error) {
      log(error.toString());
      emit(MealRegisterErrorState(error: error.toString()));
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
          builder: (context) => const MealLoginScreen(),
        ),
        (route) => false,
      );
    }
  }

// create user after register drictrly
// to take every on personal data and storage
// because the register make register only so we
// need this to store user data in firedatabase
  void userCreate({
    required String uId,
    required String email,
    required String name,
    // required String phone,
    required bool isEmailVerivied,
    // required String image,
    // required String cover,
    // required String bio,
  }) {
    final mealUserModel = MealUserModel(
      email: email,
      name: name,
      // phone: phone,
      uId: uId,
      isEmailVerivied: isEmailVerivied,
      // cover: Constant.homeImage1,
      // image: Constant.homeImage2,
      // bio: 'write bio...'
    );
    FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .set(mealUserModel.toMap)
        .then(
      (value) {
        userVerification;
        emit(MealCreateUserAndVerificationSuccessState());
      },
    ).catchError((error) {
      emit(MealCreateUserAndVerificationErrorState(error: error.toString()));
    });
  }

  void get userVerification {
    FirebaseAuth.instance.currentUser!.sendEmailVerification().then(
      (value) {
        // emit(MealVerificationSentSuccessState());

        buildshowToast(
          msg: 'user created, check you mail to verification then LogIn',
          color: Colors.green,
        );
      },
    ).catchError((e) {
      log('MealVerificationErrorState$e');
      // emit(MealVerificationSentErrorState());
    });
  }
}























//  void userRegister(
//       {required String password,
//       required String email,
//       required String name,
//       required String phone}) {
//     emit(MealRegisterLoadingState());
//     FirebaseAuth.instance
//         .createUserWithEmailAndPassword(email: email, password: password)
//         .then(
//       (value) {
//         log('from register');
//         log(value.user!.uid.toString());
//         log(value.user!.email.toString());

//         // emit(MealRegisterSuccessState());
//         userCreate(
//           uId: value.user!.uid,
//           email: email,
//           name: name,
//           phone: phone,
//           isEmailVerivied: false,
//         );
//       },
//     ).catchError((error) {
//       log(error.toString());
//       emit(MealRegisterErrorState(error: error.toString()));
//     });
//   }

// // create user after register drictrly
// // to take every on personal data and storage
// // because the register make register only so we
// // need this to store user data in firedatabase
//   void userCreate({
//     required String uId,
//     required String email,
//     required String name,
//     required String phone,
//     required bool isEmailVerivied,
//     // required String image,
//     // required String cover,
//     // required String bio,
//   }) {
//     final MealUserModel MealUserModel = MealUserModel(
//         email: email,
//         name: name,
//         phone: phone,
//         uId: uId,
//         isEmailVerivied: isEmailVerivied,
//         cover: Constant.homeImage1,
//         image: Constant.homeImage2,
//         bio: 'write bio...');
//     FirebaseFirestore.instance
//         .collection('user')
//         .doc(uId)
//         .set(MealUserModel.toMap)
//         .then(
//       (value) {
//         userVerification;
//         emit(MealCreateUserAndVerificationSuccessState());
//       },
//     ).catchError((error) {
//       emit(MealCreateUserAndVerificationErrorState(error: error.toString()));
//     });
//   }

//   void get userVerification {
//     FirebaseAuth.instance.currentUser!.sendEmailVerification().then(
//       (value) {
//         // emit(MealVerificationSentSuccessState());

//         buildshowToast(
//           msg: 'user created, check you mail to verification then LogIn',
//           color: Colors.green,
//         );
//       },
//     ).catchError((e) {
//       log('MealVerificationErrorState$e');
//       // emit(MealVerificationSentErrorState());
//     });
//   }
