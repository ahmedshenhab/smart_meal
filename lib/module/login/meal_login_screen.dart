// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/constant/constant.dart';
import 'package:smart_meal/data/network/local/shared_pref/cach_helper.dart';
import 'package:smart_meal/module/meal_layout/meal_layout.dart';
import 'package:smart_meal/module/register/meal_register_screen.dart';

import 'package:smart_meal/reusable.dart';

import 'cubit.dart';
import 'states.dart';

class MealLoginScreen extends StatelessWidget {
  const MealLoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formState = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    ThemeData theme = Theme.of(context);
    return BlocProvider(
      create: (context) => MealLoginCubit(),
      child: BlocConsumer<MealLoginCubit, MealLoginStates>(
        listener: (context, state) {
          if (state is MealLoginErrorState) {
            buildshowToast(msg: state.error!, color: Colors.red);
          }

          if (state is MealLoginSuccessState) {
            if (state.value.user!.emailVerified) {
              CachHelper.setData(
                key: 'uId',
                value: state.value.user!.uid,
              ).then(
                (value) {
                  // Constant.uId;
                  if (context.mounted) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MealLayout()),
                      (route) => false,
                    );
                  }
                },
              );
            } else {
              buildshowToast(
                  msg: 'please verified your mail first', color: Colors.red);
            }
          }
        },
        builder: (context, state) {
          MealLoginCubit cubit = MealLoginCubit.get(context);
          // final mediaQuery = MediaQuery.of(context);
          return Scaffold(
            backgroundColor: Constant.scaffoldBackgroundheavy,
            body: SingleChildScrollView(
              child: Column(
                children: [ 
                  
                  SizedBox(
                    height: 40.h,
                    // height: 40,
                  ),
                  // Logo Section
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/logoLogin.png',
                          width: 175,
                          height: 120,
                        ),
                        TextButton(
                            // style:
                            //     TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () {},
                            child: Text('Later',
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  fontSize: 18,
                                  fontFamily: 'SofiaSans',
                                  color: Constant.logInLaterColor,
                                ))),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  // Login Card Section
                  Container(
                    // margin: EdgeInsets.symmetric(horizontal: 20),
                    width: 350.w,
                    height: 550.h,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Constant.white,
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: Form(
                      key: formState,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.translate(
                            offset: Offset(0, -80),
                            child: Center(
                              child: Text('Log in',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    fontFamily: 'Poppins',
                                    fontSize: 24.sp,
                                  )),
                            ),
                          ),
                          // SizedBox(height: 100),

                          buildLoginField(
                            context,
                            controller: emailController,
                            hintText: 'Email Address',
                            validator: (value) {
                              // Enhanced validation
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              } else if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            type: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 40),

                          buildLoginField(context,
                              controller: passwordController,
                              hintText: 'Password', validator: (value) {
                            if (value!.isEmpty || value.length < 6) {
                              return 'password is to short';
                            }
                            return null;
                          },
                              isHiddenPassword: cubit.isPasswordVisible,
                              type: TextInputType.visiblePassword,
                              sufixIconBotton: IconButton(
                                  // splashColor: Colors.transparent,
                                  // highlightColor: Colors.transparent,
                                  // hoverColor: Colors.transparent,
                                  onPressed: () {
                                    cubit.togglePasswordVisibility();
                                  },
                                  icon: Icon(
                                    cubit.isPasswordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Constant.fieldprefixColor,
                                    size: 25,
                                  ))),

                          SizedBox(height: 14),

                          // // Forgot Password
                          TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero),
                              onPressed: () {},
                              child: Text('forgot password ?',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    color: Constant.logInLaterColor,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 0.9,
                                  ))),

                          SizedBox(height: 40),

                          // Log In Button
                          SizedBox(
                            width: 327,
                            height: 53,
                            child: state is! MealLoginLoadingState
                                ? ElevatedButton(
                                    onPressed: () {
                                      if (formState.currentState!.validate()) {
                                        cubit.userLogin(
                                          password: passwordController.text,
                                          email: emailController.text,
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Constant.deepOrange,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    child: Text(
                                      'Log in',
                                      style: theme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontFamily: 'SofiaSans',
                                              fontSize: 20,
                                              color: Constant.white),
                                    ),
                                  )
                                : Center(child: CircularProgressIndicator()),
                          ),

                          SizedBox(
                            height: 4,
                          ),
                          Transform.translate(
                            offset: Offset(0, 15),
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                  text: "don't have an account ",
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                      fontFamily: 'SofiaSans',
                                      fontSize: 14,
                                      height: 0,
                                      color: Constant.allreadyHaveAcountColor),
                                  children: [
                                    TextSpan(
                                      text: 'Sign in',
                                      style: theme.textTheme.bodyMedium!
                                          .copyWith(
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationThickness: 0.7,
                                              fontFamily: 'SofiaSans',
                                              fontSize: 18,
                                              height: 0,
                                              color: Constant
                                                  .allreadyHaveAcountColor),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const MealRegisterScreen()),
                                            (route) => false,
                                          );
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
