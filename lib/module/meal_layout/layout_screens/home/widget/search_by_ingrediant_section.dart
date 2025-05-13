import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/generated/l10n.dart';
import '../../../../../core/style/app_color.dart';
import '../../../../meal_details/meal_datails_screen.dart';
import '../../../cubit/cubit.dart';
import '../../../cubit/stataes.dart';

class SearchByIngrediantSection extends StatelessWidget {
  const SearchByIngrediantSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      height: mediaQuery.size.height * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        color: AppColor.brownBurn,
      ),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Text(
            S.of(context).dontKnowWhatToCook,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: Colors.white,
              fontSize: 22.sp,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            S.of(context).searchWithIngredients,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: AppColor.deepOrange,
              fontSize: 22.sp,
            ),
          ),
          SizedBox(height: mediaQuery.size.height * 0.017),
          Container(
            width: mediaQuery.size.width * 0.86,
            height: mediaQuery.size.height * 0.4,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Column(
              children: [
                SizedBox(height: mediaQuery.size.height * 0.008),
                Text(
                  S.of(context).yourIngredients,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: AppColor.brown,
                    fontSize: 20.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: mediaQuery.size.height * 0.024),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: mediaQuery.size.width * 0.05,
                  ),
                  child: SearchWithIngrediant(theme: theme),
                ),
                SizedBox(height: mediaQuery.size.height * 0.008),
                BlocBuilder<MealLayoutCubit, MealStates>(
                  buildWhen:
                      (previous, current) =>
                          current is MealSearchByIngrediantLoadingState ||
                          current is MealSearchByIngrediantSuccessState ||
                          current is MealSearchByIngrediantErrorState,
                  builder: (context, state) {
                    switch (state) {
                      case MealSearchByIngrediantLoadingState _:
                        return Column(
                          children: [
                            SizedBox(height: 60.h),
                            const CircularProgressIndicator(
                              color: AppColor.deepOrange,
                            ),
                          ],
                        );

                      case MealSearchByIngrediantSuccessState _:
                        if (state.meals.isEmpty) {
                          return Column(
                            children: [
                              const SizedBox(height: 60),

                              Text(S.of(context).noMealsFound),
                            ],
                          );
                        }

                        return SizedBox(
                          height: mediaQuery.size.height * 0.263,
                          child: GridView.builder(
                            padding: EdgeInsets.only(
                              right: 12.w,
                              left: 12.w,
                              bottom: 6.h,
                              top: 6.h,
                            ),
                            itemCount:
                                state.meals.length, // No need to cast the state
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 3.3,
                                  mainAxisSpacing: 12.h,
                                  crossAxisSpacing: 20.w,
                                ),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    MealDetailsScreen.mealDetailsScreen,
                                    arguments: state.meals[index],
                                  );
                                },
                                child: _buildResuiltIngrediant(
                                  state.meals[index].recipeName ?? 'defualt',
                                  theme,
                                  context,
                                ),
                              );
                            },
                          ),
                        );
                      case MealSearchByIngrediantErrorState _:
                        return Column(
                          children: [SizedBox(height: 60.h), Text(state.error)],
                        );

                      default:
                        return const SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResuiltIngrediant(
    String label,
    ThemeData theme,
    BuildContext context,
  ) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 4,

            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(50.r),
        color: Colors.grey.shade100,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          Icon(
            Icons.search,
            size: 17.h,
            color: AppColor.resuiltIconSearchColor,
          ),

          SizedBox(
            width: 90.w,
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: theme.textTheme.bodyMedium!.copyWith(
                fontSize: 13.sp,
                color: AppColor.resuiltIconSearchColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchWithIngrediant extends StatelessWidget {
  const SearchWithIngrediant({super.key, required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      width: 266.w,
      child: TextFormField(
        controller: MealLayoutCubit.get(context).searchIngrediantController,

        // validator: (value) {
        //   final pattern = RegExp(r'^[A-Za-z]+$');
        //   if (!pattern.hasMatch(value!)) {
        //     return 'write one word';
        //   }
        //   return null; // Validation passed
        // },
        onChanged: (value) {
          MealLayoutCubit.get(context).searchByIngrediant(value);

          // if (MealLayoutCubit.get(context).formKey.currentState!.validate()) {
          // }
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColor.fieldColor,
          prefixIcon: Icon(
            Icons.search,
            color: AppColor.fieldHintSearchColor,
            size: 20.h,
          ),
          hintText: S.of(context).searchForIngredient,
          hintStyle: theme.textTheme.bodyMedium!.copyWith(
            fontFamily: 'Roboto',
            fontSize: 14.sp,
            color: AppColor.fieldHintSearchColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
