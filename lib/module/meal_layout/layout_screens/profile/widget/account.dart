import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

      title: Text(
        S.of(context).account,
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
      children: [
        Text(
          S.of(context).fullName,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        buildTextField(context: context, cubit.nameController),
        Text(
          S.of(context).email,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        buildTextField(context: context, cubit.emailController),
      ],
    );
  }
}
