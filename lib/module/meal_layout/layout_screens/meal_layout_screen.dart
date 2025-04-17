import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/core/style/app_color.dart';
import '../cubit/cubit.dart';
import '../cubit/stataes.dart';

class MealLayoutScreen extends StatelessWidget {
  const MealLayoutScreen({super.key});
  static const String homeScreen = '/homeScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealCubit(),
      child: BlocConsumer<MealCubit, MealStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = MealCubit.get(context);

          return Scaffold(
            // appBar: AppBar(
            //   backgroundColor: const Color(0xFFFBE9DD),
            //   elevation: 0,
            //   leading: const Icon(
            //     Icons.arrow_back_ios_new,
            //     color: Colors.black,
            //   ),
            //   actions: const [
            //     Icon(Icons.shopping_cart_outlined, color: Colors.black),
            //     SizedBox(width: 16),
            //   ],
            // ),
            backgroundColor: AppColor.scaffoldBackgroundLight,
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
