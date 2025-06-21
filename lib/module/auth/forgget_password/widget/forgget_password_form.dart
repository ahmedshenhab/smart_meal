import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/generated/l10n.dart';
import 'package:smart_meal/module/auth/constantauth.dart';
import 'package:smart_meal/module/auth/forgget_password/widget/forgget_password_listner.dart';
import 'package:smart_meal/module/auth/login/cubit/cubit.dart';
import '../../../../core/ui/style/app_color.dart';

import '../../../../reusable.dart';

class ForggetPasswordForm extends StatefulWidget {
  const ForggetPasswordForm({super.key});

  @override
  State<ForggetPasswordForm> createState() => _ForggetPasswordFormState();
}

class _ForggetPasswordFormState extends State<ForggetPasswordForm> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final cubit = BlocProvider.of<MealLoginCubit>(context);

    return Form(
      autovalidateMode: AutovalidateMode.disabled,
      key: cubit.formStateForggetePassword,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
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
              labelText: S.of(context).newPassword,
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
            const ForggetPasswordListner(),
          ],
        ),
      ),
    );
  }
}
