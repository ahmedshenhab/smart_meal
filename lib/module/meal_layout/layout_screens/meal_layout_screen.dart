import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/core/style/meal_color.dart';
import '../cubit/cubit.dart';
import '../cubit/stataes.dart';

class MealLayoutScreen extends StatelessWidget {
  const MealLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealCubit(),
      child: BlocConsumer<MealCubit, MealStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = MealCubit.get(context);

          return Scaffold(
            backgroundColor: MealColor.scaffoldBackgroundLight,
            body: SafeArea(child: cubit.screens[cubit.currentIndex]),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubit.changeBottomNavIndex(index);
              },
              currentIndex: cubit.currentIndex,
              items: cubit.items,
              type: BottomNavigationBarType.fixed,
            ),
          );
        },
      ),
    );
  }
}
