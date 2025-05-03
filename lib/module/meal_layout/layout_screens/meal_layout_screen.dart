import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cubit.dart';
import '../cubit/stataes.dart';

class MealLayoutScreen extends StatefulWidget {
  const MealLayoutScreen({super.key});
  static const String homeScreen = '/homeScreen';

  @override
  State<MealLayoutScreen> createState() => _MealLayoutScreenState();
}

class _MealLayoutScreenState extends State<MealLayoutScreen> {

  @override
  void initState() {

    MealLayoutCubit.get(context).getAllMeal();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealLayoutCubit, MealStates>(
      buildWhen: (previous, current) => current is MealChangeBottomNavState,
      builder: (context, state) {
        final cubit = MealLayoutCubit.get(context);

        return Scaffold(
          resizeToAvoidBottomInset: true,
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
    );
  }
}
