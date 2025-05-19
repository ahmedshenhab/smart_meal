import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/ui/style/app_color.dart';
import '../cubit/meal_detail_cubit.dart';
import '../cubit/meal_detail_state.dart';
import '../../../reusable.dart';

class IngrediantBody extends StatelessWidget {
  const IngrediantBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = MealDetailCubit.get(context);
    return Column(
      children: [
        SizedBox(height: 10.h),

        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(
        //             'Ingredients',
        //             style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        //               fontWeight: FontWeight.w700,
        //               fontSize: 15.sp,
        //               fontFamily: 'SofiaSans',
        //             ),
        //           ),
        //           Text(
        //             '${MealDetailCubit.get(context).mealsModel.ingredients?.length ?? '0'}items',
        //             style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        //               color: AppColor.gray.withValues(alpha: 0.9),
        //               fontSize: 13.sp,
        //               fontFamily: 'SofiaSans',
        //               fontWeight: FontWeight.bold,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        // SizedBox(height: 8.h),
        BlocBuilder<MealDetailCubit, MealDetailStatess>(
          buildWhen:
              (previous, current) =>
                  current is MealDetailQuanttyUpdateState ||
                  current is MealDetailToggleIngredientCartState,
          builder: (context, state) {
            return ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(height: 15.h),

              padding: const EdgeInsets.all(0),

              physics: const NeverScrollableScrollPhysics(),
              itemCount:
                  MealDetailCubit.get(context).mealsModel.ingredients?.length ??
                  0,

              itemBuilder:
                  (context, index) => Align(
                    child: GestureDetector(
                      onTap: () {
                        MealDetailCubit.get(
                          context,
                        ).toggleIngredientSelection(index);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 238,
                        height: 50.h,

                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha: 0.25),
                              offset: const Offset(0.0, 2),
                              blurRadius: 16,
                            ),
                          ],
                          color:
                              MealDetailCubit.get(
                                    context,
                                  ).selectedIngredientIndexes.contains(index)
                                  ? AppColor.deepOrange
                                  : AppColor.white,
                          borderRadius: BorderRadius.circular(16.r),
                        ),

                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,

                          '${(cubit.mealsModel.ingredients?[index].amount ?? 0) * cubit.servingCount}g ${cubit.mealsModel.ingredients?[index].ingredientName ?? ''}',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(
                            fontSize: 18.sp,
                            fontFamily: 'SofiaSans',
                            fontWeight: FontWeight.w900,
                            color:
                                MealDetailCubit.get(
                                      context,
                                    ).selectedIngredientIndexes.contains(index)
                                    ? AppColor.white
                                    : AppColor.gray,
                          ),
                        ),
                      ),
                    ),
                  ),
            );
          },
        ),

        SizedBox(height: 25.h),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: SizedBox(
            width: double.infinity,
            height: 52.h,
            child: CustomElevatedButton(
              text: 'Add to Cart',
              onPressed: () async {
                await MealDetailCubit.get(context).addToCart();
              },
            ),
          ),
        ),
      ],
    );
  }
}
