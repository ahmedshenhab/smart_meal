import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/style/app_color.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/search/cubit/cubit.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(
        left: mediaQuery.size.width * 0.06,
        right: mediaQuery.size.width * 0.06,
      ),

      child: TextField(
        onChanged: (_)async {
          BlocProvider.of<SearchByMealCubit>(context).search();
        },
        controller:
            BlocProvider.of<SearchByMealCubit>(context).searchController,
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(
            Icons.search,

            color: AppColor.black.withValues(alpha: 0.7),

            size: 22.w,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColor.white,

          // isCollapsed: true,
        ),
      ),
    );
  }
}
