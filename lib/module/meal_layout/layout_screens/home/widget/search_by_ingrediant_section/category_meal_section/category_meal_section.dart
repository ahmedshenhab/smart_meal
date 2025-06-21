import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_meal/core/extention/extention.dart';
import 'package:smart_meal/generated/l10n.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/home/widget/search_by_ingrediant_section/category_meal_section/widget/item_category.dart';
import '../../../../../../../core/ui/style/app_color.dart';
import '../../../../../../category_screen/category_screen.dart';
import '../../../../../cubit/cubit.dart';
import '../../../../../cubit/stataes.dart';
import '../../../../../../../reusable.dart';

class Categorymodel {
  Categorymodel({
    required this.key,
    required this.title,
    required this.image,
    required this.icon,
  });
  final String key;
  final String title;
  final String image;
  final IconData icon;
}

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
    final mealCategories = [
      Categorymodel(
        key: 'Breakfast',
        title: S.of(context).breakfast,
        image: 'assets/images/breakFast.png',
        icon: Icons.breakfast_dining_outlined,
      ),

      Categorymodel(
        key: 'Lunch',
        title: S.of(context).lunch,
        image: 'assets/images/lunch.png',
        icon: Icons.lunch_dining_outlined,
      ),
      Categorymodel(
        key: 'Dinner',
        title: S.of(context).dinner,
        image: 'assets/images/dinner.png',
        icon: Icons.dinner_dining_outlined,
      ),
    ];
    final categoryMap = {
      'Breakfast': S.of(context).breakfast,
      'Lunch': S.of(context).lunch,
      'Dinner': S.of(context).dinner,
    };
    MealLayoutCubit.get(context).categoryMap = categoryMap;

    return Container(
      width: double.infinity,
      padding: EdgeInsetsDirectional.only(bottom: 30.w, top: 20.w),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        color: context.isDark ? AppColor.black : AppColor.white,
      ),
      child: Column(
        children: [
          Text(
            S.of(context).recipesByCategories,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: context.isDark ? AppColor.white : AppColor.black,
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
            ),
          ),

          Text(
            S.of(context).forEverytime,
            style: theme.textTheme.bodyMedium!.copyWith(
              color:  Colors.brown,
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: mediaQuery.size.height * 0.076),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  mealCategories.map((category) {
                    final key = category.key;
                    final title = category.title;
                    final image = category.image;

                    final icon = category.icon;
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.w,
                      ), // spacing ~ spacing / 2 per side
                      child: InkWell(
                        onTap: () {
                          MealLayoutCubit.get(
                            context,
                          ).getAllMeal(title, icon, key);
                        },
                        child: ItemCategory(text: title, image: image),
                      ),
                    );
                  }).toList(),
            ),
          ),
          BlocConsumer<MealLayoutCubit, MealStates>(
            listener: (context, state) {
              switch (state) {
                case MealGetAllMealSuccessState _:
                  Navigator.pushNamed(
                    context,
                    CategoryScreen.categoryScreen,
                    arguments: {
                      'meals': state.meals ?? [],
                      'title': state.title,
                      'icon': state.icon,
                      'mealLayoutCubit': MealLayoutCubit.get(context),
                    },
                  );

                  break;
                case MealGetAllMealErrorState _:
                  Fluttertoast.cancel();
                  buildshowToast(msg: state.error, color: AppColor.deepOrange);
                  break;
                default:
              }
            },
            buildWhen:
                (previous, current) =>
                    current is MealGetAllMealLoadingState ||
                    current is MealGetAllMealErrorState ||
                    current is MealGetAllMealSuccessState,
            builder: (context, state) {
              switch (state) {
                case MealGetAllMealLoadingState _:
                  return Column(
                    children: [
                      SizedBox(height: mediaQuery.size.height * 0.01),
                      const LinearProgressIndicator(color: AppColor.deepOrange),
                    ],
                  );

                case MealGetAllMealSuccessState _:
                  return const SizedBox.shrink();

                case MealGetAllMealErrorState _:
                  return const SizedBox.shrink();
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
