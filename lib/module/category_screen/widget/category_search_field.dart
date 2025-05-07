import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/style/app_color.dart';
import 'package:smart_meal/module/category_screen/cubit/cubit.dart';

class CategorySearchField extends StatelessWidget {
  const CategorySearchField({super.key});
  

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(
        left: mediaQuery.size.width * 0.06,
        right: mediaQuery.size.width * 0.06,
      ),

      child: TextField(
        onChanged: (value) {
         CategoryScreenCubit.get(context).serch(value);
        },
       
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
