import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/generated/l10n.dart';
import 'package:smart_meal/module/meal_layout/cubit/cubit.dart';
import 'package:smart_meal/module/meal_layout/cubit/stataes.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/profile/data/model/avoidance_model.dart';

class Allergies extends StatelessWidget {
  const Allergies({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = MealLayoutCubit.get(context);
    return ExpansionTile(
      shape: const RoundedRectangleBorder(),

      title: Text(S.of(context).Allergies),
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final key = cubit.allergies.keys.elementAt(index);

            final allergyName = AvoidanceModel.getAvoidanceNameByKey(
              key,
              S.of(context),
            );

            return BlocBuilder<MealLayoutCubit, MealStates>(
              buildWhen:
                  (previous, current) =>
                      current is MealChangeAllergiesState &&
                      current.key == key,
              builder: (context, state) {
                final updatedChecked = cubit.allergies[key];

                return ListTile(
                  title: Text(allergyName),
                  trailing: Checkbox.adaptive(
                    value: updatedChecked,
                    onChanged: (value) {
                      cubit.toggleAllergy(key, value);
                      log(cubit.allergies.toString());
                    },
                  ),
                );
              },
            );
          },
          itemCount: cubit.allergies.length,
        ),
      ],
    );
  }
}
