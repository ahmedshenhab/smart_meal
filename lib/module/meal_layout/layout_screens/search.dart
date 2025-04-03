// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/constant/constant.dart';
import 'package:smart_meal/module/meal_layout/cubit/cubit.dart';
import 'package:smart_meal/module/meal_layout/cubit/stataes.dart';

import '../../../reusable.dart';
import 'package:side_sheet/side_sheet.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    List<String> images = [
      'assets/images/m1.png',
      'assets/images/m2.png',
    ];
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: mediaQuery.size.height * 0.03,
          ),

          //search
          SizedBox(
            width: mediaQuery.size.width * 0.91,
            height: mediaQuery.size.height * 0.07,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search, color: Constant.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      16.r,
                    ),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Constant.white,
              ),
            ),
          ),

          Transform.translate(
            offset: Offset(
                mediaQuery.size.width * 0.34, mediaQuery.size.height * 0.02),
            child: InkWell(
              // focusColor: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                SideSheet.right(
                    body: filtersModal(context),
                    context: context,
                    transitionDuration: Duration(milliseconds: 230));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'More Filters',
                    style: theme.textTheme.bodyMedium!.copyWith(
                        color: Constant.frannyColor,
                        fontFamily: 'Inter',
                        fontSize: 14.7.sp),
                  ),
                  SizedBox(
                    width: mediaQuery.size.width * 0.007,
                  ),
                  Icon(
                    Icons.filter_list,
                    size: 16.w,
                  )
                ],
              ),
            ),
          ),

          SizedBox(
            height: mediaQuery.size.height * 0.06,
          ),

          BlocConsumer<MealCubit, MealStates>(
            listener: (context, state) {},
            builder: (context, state) {
              final cubit = MealCubit.get(context);

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: cubit.categorys
                    .map((e) => ElevatedButton(
                          onPressed: () => cubit.changeCategory(e),
                          style: ElevatedButton.styleFrom(
                            overlayColor: Colors.transparent,
                            // shadowColor: Colors.transparent,
                            backgroundColor: cubit.selectedCategory == e
                                ? Colors.orange
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.r)),
                          ),
                          child: Text(
                            e,
                            style: theme.textTheme.bodyMedium!.copyWith(
                                color: cubit.selectedCategory == e
                                    ? Colors.white
                                    : Colors.black,
                                fontFamily: 'Sofia Pro',
                                fontSize: 15.sp),
                          ),
                        ))
                    .toList(),
              );
            },
          ),

          // elevatedCategory(
          //   theme,
          // ),
          SizedBox(
            height: mediaQuery.size.height * 0.02,
          ),

          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(
              horizontal: mediaQuery.size.width * 0.02,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return buildRecomended(
                  mediaQuery: mediaQuery,
                  theme,
                  'salad farm fries',
                  Constant.deepOrange,
                  Constant.white,
                  images[1]);
            },
          ),
        ],
      ),
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
        Text('Filters',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: 'cambria', fontSize: 25, color: Constant.black)),
        SizedBox(height: 40),
        _buildSlider('Calories', '0 calorie - 5000 calories', 0, 5000, context),
        _buildSlider('Protein', '0 gram - 5000 grams', 0, 5000, context),
        _buildSlider('Sugar', '0 gram - 5000 grams', 0, 5000, context),
        _buildSlider('Fats', '0 gram - 5000 grams', 0, 5000, context),
        _buildSlider('Carbs', '0 gram - 5000 grams', 0, 5000, context),
      ],
    ),
  );
}

Widget _buildSlider(
    String label, String labe2, double min, double max, BuildContext context) {
  return Column(
    // crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontFamily: 'cambria', fontSize: 25, color: Constant.black)),
      SizedBox(
        height: 5,
      ),
      Text(labe2,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontFamily: 'cambria', fontSize: 20, color: Constant.black)),
      Slider(
        value: min,
        onChanged: (value) {},
        min: min,
        max: max,
        inactiveColor: Constant.deepOrange,
        activeColor: Constant.saveColor,
      ),
    ],
  );
}
