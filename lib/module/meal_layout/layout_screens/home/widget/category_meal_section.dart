import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/style/app_color.dart';
import 'package:smart_meal/module/category_screen/category_screen.dart';
import 'package:smart_meal/module/meal_layout/cubit/cubit.dart';
import 'package:smart_meal/module/meal_layout/cubit/stataes.dart';

class CategoryMealSection extends StatefulWidget {
  const CategoryMealSection({super.key});

  @override
  State<CategoryMealSection> createState() => _CategoryMealSectionState();
}

class _CategoryMealSectionState extends State<CategoryMealSection> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Container(
      width: double.infinity,
      height: mediaQuery.size.height * 0.48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        color: AppColor.white,
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: mediaQuery.size.height * 0.02),
          Text(
            "Recipes By Categories",
            style: theme.textTheme.bodyMedium!.copyWith(
              color: AppColor.black,
              fontSize: 22.sp,
            ),
          ),

          Text(
            "For Everytime",
            style: theme.textTheme.bodyMedium!.copyWith(
              color: Colors.brown,
              fontSize: 22.sp,
            ),
            // textAlign: TextAlign.center,
          ),
          SizedBox(height: mediaQuery.size.height * 0.076),
          BlocBuilder<MealLayoutCubit, MealStates>(
            buildWhen:
                (previous, current) =>
                    current is MealGetAllMealLoadingState ||
                    current is MealGetAllMealSuccessState ||
                    current is MealGetAllMealErrorState,

            builder: (context, state) {
              switch (state) {
                case MealGetAllMealLoadingState _:
                  return const Center(child: CircularProgressIndicator());

                case MealGetAllMealSuccessState _:
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        MealLayoutCubit.get(context).mealCategories.map((
                          category,
                        ) {
                          final title = category['title'] as String;
                          final image = category['image'] as String;

                          final icon = category['icon'] as IconData;
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 3.5.w / 2,
                            ), // spacing ~ spacing / 2 per side
                            child: InkWell(
                              onTap: () {
                              
                                Navigator.pushNamed(

                                  context,
                                  CategoryScreen.categoryScreen,
                                  arguments: {
                                    'meals': state.meals[title] ?? [],
                                    'title': title,
                                    'icon': icon,
                                    'mealLayoutCubit': MealLayoutCubit.get(context),

                                  },
                                );
                              },
                              child: ItemCategory(text: title, image: image),
                            ),
                          );
                        }).toList(),
                  );
                case MealGetAllMealErrorState _:
                  return Column(
                    children: [
                      Text(
                        state.error,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.copyWith(fontSize: 18.sp),
                      ),
                      SizedBox(height: mediaQuery.size.height * 0.01),
                      TextButton(
                        child: Text(
                          'Retry',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(
                            color: AppColor.deepOrange,
                            fontSize: 15.sp,
                          ),
                        ),
                        onPressed: () {
                          MealLayoutCubit.get(context).getAllMeal();
                        },
                      ),
                    ],
                  );

                default:
                  return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}

class ItemCategory extends StatelessWidget {
  const ItemCategory({super.key, required this.text, required this.image});

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      alignment: Alignment(-0.5.w, 0.65.h),
      children: [
        Container(
          width: 100.w,
          height: 130.h,

          decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
            borderRadius: BorderRadius.circular(30.r),
          ),
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.black.withValues(alpha: 0.7), Colors.transparent],
            ),
          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              maxLines: 1,

              overflow: TextOverflow.ellipsis,
              text,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: AppColor.white,
                fontSize: 15.sp,
                fontFamily: 'SofiaSans',
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              "150+ recipe",
              style: theme.textTheme.bodyMedium!.copyWith(
                color: AppColor.white.withValues(alpha: 0.8),
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
