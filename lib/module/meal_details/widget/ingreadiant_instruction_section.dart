import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/generated/l10n.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/search/search.dart';
import '../../../core/ui/style/app_color.dart';
import '../cubit/meal_detail_cubit.dart';
import '../cubit/meal_detail_state.dart';
import 'ingrediant_body.dart';
import 'instruction_body.dart';

class IngreadiantInstructionSection extends StatelessWidget {
  const IngreadiantInstructionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ingriantInstruction = [
      MealKeyValue(key: 'ingredients', label: S.of(context).ingredients),
      MealKeyValue(key: 'instructions', label: S.of(context).instructions),
    ];

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
                ingriantInstruction.map((e) {
                  return InkWell(
                    onTap:
                        () =>
                            MealDetailCubit.get(context).changeCategory(e.key),
                    child: BlocBuilder<MealDetailCubit, MealDetailStatess>(
                      buildWhen:
                          (previous, current) =>
                              current is MealDetailTitleButtonChangeState,
                      builder: (context, state) {
                        return AnimatedContainer(
                          width: 130.w,
                          duration: const Duration(milliseconds: 200),
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          decoration: BoxDecoration(
                            color:
                                MealDetailCubit.get(context).selectedCategory ==
                                        e.key
                                    ? AppColor.deepOrange
                                    : Colors.transparent,
                            borderRadius: BorderRadius.circular(18.r),
                          ),
                          child: Text(
                            e.label,
                            textAlign: TextAlign.center,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              color:
                                  MealDetailCubit.get(
                                            context,
                                          ).selectedCategory ==
                                          e.key
                                      ? AppColor.white
                                      : AppColor.black,
                              fontSize: 16.sp,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),
          ),
        ),

        SizedBox(height: 20.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).serving,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 18.sp,
                color: AppColor.black,
              ),
            ),
            SizedBox(width: 20.w),

            SizedBox(
              width: 70.w,
              height: 30.h,

              child: TextField(
                onChanged: (value) {
                  BlocProvider.of<MealDetailCubit>(context).updateQuantity();
                },
                keyboardType: TextInputType.number,
                controller: MealDetailCubit.get(context).servingController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w),

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.deepOrange,
                      width: 1.4.w,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.deepOrange,
                      width: 2.w,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.w),

            // InkWell(
            //   onTap: () {
            //     MealDetailCubit.get(context).updateQuantity();
            //   },
            //   child: Text(
            //     S.of(context).update,
            //     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            //       fontSize: 18.sp,
            //       color: AppColor.deepOrange,
            //       fontWeight: FontWeight.w600,
            //     ),
            //   ),
            // ),
          ],
        ),
        SizedBox(height: 10.h),

        BlocBuilder<MealDetailCubit, MealDetailStatess>(
          buildWhen:
              (previous, current) =>
                  current is MealDetailTitleButtonChangeState,
          builder:
              (context, state) =>
                  MealDetailCubit.get(context).selectedCategory == 'ingredients'
                      ? const IngrediantBody()
                      : const InstructionBody(),
        ),
      ],
    );
  }
}
