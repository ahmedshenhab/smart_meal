import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/generated/l10n.dart';
import 'package:smart_meal/module/meal_layout/cubit/cubit.dart';
import 'package:smart_meal/module/meal_layout/cubit/stataes.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/profile/data/model/avoidance_model.dart';

class Disease extends StatelessWidget {
  const Disease({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = MealLayoutCubit.get(context);
    return ExpansionTile(
      shape: const RoundedRectangleBorder(),

      title: Text(S.of(context).Diseases),
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final key = cubit.diseases.keys.elementAt(index);

            final diseaseName = AvoidanceModel.getAvoidanceNameByKey(
              key,
              S.of(context),
            );

            return BlocBuilder<MealLayoutCubit, MealStates>(
              buildWhen:
                  (previous, current) =>
                      current is MealChangeDiseasesState && current.key == key,
              builder: (context, state) {
                final updatedChecked = cubit.diseases[key];

                return ListTile(
                  title: Text(diseaseName),
                  trailing: Checkbox.adaptive(
                    value: updatedChecked,
                    onChanged: (value) {
                      cubit.toggleDisease(key, value);
                    },
                  ),
                );
              },
            );
          },
          itemCount: cubit.diseases.length,
        ),
      ],
    );
  }
}
