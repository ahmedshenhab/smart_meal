//

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/ui/style/app_color.dart';
import 'package:smart_meal/module/meal_details/widget/ingreadiant_instruction_section.dart';
import 'package:smart_meal/module/meal_details/widget/properities_section.dart';

class SliverToBoxAdapterBody extends StatelessWidget {
  const SliverToBoxAdapterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: AppColor.white,

        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and Sun icon

            // Properties section grid
            const DetailsSection(),

            SizedBox(height: 15.h),

            // Ingrediants_instructions_section
            const IngreadiantInstructionSection(),
          ],
        ),
      ),
    );
  }
}
