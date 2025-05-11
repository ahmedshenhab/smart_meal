import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/style/app_color.dart';
import 'cubit/meal_detail_cubit.dart';
import 'cubit/meal_detail_state.dart';
import 'widget/sliver_appbar_image.dart';
import 'widget/slivier_to_box_adapter_body.dart';
import '../../reusable.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key});
  static const mealDetailsScreen = '/meal_details_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<MealDetailCubit, MealDetailStatess>(
        listener: (context, state) {
          if (state is MealDetailAddSuccessToCartState) {
            buildshowToast(msg: 'added to cart', color: AppColor.green);
          }
        },
        child: const CustomScrollView(
          slivers: [SliverAppbarImage(), SliverToBoxAdapterBody()],
        ),
      ),
    );
  }
}
