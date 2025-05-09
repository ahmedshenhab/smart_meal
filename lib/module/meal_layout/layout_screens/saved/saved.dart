
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/style/app_color.dart';
import 'package:smart_meal/module/meal_details/meal_datails_screen.dart';
import 'package:smart_meal/module/meal_layout/cubit/cubit.dart';
import 'package:smart_meal/module/meal_layout/cubit/stataes.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/saved/widget/bloc_listner_save.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/saved/widget/custom_item_meal_saved.dart';

class Saved extends StatelessWidget {
  const Saved({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 30.h),
          InkWell(
            onTap: () {
              // Navigator.pushNamed(context, ShopingScreen.shopingScreen);
              MealLayoutCubit.get(context).getAllFavorite();
            },
            child: const Icon(
              Icons.shopping_cart_outlined,
              color: AppColor.deepOrange,
              size: 20,
            ),
          ),
          SizedBox(height: 1.h),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                color: AppColor.white,
              ),

              padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 4.h),

              child: BlocBuilder<MealLayoutCubit, MealStates>(
                buildWhen:
                    (previous, current) =>
                        current is MealGetAllFavoriteErrorState ||
                        current is MealGetAllFavoriteSuccessState ||
                        current is MealGetAllFavoriteLoadingState,
                builder: (context, state) {
                  final cubit = MealLayoutCubit.get(context);
                  switch (state) {
                    case MealGetAllFavoriteLoadingState _:
                      return const Center(child: CircularProgressIndicator());

                    case MealGetAllFavoriteErrorState _:
                      return Center(
                        child: Text(state.error, textAlign: TextAlign.center),
                      );

                    case MealGetAllFavoriteSuccessState _:
                      if (cubit.favoriteMeals.isEmpty) {
                        return const Center(child: Text('no meals saved'));
                      }

                      return GridView.builder(
                        padding: EdgeInsets.only(bottom: 30.h),

                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,

                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h,
                        ),
                        itemCount: cubit.favoriteMeals.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, MealDetailsScreen.mealDetailsScreen,
                                  arguments: cubit.favoriteMeals[index]);
                            },

                            child: CustomItemMealSaved(
                              searchByMealResponseModel:
                                  cubit.favoriteMeals[index],
                              boxShadow: BoxShadow(
                                blurStyle: BlurStyle.outer,
                                offset: const Offset(0, 4),
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 15,
                              ),
                            ),
                          );
                        },
                      );

                    default:
                      return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ),

       
       const BlocListnerSave()
       
        ],
      ),
    );
  }
}
