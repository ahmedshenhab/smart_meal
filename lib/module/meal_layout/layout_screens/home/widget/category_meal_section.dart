import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_meal/generated/l10n.dart';
import '../../../../../core/style/app_color.dart';
import '../../../../category_screen/category_screen.dart';
import '../../../cubit/cubit.dart';
import '../../../cubit/stataes.dart';
import '../../../../../reusable.dart';

class Categorymodel {
  Categorymodel( { required this.key, required this.title, required this.image, required this.icon});
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
            S.of(context).recipesByCategories,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: AppColor.black,
              fontSize: 22.sp,
            ),
          ),

          Text(
            S.of(context).forEverytime,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: Colors.brown,
              fontSize: 22.sp,
            ),
            // textAlign: TextAlign.center,
          ),
          SizedBox(height: mediaQuery.size.height * 0.076),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                mealCategories.map((category) {
                  final key = category.key;
                  final title = category.title;
                  final image = category.image;

                  final icon = category.icon;
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.5.w / 2,
                    ), // spacing ~ spacing / 2 per side
                    child: InkWell(
                      onTap: () {
                        MealLayoutCubit.get(context).getAllMeal(title, icon, key);
                      },
                      child: ItemCategory(text: title, image: image),
                    ),
                  );
                }).toList(),
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
            builder: (context, state) {
              switch (state) {
                case MealGetAllMealLoadingState _:
                  return const Center(
                    child: LinearProgressIndicator(color: AppColor.deepOrange),
                  );
                case MealGetAllMealSuccessState _:
                  return const SizedBox.shrink();
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
                          S.of(context).retry,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(
                            color: AppColor.deepOrange,
                            fontSize: 15.sp,
                          ),
                        ),
                        onPressed: () {
                          // MealLayoutCubit.get(context).getAllMeal();
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
              S.of(context).recipeCount,
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
