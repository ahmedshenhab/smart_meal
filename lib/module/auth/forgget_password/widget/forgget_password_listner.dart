import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/core/style/app_color.dart';
import 'package:smart_meal/module/auth/login/cubit/cubit.dart';
import 'package:smart_meal/module/auth/login/cubit/states.dart';
import 'package:smart_meal/reusable.dart';

class ForggetPasswordListner extends StatelessWidget {
  const ForggetPasswordListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MealLoginCubit, MealLoginStates>(
      listenWhen:
          (previous, current) =>
             
              current is MealForggetPasswordSuccessState ||
              current is MealForggetPasswordErrorState,
      listener: (context, state) {
        switch (state) {
          
          case MealForggetPasswordSuccessState _:
          buildshowToast(msg: state.message??'', color: AppColor.green);
          Navigator.pop(context);
          

            
           
          case MealForggetPasswordErrorState _:
            buildshowToast(msg: state.error??'', color: AppColor.deepOrange);

          default:
            break;
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
