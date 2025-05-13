import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/generated/l10n.dart';
import '../../../../core/style/app_color.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
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
              SizedBox(height: mediaQuery.size.height * 0.03),

              // password
              buildLoginField(
                labelText: S.of(context).Password,
                context,
                controller: cubit.passwordController,
                validator: (value) {
                  if (value!.isEmpty || value.length < 6) {
                    return S.of(context).Password;
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
      ),
    );
  }
}
