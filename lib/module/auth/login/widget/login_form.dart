import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/generated/l10n.dart';
import 'package:smart_meal/module/auth/constantauth.dart';
import 'package:smart_meal/module/auth/forgget_password/meal_forgget_password.dart';
import '../../../../core/ui/style/app_color.dart';
import '../cubit/cubit.dart';
import 'login_listner.dart';
import '../../../../reusable.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final cubit = MealLoginCubit.get(context);

    return Form(
      autovalidateMode: AutovalidateMode.disabled,
      key: cubit.formState,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCustomField(
              context,
              controller: cubit.emailController,
              labelText: S.of(context).emailAddress,

              validator: (value) {
                // Enhanced validation
                if (value!.isEmpty) {
                  return S.of(context).validate1tionEmail;
                } else if (!Constantauth.isvalidEmail.hasMatch(value)) {
                  return S.of(context).validate2tionEmail;
                }
                return null;
              },
              type: TextInputType.name,
            ),
            SizedBox(height: mediaQuery.size.height * 0.03),

            // password
            buildCustomField(
              labelText: S.of(context).Password,
              context,
              controller: cubit.passwordController,
              validator: (value) {
                if (value!.isEmpty || value.length < 6) {
                  return S.of(context).validationPassword;
                } else if (!Constantauth.isvalidPassword.hasMatch(value)) {
                  return S.of(context).validation2Password;
                }
                return null;
              },
              isHiddenPassword: isPasswordVisible,
              type: TextInputType.visiblePassword,
              sufixIconBotton: InkWell(
                onTap: () {
                  isPasswordVisible = !isPasswordVisible;
                  setState(() {});
                },
                child: Icon(
                  isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                  size: 20.w,
                  color: AppColor.gray,
                ),
              ),
            ),

            SizedBox(height: mediaQuery.size.height * 0.02),

            TextButton(
              style: Theme.of(context).textButtonTheme.style!.copyWith(
                padding: WidgetStateProperty.all(EdgeInsets.zero),
                alignment: Alignment.center,
                minimumSize: WidgetStateProperty.all(Size.zero),

                // shadowColor: WidgetStateProperty.all(Colors.transparent),
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                backgroundColor: WidgetStateProperty.all(Colors.transparent),
              ),
              onPressed: () {
               cubit.clearform();

                Navigator.pushNamed(
                  context,
                  MealForggetPassword.mealForggetPassword,

                  arguments: cubit,
                ).then((_) {
                  cubit.clearform();
                });
              },

              child: Text(
                S.of(context).forgetPassword,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  decoration: TextDecoration.underline,
                  decorationThickness: 1.3.w,
                  decorationColor: AppColor.gray,

                  fontFamily: 'Poppins',
                  fontSize: 13.8.sp,
                  fontWeight: FontWeight.w100,
                  color: AppColor.fieldColorHint,
                ),
              ),
            ),
            const LoginListner(),
          ],
        ),
      ),
    );
  }
}
