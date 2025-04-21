import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/module/auth/register/data/model/register_request/register_model_request.dart';
import 'package:smart_meal/module/auth/register/data/repo/register_repo.dart';
import 'states.dart';

class MealRegisterCubit extends Cubit<MealRegisterStates> {
  MealRegisterCubit({required RegisterRepo loginRepo})
    : _loginRepo = loginRepo,
      super(MealRegisterIntialState());
  final RegisterRepo _loginRepo;

  static MealRegisterCubit get(BuildContext context) =>
      BlocProvider.of<MealRegisterCubit>(context);

  bool isPasswordVisible = false;

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  void checkValidate() {
    if (formKey.currentState!.validate()) {
      loginUser();
    }
  }

  void loginUser() async {
    emit(MealRegisterLoadingState());

    final result = await _loginRepo.createUser(
      RegisterModelRequest(
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: passwordController.text,
        fullName: nameController.text,
      ),
    );
    result.fold(
      (l) {
        emit(MealRegisterErrorState(error: l.detail));
      },
      (_) {
        emailController.clear();
        passwordController.clear();
        nameController.clear();
        emit(MealRegisterSuccessState());
      },
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();

    return super.close();
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
