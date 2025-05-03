import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/module/meal_details/cubit/meal_detail_cubit.dart';
import 'package:smart_meal/module/meal_details/widget/item_instruction.dart';

class InstructionBody extends StatelessWidget {
  const InstructionBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> instructions =
        MealDetailCubit.get(context).mealsModel.preparationMethod
            ?.split(',')
            .map((e) => e.trim()) // remove any extra spaces
            .where((e) => e.isNotEmpty) // remove empty parts
            .toList() ??
        [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Text(
            'Instructions:',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              fontFamily: 'SofiaSans',
              fontSize: 20.sp,
            ),
          ),
        ),
        SizedBox(height: 25.h),
        ListView.builder(
          padding: const EdgeInsets.all(0),
          itemCount: instructions.length,
          itemBuilder:
              (context, index) => InstructionItem(
                number: index + 1,
                // title: 'Prepare the Fries:',
                description: instructions[index],
              ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }
}
