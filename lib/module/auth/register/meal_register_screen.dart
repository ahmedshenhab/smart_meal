// ignore_for_file: prefer_const_constructors
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/core/style/app_color.dart';
import 'package:smart_meal/module/auth/login/meal_login_screen.dart';
import '../../../reusable.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class MealRegisterScreen extends StatelessWidget {
  const MealRegisterScreen({super.key});
  static const String registerScreen = '/registerScreen';

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final nameController = TextEditingController();

    final formState = GlobalKey<FormState>();
    ThemeData theme = Theme.of(context);

    return BlocProvider(
      create: (context) => MealRegisterCubit(),
      child: BlocConsumer<MealRegisterCubit, MealRegisterStates>(
        listener: (context, state) {
          if (state is MealCreateUserAndVerificationSuccessState) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => MealLoginScreen()),
              (route) => false,
            );
          }
        },
        builder: (BuildContext context, MealRegisterStates state) {
          MealRegisterCubit cubit = MealRegisterCubit.get(context);
          final mediaQuery = MediaQuery.of(context);
          return Scaffold(
            backgroundColor: AppColor.scaffoldBackgroundheavy,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: mediaQuery.size.height * 0.05),
                  // Logo Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/logoLogin.png',
                        width: 120.w,
                        height: 100.h,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          overlayColor: Colors.transparent,
                        ),
                        // style:
                        //     TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {},
                        child: Text(
                          'Later',
                          style: theme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.sp,
                            fontFamily: 'SofiaSans',
                            color: AppColor.logInLaterColor,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: mediaQuery.size.height * 0.028),

                  // register  Card Section
                  Container(
                    // margin: EdgeInsets.symmetric(horizontal: 20),
                    width: mediaQuery.size.width * 0.93,
                    height: mediaQuery.size.height * 0.75,
                    padding: EdgeInsets.symmetric(
                      horizontal: mediaQuery.size.width / 24,
                    ),

                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(45.r),
                    ),
                    child: Form(
                      key: formState,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'Register with',
                              style: theme.textTheme.bodyMedium!.copyWith(
                                fontFamily: 'Poppins',
                                fontSize: 24.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: mediaQuery.size.height * 0.04),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  cubit.signInWithGoogle(context);
                                },
                                child: SvgPicture.asset(
                                  'assets/images/Google.svg',
                                  width: mediaQuery.size.width / 8,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  log(mediaQuery.size.width.toString());
                                  log((mediaQuery.size.width * 0.5).toString());
                                },
                                child: SvgPicture.asset(
                                  'assets/images/facebook.svg',
                                  width: mediaQuery.size.width / 8,
                                ),
                              ),
                            ],
                          ),

                          Transform.translate(
                            offset: Offset(
                              mediaQuery.size.width * 0.36,
                              mediaQuery.size.height * 0.05,
                            ),
                            child: Text(
                              '-OR-',
                              style: theme.textTheme.bodyMedium!.copyWith(
                                fontSize: 18.sp,
                                fontFamily: 'Poppins',
                                color: AppColor.orColor,
                              ),
                            ),
                          ),

                          SizedBox(height: mediaQuery.size.height * 0.05),
                          buildLoginField(
                            context,
                            controller: nameController,
                            hintText: 'Full Name',
                            validator: (value) {
                              // Enhanced validation
                              if (value!.isEmpty || value.length < 3) {
                                return 'name at least 3 character';
                              }
                              return null;
                            },
                            type: TextInputType.name,
                          ),
                          SizedBox(height: mediaQuery.size.height / 30),

                          buildLoginField(
                            context,
                            controller: emailController,
                            hintText: 'Email Address',
                            validator: (value) {
                              // Enhanced validation
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                              ).hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            type: TextInputType.emailAddress,
                          ),
                          SizedBox(height: mediaQuery.size.height / 30),

                          buildLoginField(
                            context,
                            controller: passwordController,
                            hintText: 'Password',
                            validator: (value) {
                              if (value!.isEmpty || value.length < 6) {
                                return 'password is to short';
                              }
                              return null;
                            },
                            isHiddenPassword: cubit.isPasswordVisible,
                            type: TextInputType.visiblePassword,
                            sufixIconBotton: IconButton(
                              // splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              onPressed: () {
                                cubit.togglePasswordVisibility();
                              },
                              icon: Icon(
                                cubit.isPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColor.fieldprefixColor,
                                size: 20.h,
                              ),
                            ),
                          ),

                          SizedBox(height: mediaQuery.size.height * 0.06),

                          // register In Button
                          Center(
                            child: SizedBox(
                              width: mediaQuery.size.width * 0.80,
                              height: mediaQuery.size.height * 0.055,
                              child:
                                  state is! MealRegisterLoadingState
                                      ? ElevatedButton(
                                        onPressed: () {
                                          if (formState.currentState!
                                              .validate()) {
                                            cubit.userRegister(
                                              name: nameController.text,
                                              password: passwordController.text,
                                              email: emailController.text,
                                            );
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColor.deepOrange,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              16.r,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          'Create Account',
                                          style: theme.textTheme.bodyMedium!
                                              .copyWith(
                                                fontFamily: 'SofiaSans',
                                                fontSize: 20.sp,
                                                color: AppColor.white,
                                              ),
                                        ),
                                      )
                                      : const Center(
                                        child:
                                            CircularProgressIndicator.adaptive(),
                                      ),
                            ),
                          ),

                          Transform.translate(
                            offset: Offset(0, mediaQuery.size.height * 0.03),
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                  text: 'Already have an account? ',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    fontFamily: 'SofiaSans',
                                    fontSize: 14.sp,
                                    // height: 0,
                                    color: AppColor.allreadyHaveAcountColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Log in',
                                      style: theme.textTheme.bodyMedium!
                                          .copyWith(
                                            decoration:
                                                TextDecoration.underline,
                                            decorationThickness: 0.7.w,
                                            fontFamily: 'SofiaSans',
                                            fontSize: 18.sp,
                                            // height: 0,
                                            color:
                                                AppColor
                                                    .allreadyHaveAcountColor,
                                          ),
                                      recognizer:
                                          TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.of(
                                                context,
                                              ).pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                  builder:
                                                      (context) =>
                                                          MealLoginScreen(),
                                                ),
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
