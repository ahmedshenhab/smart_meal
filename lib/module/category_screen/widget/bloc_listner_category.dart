// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:smart_meal/core/style/app_color.dart';
// import 'package:smart_meal/module/meal_layout/cubit/cubit.dart';
// import 'package:smart_meal/module/meal_layout/cubit/stataes.dart';
// import 'package:smart_meal/reusable.dart';

// class BlocListnerSave extends StatelessWidget {
//   const BlocListnerSave({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<MealLayoutCubit, MealStates>(
//       child: const SizedBox.shrink(),
//       listener: (context, state) {
//         switch (state) {
//           case MealChangeFavoriteSuccessState _:
//             buildshowToast(msg: state.message, color: AppColor.green);

//           case MealChangeFavoriteErrorState _:
//             buildshowToast(msg: state.message, color: AppColor.deepOrange);

//           default:
//         }
//       },
//     );
//   }
// }
