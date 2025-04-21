import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/style/app_color.dart';
import 'package:smart_meal/module/auth/register/cubit/cubit.dart';
import 'package:smart_meal/module/auth/register/widget/register_listner.dart';
import 'package:smart_meal/reusable.dart';

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
              labelText: 'full name',

              validator: (value) {
                // Enhanced validation
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              type: TextInputType.name,
            ),
            SizedBox(height: mediaQuery.size.height * 0.02),

            buildLoginField(
              context,
              controller: cubit.emailController,
              labelText: 'Email Address',

              validator: (value) {
                // Enhanced validation
                if (value!.isEmpty) {
                  return 'Please enter your email';
                } else if (!RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                ).hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              type: TextInputType.name,
            ),
            SizedBox(height: mediaQuery.size.height * 0.02),

            // password
            buildLoginField(
              labelText: 'Password',
              context,
              controller: cubit.passwordController,
              validator: (value) {
                if (value!.isEmpty || value.length < 6) {
                  return 'at least 6 character';
                } else if (!RegExp(
                  r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
                ).hasMatch(value)) {
                  return 'Passwords must have at least one non alphanumeric character, one uppercase, one number';
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

            TextButton(
              style: Theme.of(context).textButtonTheme.style!.copyWith(
                padding: WidgetStateProperty.all(EdgeInsets.zero),
                alignment: Alignment.center,
                minimumSize: WidgetStateProperty.all(Size.zero),

                // shadowColor: WidgetStateProperty.all(Colors.transparent),
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                backgroundColor: WidgetStateProperty.all(Colors.transparent),
              ),
              onPressed: () {},

              child: Text(
                'forget password?',
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

            const RegisterListner(),
          ],
        ),
      ),
    );
  }
}
