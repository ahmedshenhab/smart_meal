import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/model/login_request/login_model_request.dart';
import '../data/repo/login_repo.dart';
import 'states.dart';

class MealLoginCubit extends Cubit<MealLoginStates> {
  MealLoginCubit({required LoginRepo loginRepo})
    : _loginRepo = loginRepo,
      super(MealLoginIntialState());

  final LoginRepo _loginRepo;

  static MealLoginCubit get(BuildContext context) => BlocProvider.of(context);
  void checkValidate() {
    if (formState.currentState!.validate()) {
      loginUser();
    }
  }

  void loginUser() async {
    emit(MealLoginLoadingState());

    final result = await _loginRepo.loginUser(
      LoginModelRequest(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    result.fold(
      (l) {
        emit(MealLoginErrorState(error: l.message));
      },
      (r) {

        
        emit(MealLoginSuccessState(loginModelResponse: r));

      },
    );
  }

  // ui

  final formState = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = true;

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}




// userLogin({required String password, required String email}) {
//     emit(MealLoginLoadingState());

//     FirebaseAuth.instance
//         .signInWithEmailAndPassword(email: email, password: password)
//         .then((value) {
//           log('email verifid from login ${value.user!.emailVerified}');
//           emit(MealLoginSuccessState(value: value));
//         })
//         .catchError((error) {
//           emit(MealLoginErrorState(error: error.toString()));
//         });
//   }

  // Future signInWithGoogle(BuildContext context) async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   if (googleUser == null) {
  //     return;
  //   }

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser.authentication;

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   await FirebaseAuth.instance.signInWithCredential(credential);
  //   if (context.mounted) {
  //     Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(builder: (context) => MealLoginScreen()),
  //       (route) => false,
  //     );
  //   }
  // }
