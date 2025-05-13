import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/generated/l10n.dart';
import '../../../../core/style/app_color.dart';
import '../cubit/cubit.dart';
import 'register_listner.dart';
import '../../../../reusable.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    // log('hi');
    final mediaQuery = MediaQuery.of(context);
    final cubit = MealRegisterCubit.get(context);
    return Form(
      autovalidateMode: AutovalidateMode.disabled,
      key: cubit.formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildLoginField(
              context,
              controller: cubit.nameController,
              labelText: S.of(context).fullName,

              validator: (value) {
                // Enhanced validation
                if (value!.isEmpty) {
                  return S.of(context).validateName;
                }
                return null;
              },
              type: TextInputType.name,
            ),
            SizedBox(height: mediaQuery.size.height * 0.02),

            buildLoginField(
              context,
              controller: cubit.emailController,
              labelText: S.of(context).emailAddress,

              validator: (value) {
                // Enhanced validation
                if (value!.isEmpty) {
                  return S.of(context).validate1tionEmail;
                } else if (!RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                ).hasMatch(value)) {
                  return S.of(context).validate2tionEmail;
                }
                return null;
              },
              type: TextInputType.name,
            ),
            SizedBox(height: mediaQuery.size.height * 0.02),

            // password
            buildLoginField(
              labelText: S.of(context).Password,
              context,
              controller: cubit.passwordController,
              validator: (value) {
                if (value!.isEmpty || value.length < 6) {
                  return S.of(context).validationPassword;
                } else if (!RegExp(
                  r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
                ).hasMatch(value)) {
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
                  cubit.isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  size: 20.w,
                  color: AppColor.gray,
                ),
              ),
            ),

            SizedBox(height: mediaQuery.size.height * 0.02),

           

            const RegisterListner(),
          ],
        ),
      ),
    );
  }
}
