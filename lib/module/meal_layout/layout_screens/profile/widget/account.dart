import 'package:flutter/material.dart';
import 'package:smart_meal/generated/l10n.dart';
import 'package:smart_meal/module/meal_layout/cubit/cubit.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/profile.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = MealLayoutCubit.get(context); 
    return ExpansionTile(
      shape: const RoundedRectangleBorder(),

      title: Text(S.of(context).account),
      children: [
        Text(S.of(context).fullName),
        buildTextField(cubit.nameController),
        Text(S.of(context).email),
        buildTextField(  cubit.emailController),
      ],
    );
  }
}
