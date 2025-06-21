import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/extention/extention.dart';
import 'package:smart_meal/core/widgets/custom_outlined_button.dart';
import 'package:smart_meal/generated/l10n.dart';
import '../../../core/ui/style/app_color.dart';
import 'cubit/cubit.dart';
import 'widget/login_form.dart';
import '../register/meal_register_screen.dart';

class MealLoginScreen extends StatelessWidget {
  const MealLoginScreen({super.key});

  static const String loginScreen = '/loginScreen';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                margin: EdgeInsetsDirectional.symmetric(horizontal: 12.w),

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
                        S.of(context).loginWithHeader,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontFamily: 'Poppins',
                          fontSize: 24.sp,

                          color:
                              context.isDark ? AppColor.white : AppColor.black,
                        ),
                      ),

                      SizedBox(height: 50.h),

                      const LoginForm(),
                      SizedBox(height: 58.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: CustomElevatedButton(
                          raduis: 16.r,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          fixedwidth: double.infinity,
                          child: Text(
                            S.of(context).LogIn,
                            style: theme.textTheme.bodyMedium!.copyWith(
                              fontFamily: 'Poppins',
                              fontSize: 18.sp,
                              color:
                                  context.isDark
                                      ? AppColor.black
                                      : AppColor.white,
                            ),
                          ),
                          onPressed: () {
                            BlocProvider.of<MealLoginCubit>(
                              context,
                            ).checkValidate();
                          },
                        ),
                      ),
                      SizedBox(height: 20.h),

                      RichText(
                        text: TextSpan(
                          text: S.of(context).dontHaveAnccount,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            fontFamily: 'SofiaSans',
                            fontSize: 14.sp,
                            // height: 0,
                            color:
                                context.isDark
                                    ? AppColor.grayTone
                                    : AppColor.gray,
                          ),
                          children: [
                            TextSpan(
                              text: S.of(context).Register,
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
                                        MealRegisterScreen.registerScreen,
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
