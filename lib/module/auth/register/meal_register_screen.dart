import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/extention/extention.dart';
import 'package:smart_meal/core/widgets/custom_outlined_button.dart';
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
      backgroundColor:
          context.isDark
              ? AppColor.scaffolddark
              : AppColor.scaffoldBackgroundheavy,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Image.asset(
                'assets/images/logo_app.png',

                width: 120.w,
                height: 100.h,
              ),
            ),

            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 12.w, right: 12.w),
                padding: EdgeInsets.only(top: 15.h),
                decoration: BoxDecoration(
                  color: context.isDark ? AppColor.black : AppColor.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45.r),
                    topRight: Radius.circular(45.r),
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
                          color:
                              context.isDark ? AppColor.white : AppColor.black,
                        ),
                      ),
                      SizedBox(height: mediaQuery.size.height * 0.06),

                      const RegisterForm(),
                      SizedBox(height: 105.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: CustomElevatedButton(
                          raduis: 16.r,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          fixedwidth: double.infinity,
                          child: Text(
                            S.of(context).createAccount,
                            style: theme.textTheme.bodyMedium!.copyWith(
                              fontFamily: 'SofiaSans',
                              fontSize: 20.sp,
                              color:
                                  context.isDark
                                      ? AppColor.black
                                      : AppColor.white,
                            ),
                          ),
                          onPressed: () {
                            BlocProvider.of<MealRegisterCubit>(
                              context,
                            ).checkValidate();
                          },
                        ),
                      ),

                      SizedBox(height: mediaQuery.size.height * 0.035),

                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: S.of(context).haveAccount,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            fontFamily: 'SofiaSans',
                            fontSize: 14.sp,

                            color:
                                context.isDark
                                    ? AppColor.grayTone
                                    : AppColor.gray,
                          ),
                          children: [
                            TextSpan(
                              text: ' ${S.of(context).login}',
                              style: theme.textTheme.bodyMedium!.copyWith(
                                decoration: TextDecoration.underline,
                                decorationThickness: 0.7.w,
                                fontFamily: 'SofiaSans',
                                fontSize: 18.sp,

                                color:
                                    context.isDark
                                        ? AppColor.grayTone
                                        : AppColor.gray,
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
