import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/module/meal_details/widget/item_instruction.dart';

class InstructionBody extends StatelessWidget {
  const InstructionBody({super.key});

  @override
  Widget build(BuildContext context) {
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
          itemCount: 4,
          itemBuilder:
              (context, index) => InstructionItem(
                number: index + 1,
                title: 'Prepare the Fries:',
                description:
                    'Preheat the oven to 200°C (400°F). Toss the potato fries in 1 tablespoon of olive oil, and spread them on a baking sheet. Bake for 20–25 minutes, or until golden and crispy, turning halfway through.',
              ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }
}
