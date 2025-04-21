import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/style/app_color.dart';
import 'package:smart_meal/module/auth/login/cubit/cubit.dart';
import 'package:smart_meal/module/auth/login/cubit/states.dart';
import 'package:smart_meal/module/auth/login/widget/login_listner.dart';
import 'package:smart_meal/reusable.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    // log('hi');
    final mediaQuery = MediaQuery.of(context);
    final cubit = MealLoginCubit.get(context);
    return BlocListener<MealLoginCubit, MealLoginStates>(
      listener: (context, state) {},

      child: Form(
        autovalidateMode: AutovalidateMode.disabled,
        key: cubit.formState,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              SizedBox(height: mediaQuery.size.height * 0.03),

              // password
              buildLoginField(
                labelText: 'Password',
                context,
                controller: cubit.passwordController,
                validator: (value) {
                  if (value!.isEmpty || value.length < 6) {
                    return 'at least 6 character';
                  }
                  // else if (!RegExp(
                  //   r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
                  // ).hasMatch(value)) {
                  //   return 'Passwords must have at least one non alphanumeric character, one uppercase, one number';
                  // }
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
              const LoginListner(),
            ],
          ),
        ),
      ),
    );
  }
}
