import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/core/style/app_color.dart';
import 'package:smart_meal/module/meal_layout/cubit/cubit.dart';
import 'package:smart_meal/module/meal_layout/cubit/stataes.dart';
import 'package:smart_meal/reusable.dart';

class BlocListnerSave extends StatelessWidget {
  const BlocListnerSave({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MealLayoutCubit, MealStates>(
      child: const SizedBox.shrink(),
      listener: (context, state) {
        if (state is MealDeleteFavoriteByIdLoadingState) {
          showDialog(
            // barrierDismissible: true,
            context: context,
            builder: (context) {
              return const Center(
                child: CircularProgressIndicator(color: AppColor.deepOrange),
              );
            },
          );
        }
        if (state is MealDeleteFavoriteByIdSuccessState) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
            
          }


          
          buildshowToast(msg: 'deleted successfully', color: AppColor.green);
        }
        if (state is MealDeleteFavoriteByIdErrorState) {
           if (Navigator.canPop(context)) {
            Navigator.pop(context);
            
          }
          

          buildshowToast(
            msg:
                'fail remove favorite item please check internet connection or try later',
            color: AppColor.deepOrange,
          );
        }
      },
    );
  }
}
