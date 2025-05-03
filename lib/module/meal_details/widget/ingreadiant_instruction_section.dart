import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/style/app_color.dart';
import 'package:smart_meal/module/meal_details/cubit/meal_detail_cubit.dart';
import 'package:smart_meal/module/meal_details/cubit/meal_detail_state.dart';
import 'package:smart_meal/module/meal_details/widget/ingrediant_body.dart';
import 'package:smart_meal/module/meal_details/widget/instruction_body.dart';

class IngreadiantInstructionSection extends StatelessWidget {
  const IngreadiantInstructionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealDetailCubit, MealDetailStates>(
      builder: (context, state) {
        final cubit = MealDetailCubit.get(context);

        return Column(
          children: [
            // Toggle buttons
            Container(
              width: 310.w,
              height: 50.h,
              margin: EdgeInsets.symmetric(horizontal: 17.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.r),
                color: AppColor.scaffoldBackgroundheavy.withValues(alpha: 0.8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:
                    cubit.mealCategory.map((e) {
                      return InkWell(
                        onTap: () => cubit.changeCategory(e),
                        child: AnimatedContainer(
                          width: 130.w,
                          duration: const Duration(milliseconds: 200),
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          decoration: BoxDecoration(
                            color:
                                state.selectedCategory == e
                                    ? AppColor.deepOrange
                                    : Colors.transparent,
                            borderRadius: BorderRadius.circular(18.r),
                          ),
                          child: Text(
                            e,
                            textAlign: TextAlign.center,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              color:
                                  state.selectedCategory == e
                                      ? AppColor.white
                                      : AppColor.black,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),

            SizedBox(height: 20.h),

            state.selectedCategory == 'ingredients'
                ? const IngrediantBody()
                : const InstructionBody(),
          ],
        );
      },
    );
  }
}
