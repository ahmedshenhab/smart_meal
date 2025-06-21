import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/extention/extention.dart';
import 'package:smart_meal/core/ui/style/app_color.dart';
import 'package:smart_meal/generated/l10n.dart';
import 'package:smart_meal/module/meal_layout/cubit/cubit.dart';

class SearchWithIngrediant extends StatelessWidget {
  const SearchWithIngrediant({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      height: 36.h,

      child: TextFormField(
        controller: MealLayoutCubit.get(context).searchIngrediantController,

        onChanged: (value) {
          if (value.isEmpty) return;
          MealLayoutCubit.get(context).searchByIngrediant(value);
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: context.isDark ? AppColor.blackLight : AppColor.fieldColor,
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
