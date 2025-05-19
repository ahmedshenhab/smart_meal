import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      backgroundColor: AppColor.scaffoldBackgroundheavy,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/logo_app.png',

                  width: 120.w,
                  height: 100.h,
                ),
              ],
            ),

            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 12.w, right: 12.w),
                padding: EdgeInsets.only(top: 15.h),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45.r),
                    topRight: Radius.circular(45.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: mediaQuery.size.height * 0.06),

                      const ForggetPasswordForm(),
                      SizedBox(height: mediaQuery.size.height * 0.06),

                      BlocBuilder<MealLoginCubit, MealLoginStates>(
                        buildWhen:
                            (previous, current) =>
                                current is MealForggetPasswordLoadingState ||
                                current is MealForggetPasswordSuccessState ||
                                current is MealForggetPasswordErrorState,
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed:
                                state is! MealForggetPasswordLoadingState
                                    ? () {
                                      MealLoginCubit.get(
                                        context,
                                      ).forggtePassword();
                                    }
                                    : null,
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(
                                mediaQuery.size.width * 0.86,
                                48.h,
                              ),

                              disabledBackgroundColor: AppColor.gray,
                              disabledForegroundColor: AppColor.gray,
                              backgroundColor: AppColor.deepOrange,
                              padding: const EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                            ),
                            child: Text(
                              S.of(context).change,
                              style: theme.textTheme.bodyMedium!.copyWith(
                                fontFamily: 'SofiaSans',
                                fontSize: 20.sp,
                                color: AppColor.white,
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
