// ignore_for_file: prefer_const_constructors
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/module/login/meal_login_screen.dart';
import '../../constant/constant.dart';
import '../../reusable.dart';
import 'cubit.dart';
import 'states.dart';

class MealRegisterScreen extends StatelessWidget {
  const MealRegisterScreen({super.key});

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
              MaterialPageRoute(builder: (_) => const MealLoginScreen()),
              (route) => false,
            );
          }
        },
        builder: (BuildContext context, MealRegisterStates state) {
          MealRegisterCubit cubit = MealRegisterCubit.get(context);
          return Scaffold(
            backgroundColor: Constant.scaffoldBackgroundheavy,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  // Logo Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
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
                    width: 350,
                    height: 600,
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
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
                          Center(
                            child: Text('Create Account',
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  fontFamily: 'Poppins',
                                  fontSize: 24,
                                )),
                          ),
                          SizedBox(
                            height: 50,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  cubit.signInWithGoogle(context);
                                },
                                child: SvgPicture.asset(
                                  'assets/images/google1.svg',
                                  width: 155,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/images/facebook1.svg',
                                  width: 155,
                                ),
                              ),
                            ],
                          ),

                          Transform.translate(
                            offset: Offset(135, 44),
                            child: Text('-OR-',
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  color: Constant.orColor,
                                )),
                          ),

                          SizedBox(height: 60),
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
                          SizedBox(height: 20),
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
                          SizedBox(height: 20),

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

                          SizedBox(height: 35),

                          // Log In Button
                          SizedBox(
                            width: 327,
                            height: 50,
                            child: state is! MealRegisterLoadingState
                                ? ElevatedButton(
                                    onPressed: () {
                                      if (formState.currentState!.validate()) {
                                        cubit.userRegister(
                                          name: nameController.text,
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
                                      'Create Account',
                                      style: theme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontFamily: 'SofiaSans',
                                              fontSize: 20,
                                              color: Constant.white),
                                    ),
                                  )
                                : const Center(
                                    child: CircularProgressIndicator()),
                          ),

                          Transform.translate(
                            offset: Offset(0, 15),
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                  text: 'Already have an account? ',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                      fontFamily: 'SofiaSans',
                                      fontSize: 14,
                                      height: 0,
                                      color: Constant.allreadyHaveAcountColor),
                                  children: [
                                    TextSpan(
                                      text: 'Log in',
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
                                                    const MealLoginScreen()),
                                            (route) => false,
                                          );
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // Transform.translate(
                          //   offset: Offset(0, 20),
                          //   child: Center(
                          //     child: Text(
                          //       'Already have an account?   Log in ',
                          //       style: theme.textTheme.bodyMedium!.copyWith(
                          //           fontFamily: 'SofiaSans',
                          //           fontSize: 14,
                          //           height: 0,
                          //           color: Constant.allreadyHaveAcountColor),
                          //     ),
                          //   ),
                          // ),
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
