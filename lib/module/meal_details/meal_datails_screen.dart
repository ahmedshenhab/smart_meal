import 'package:flutter/material.dart';
import 'package:smart_meal/module/meal_details/widget/sliver_appbar_image.dart';
import 'package:smart_meal/module/meal_details/widget/slivier_to_box_adapter_body.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key});
  static const mealDetailsScreen = '/meal_details_screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [SliverAppbarImage(), SliverToBoxAdapterBody()],
      ),
    );
  }
}
