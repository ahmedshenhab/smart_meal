// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/style/app_color.dart';
import 'package:smart_meal/module/meal_layout/cubit/cubit.dart';
import 'package:smart_meal/module/meal_layout/cubit/stataes.dart';
import 'package:smart_meal/module/shred_widget/custom_item_meal.dart';

import 'package:side_sheet/side_sheet.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<String> images = ['assets/images/m1.png', 'assets/images/m2.png'];

    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Column(
      children: [
        SizedBox(height: mediaQuery.size.height * 0.03),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: mediaQuery.size.width * 0.06,
          ),

          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search, color: AppColor.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: AppColor.white,
            ),
          ),
        ),
        SizedBox(height: mediaQuery.size.height * 0.02),

        Align(
          alignment: AlignmentDirectional(0.88, 0),

          child: InkWell(
            // focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              SideSheet.right(
                width: mediaQuery.size.width * 0.8,
                sheetBorderRadius: 30,
                body: filtersModal(context),
                context: context,
                transitionDuration: Duration(milliseconds: 230),
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'More Filters',
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: AppColor.frannyColor,
                    fontFamily: 'Inter',
                    fontSize: 14.7.sp,
                  ),
                ),
                SizedBox(width: mediaQuery.size.width * 0.007),
                Icon(Icons.filter_list, size: 16.w),
              ],
            ),
          ),
        ),

        SizedBox(height: mediaQuery.size.height * 0.04),
        BlocBuilder<MealLayoutCubit, MealStates>(
          builder: (context, state) {
            final cubit = MealLayoutCubit.get(context);

            return Row(
              spacing: 10.w,
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  cubit.categorys
                      .map(
                        (e) => ElevatedButton(
                          onPressed: () => cubit.changeCategory(e),
                          style: ElevatedButton.styleFrom(
                            overlayColor: Colors.transparent,
                            // shadowColor: Colors.transparent,
                            backgroundColor:
                                cubit.selectedCategory == e
                                    ? Colors.orange
                                    : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.r),
                            ),
                          ),
                          child: Text(
                            e,
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color:
                                  cubit.selectedCategory == e
                                      ? Colors.white
                                      : Colors.black,
                              fontFamily: 'Sofia Pro',
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                      )
                      .toList(),
            );
          },
        ),

        SizedBox(height: mediaQuery.size.height * 0.02),

        Expanded(
          child: Container(
            // foregroundDecoration: BoxDecoration(
            //   borderRadius: BorderRadius.only(

            //   ),
            // ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
              color: AppColor.white,
            ),
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 7.h),
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: GridView.builder(
              padding: const EdgeInsets.all(0),

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,

                crossAxisSpacing: 10.w,
                mainAxisSpacing: 20.h,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return CustomItemMeal(
                  color1: AppColor.deepOrange,
                  color2: AppColor.white,

                  boxShadow: BoxShadow(
                    offset: const Offset(0, 5),
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 15,

                    spreadRadius: 5,
                  ),
                  image: images[1],
                  text: 'salad farm fries',
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

filtersModal(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Filters',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontFamily: 'cambria',
            fontSize: 25,
            color: AppColor.black,
          ),
        ),
        SizedBox(height: 40),
        ContentSlideBar(label: 'Calories', labe2: '0 calorie - 5000 calories'),
        ContentSlideBar(label: 'Protein', labe2: '0 gram - 5000 grams'),
        ContentSlideBar(label: 'Sugar', labe2: '0 gram - 5000 grams'),
        ContentSlideBar(label: 'Fats', labe2: '0 gram - 5000 grams'),
        ContentSlideBar(label: 'Carbs', labe2: '0 gram - 5000 grams'),
      ],
    ),
  );
}

class ContentSlideBar extends StatefulWidget {
  const ContentSlideBar({super.key, required this.label, required this.labe2});
  final String label;
  final String labe2;

  @override
  State<ContentSlideBar> createState() => _ContentSlideBarState();
}

class _ContentSlideBarState extends State<ContentSlideBar> {
  double value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontFamily: 'cambria',
            fontSize: 25,
            color: AppColor.black,
          ),
        ),
        SizedBox(height: 5),
        Text(
          widget.labe2,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontFamily: 'cambria',
            fontSize: 20,
            color: AppColor.black,
          ),
        ),
        Slider(
          value: value,
          onChanged: (newValue) {
            setState(() {
              value = newValue;
            });
          },

          divisions: 100,
          label: value.round().toString(),
          max: 100,

          // inactiveColor: AppColor.deepOrange,
          // activeColor: AppColor.saveColor,
        ),
      ],
    );
  }
}
