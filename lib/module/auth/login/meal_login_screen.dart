// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_meal/core/network/local/shared_pref/cach_helper.dart';
import 'package:smart_meal/core/style/meal_color.dart';
import 'package:smart_meal/module/auth/login/cubit/cubit.dart';
import 'package:smart_meal/module/auth/login/cubit/states.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/meal_layout_screen.dart';
import 'package:smart_meal/module/auth/register/meal_register_screen.dart';

import 'package:smart_meal/reusable.dart';


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
                  // MealColor.uId;
                  if (context.mounted) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MealLayoutScreen()),
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
          final mediaQuery = MediaQuery.of(context);
          return Scaffold(
            backgroundColor: MealColor.scaffoldBackgroundheavy,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: mediaQuery.size.height * 0.05,
                  ),
                  // Logo Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/logoLogin.png',
                        // width: mediaQuery.size.width * 0.3,
                        // height: mediaQuery.size.height * 0.09,
                        width: 120.w,
                        height: 100.h
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              overlayColor: Colors.transparent),
                          onPressed: () {},
                          child: Text('Later',
                              style: theme.textTheme.bodyMedium!.copyWith(
                                fontSize: 17.sp,
                                fontFamily: 'SofiaSans',
                                color: MealColor.logInLaterColor,
                              ))),
                    ],
                  ),

                  SizedBox(
                    height: mediaQuery.size.height * 0.028,
                  ),
                  // Login Card Section
                  Container(
                    // margin: EdgeInsets.symmetric(horizontal: 20),
                    width: mediaQuery.size.width * 0.93,
                    height: mediaQuery.size.height * 0.75,
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQuery.size.width / 24),

                    decoration: BoxDecoration(
                      color: MealColor.white,
                      borderRadius: BorderRadius.circular(45.r),
                    ),
                    child: Form(
                      key: formState,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text('login with',
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  fontFamily: 'Poppins',
                                  fontSize: 24.sp,
                                )),
                          ),
                          SizedBox(
                            height: mediaQuery.size.height * 0.04,
                          ),

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

                          SizedBox(
                            height: mediaQuery.size.height * 0.07,
                          ),
                          Transform.translate(
                            offset: Offset(0, -mediaQuery.size.height * 0.01),
                            child: Center(
                              child: Text('-OR-',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    fontSize: 18.sp,
                                    fontFamily: 'Poppins',
                                    color: MealColor.orColor,
                                  )),
                            ),
                          ),

                          SizedBox(height: mediaQuery.size.height * 0.02),

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
                          SizedBox(height: mediaQuery.size.height / 30),

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
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  onPressed: () {
                                    cubit.togglePasswordVisibility();
                                  },
                                  icon: Icon(
                                    cubit.isPasswordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: MealColor.fieldprefixColor,
                                    size: 20.h,
                                  ))),

                          SizedBox(height: mediaQuery.size.height * 0.06),

                          // Log In Button
                          Center(
                            child: SizedBox(
                              width: mediaQuery.size.width * 0.80,
                              height: mediaQuery.size.height * 0.055,
                              // width: 300.w,
                              // height: 40.h,
                              child: state is! MealLoginLoadingState
                                  ? ElevatedButton(
                                      onPressed: () {
                                        if (formState.currentState!
                                            .validate()) {
                                          cubit.userLogin(
                                            password: passwordController.text,
                                            email: emailController.text,
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: MealColor.deepOrange,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                        ),
                                      ),
                                      child: Text(
                                        'Log in',
                                        style: theme.textTheme.bodyMedium!
                                            .copyWith(
                                                fontFamily: 'SofiaSans',
                                                fontSize: 20.sp,
                                                color: MealColor.white),
                                      ),
                                    )
                                  : Center(
                                      child:
                                          CircularProgressIndicator.adaptive()),
                            ),
                          ),

                          // SizedBox(height: mediaQuery.size.height * 0.01),

                          Transform.translate(
                            offset: Offset(0, mediaQuery.size.height * 0.03),
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                  text: "don't have an account? ",
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                      fontFamily: 'SofiaSans',
                                      fontSize: 14.sp,
                                      // height: 0,
                                      color: MealColor.allreadyHaveAcountColor),
                                  children: [
                                    TextSpan(
                                      text: 'Register',
                                      style: theme.textTheme.bodyMedium!
                                          .copyWith(
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationThickness: 0.7.w,
                                              fontFamily: 'SofiaSans',
                                              fontSize: 18.sp,
                                              // height: 0,
                                              color: MealColor
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
                          SizedBox(height: mediaQuery.size.height * 0.04),
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
