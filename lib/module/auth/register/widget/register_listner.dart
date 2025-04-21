import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/core/style/app_color.dart';
import 'package:smart_meal/module/auth/register/cubit/cubit.dart';
import 'package:smart_meal/module/auth/register/cubit/states.dart';

class RegisterListner extends StatelessWidget {
  const RegisterListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MealRegisterCubit, MealRegisterStates>(
      listener: (context, state) {
        switch (state) {
          case MealRegisterLoadingState _:
            showDialog(
              context: context,
              barrierDismissible: false,
              builder:
                  (context) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.deepOrange,
                      backgroundColor: AppColor.deepOrange,
                    ),
                  ),
            );

          case MealRegisterSuccessState():
            final rootNavigator = Navigator.of(context, rootNavigator: true);
            if (rootNavigator.canPop()) {
              rootNavigator.pop();
            }
            // if (state.==null){}

            showDialog(
              context: context,
              builder:
                  (context) => AlertDialog(
                    title: const Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                    ),
                    content: Text(
                      'Account created successfully, go to login ',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(fontSize: 14),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'OK,',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
            );

            log('success');

          case MealRegisterErrorState():
            final rootNavigator = Navigator.of(context, rootNavigator: true);
            if (rootNavigator.canPop()) {
              rootNavigator.pop();
            }

            showDialog(
              context: context,
              builder:
                  (context) => AlertDialog(
                    title: const Icon(Icons.error, color: Colors.red),
                    content: Text(
                      state.error!,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(fontSize: 14),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'OK',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
            );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
