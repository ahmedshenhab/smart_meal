import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/generated/l10n.dart';
import '../../../core/ui/style/app_color.dart';
import '../login/meal_login_screen.dart';
import 'cubit/cubit.dart';
import 'widget/register_form.dart';

class MealRegisterScreen extends StatelessWidget {
  const MealRegisterScreen({super.key});

  static const String registerScreen = '/registerScreen';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundheavy,
      body: SafeArea(
        child: Column(
          children: [
            // Logo Section
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/logo_app.png',

                  width: 120.w,
                  height: 100.h,
                ),
                // TextButton(
                //   style: TextButton.styleFrom(
                //     padding: EdgeInsets.zero,
                //     overlayColor: Colors.transparent,
                //   ),
                //   onPressed: () {},
                //   child: Text(
                //     'Later',
                //     style: theme.textTheme.bodyMedium!.copyWith(
                //       fontSize: 17.sp,
                //       fontFamily: 'SofiaSans',
                //       color: AppColor.logInLaterColor,
                //     ),
                //   ),
                // ),
              ],
            ),

            // Login Card Section
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 12.w, right: 12.w),
                padding: EdgeInsets.only(top: 15.h),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45.r),
                    topRight: Radius.circular(45.r),
                    // bottomLeft: Radius.circular(45.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                      S.of(context).createAccount,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontFamily: 'Poppins',
                          fontSize: 24.sp,
                        ),
                      ),
                      SizedBox(height: mediaQuery.size.height * 0.06),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     CustomOutlinedButton(
                      //       onPressed: () {},
                      //       icon: SvgPicture.asset(
                      //         width: 25.w,
                      //         'assets/images/google_icon.svg',
                      //       ),

                      //       label: 'Sign up with Facebook',
                      //     ),
                      //     CustomOutlinedButton(
                      //       onPressed: () {},

                      //       icon: Icon(
                      //         Icons.facebook_outlined,
                      //         color: AppColor.blue,
                      //         size: 25.w,
                      //       ),

                      //       label: 'Sign up with Facebook',
                      //     ),
                      //   ],
                      // ),

                      // SizedBox(height: mediaQuery.size.height * 0.03),
                      // Text(
                      //   '-OR-',
                      //   style: theme.textTheme.bodyMedium!.copyWith(
                      //     fontSize: 18.sp,
                      //     fontFamily: 'Poppins',
                      //     color: AppColor.fieldColorHint,
                      //   ),
                      // ),

                      //register form
                      const RegisterForm(),
                      SizedBox(height: mediaQuery.size.height * 0.02),

                      // register Button
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<MealRegisterCubit>(
                            context,
                          ).checkValidate();
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(mediaQuery.size.width * 0.86, 48.h),
                          backgroundColor: AppColor.deepOrange,
                          padding: const EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        child: Text(
                          S.of(context).createAccount,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            fontFamily: 'SofiaSans',
                            fontSize: 20.sp,
                            color: AppColor.white,
                          ),
                        ),
                      ),

                      SizedBox(height: mediaQuery.size.height * 0.035),

                      RichText(
                        text: TextSpan(
                          text: S.of(context).haveAccount,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            fontFamily: 'SofiaSans',
                            fontSize: 14.sp,
                            // height: 0,
                            color: AppColor.allreadyHaveAcountColor,
                          ),
                          children: [
                            TextSpan(
                              text: S.of(context).LogIn,
                              style: theme.textTheme.bodyMedium!.copyWith(
                                decoration: TextDecoration.underline,
                                decorationThickness: 0.7.w,
                                fontFamily: 'SofiaSans',
                                fontSize: 18.sp,
                                // height: 0,
                                color: AppColor.allreadyHaveAcountColor,
                              ),
                              recognizer:
                                  TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(
                                        context,
                                      ).pushReplacementNamed(
                                        MealLoginScreen.loginScreen,
                                      );
                                    },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
