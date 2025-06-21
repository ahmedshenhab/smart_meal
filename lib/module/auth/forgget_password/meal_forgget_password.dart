import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/extention/extention.dart';
import 'package:smart_meal/core/widgets/custom_outlined_button.dart';
import 'package:smart_meal/generated/l10n.dart';
import 'package:smart_meal/module/auth/forgget_password/widget/forgget_password_form.dart';
import 'package:smart_meal/module/auth/login/cubit/cubit.dart';
import 'package:smart_meal/module/auth/login/cubit/states.dart';
import '../../../core/ui/style/app_color.dart';

class MealForggetPassword extends StatelessWidget {
  const MealForggetPassword({super.key});

  static const String mealForggetPassword = '/mealForggetPassword';

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
                        S.of(context).forgetPassword,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontFamily: 'Poppins',
                          fontSize: 24.sp,

                          color:
                              context.isDark ? AppColor.white : AppColor.black,
                        ),
                      ),
                      SizedBox(height: 50.h),

                      const ForggetPasswordForm(),
                      SizedBox(height: mediaQuery.size.height * 0.06),

                      BlocBuilder<MealLoginCubit, MealLoginStates>(
                        buildWhen:
                            (previous, current) =>
                                current is MealForggetPasswordLoadingState ||
                                current is MealForggetPasswordSuccessState ||
                                current is MealForggetPasswordErrorState,
                        builder: (context, state) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: CustomElevatedButton(
                              raduis: 16.r,
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              fixedwidth: double.infinity,
                              onPressed: () {
                                if (MealLoginCubit.get(context)
                                    .formStateForggetePassword
                                    .currentState!
                                    .validate()) {
                                  MealLoginCubit.get(context).forggtePassword();
                                }
                              },
                              child:
                                  state is MealForggetPasswordLoadingState
                                      ? const CircularProgressIndicator(
                                        color: AppColor.white,
                                      )
                                      : Text(
                                        S.of(context).change,
                                        style: theme.textTheme.bodyMedium!
                                            .copyWith(
                                              fontFamily: 'SofiaSans',
                                              fontSize: 20.sp,
                                              color:
                                                  context.isDark
                                                      ? AppColor.black
                                                      : AppColor.white,
                                            ),
                                      ),
                            ),
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
    );
  }
}
