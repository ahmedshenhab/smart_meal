import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_meal/generated/l10n.dart';
import '../../../core/ui/style/app_color.dart';
import '../cubit/cubit.dart';
import '../cubit/stataes.dart';
import '../../../reusable.dart';

class MealLayoutScreen extends StatefulWidget {
  const MealLayoutScreen({super.key});
  static const String homeScreen = '/homeScreen';

  @override
  State<MealLayoutScreen> createState() => _MealLayoutScreenState();
}

class _MealLayoutScreenState extends State<MealLayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MealLayoutCubit, MealStates>(
      listenWhen:
          (previous, current) =>
              current is MealChangeFavoriteSuccessState ||
              current is MealChangeFavoriteErrorState,

      listener: (context, state) {
        switch (state) {
          case MealChangeFavoriteSuccessState _:
            Fluttertoast.cancel();

            buildshowToast(msg: state.message, color: AppColor.green);

          case MealChangeFavoriteErrorState _:
            Fluttertoast.cancel();

            buildshowToast(msg: state.message, color: AppColor.deepOrange);

          default:
        }
      },
      buildWhen: (previous, current) => current is MealChangeBottomNavState,
      builder: (context, state) {
        final cubit = MealLayoutCubit.get(context);

        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: IndexedStack(
            index: cubit.currentIndex,
            children: cubit.screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) => cubit.changeBottomNavIndex(index), // ✅ FIXED
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: S.of(context).home,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.search),
                label: S.of(context).search,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: S.of(context).profile,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.bookmark),
                label: S.of(context).save,
              ),
            ],
            type: BottomNavigationBarType.fixed,
          ),
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../cubit/cubit.dart';
// import '../cubit/stataes.dart';

// class MealLayoutScreen extends StatelessWidget {
//   const MealLayoutScreen({super.key});
//   static const String homeScreen = '/homeScreen';

//   // @override
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MealLayoutCubit, MealStates>(
//       buildWhen: (previous, current) => current is MealChangeBottomNavState,
//       builder: (context, state) {
//         final cubit = MealLayoutCubit.get(context);

//         return Scaffold(
//           resizeToAvoidBottomInset: true,
//           body: SafeArea(child: cubit.screens[cubit.currentIndex]),
//           bottomNavigationBar: BottomNavigationBar(
//             onTap: (index) {
//               cubit.changeBottomNavIndex(index);
//             },
//             currentIndex: cubit.currentIndex,
//             items: cubit.items,
//             type: BottomNavigationBarType.fixed,
//           ),
//         );
//       },
//     );

//   }
// }
