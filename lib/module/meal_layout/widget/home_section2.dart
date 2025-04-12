import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/constant.dart';

class HomeSection2 extends StatelessWidget {
  const HomeSection2({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      height: mediaQuery.size.height * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        color: Constant.brownBurn,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't Know What To Cook?",
            style: theme.textTheme.bodyMedium!
                .copyWith(color: Colors.white, fontSize: 22.sp),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text('Search With Ingredients',
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: Constant.deepOrange, fontSize: 22.sp)),
          SizedBox(height: mediaQuery.size.height * 0.04),
          Container(
            width: mediaQuery.size.width * 0.86,
            height: mediaQuery.size.height * 0.33,
            decoration: BoxDecoration(
              color: Constant.white,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Your Ingredients',
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: Constant.brown, fontSize: 20.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.025),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQuery.size.width * 0.05),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Constant.fieldColor,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Constant.fieldHintSearchColor,
                          size: 20.h,
                        ),
                        hintText: 'Search for Ingredient...',
                        hintStyle: theme.textTheme.bodyMedium!.copyWith(
                            fontFamily: 'Roboto',
                            fontSize: 14.sp,
                            color: Constant.fieldHintSearchColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.023),
                  Wrap(
                    spacing: 10.w,
                    runSpacing: 10.h,
                    children: [
                      _buildIngredientButton2('Meat', theme, context),
                      _buildIngredientButton2('Vegetables', theme, context),
                      _buildIngredientButton2('water', theme, context),
                      _buildIngredientButton2(
                          'Dry Ingredients', theme, context),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIngredientButton2(
      String label, ThemeData theme, BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(Icons.search,
          size: 17.h, color: Constant.resuiltIconSearchColor),
      label: Text(label,
          maxLines: 1,
          style: theme.textTheme.bodyMedium!.copyWith(
              fontSize: 13.sp, color: Constant.resuiltIconSearchColor)),
      style: ElevatedButton.styleFrom(
        // fixedSize: Size.lerp(Size.fromWidth(4), Size.fromWidth(20), 2),
        backgroundColor: Colors.grey.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.r),
        ),
        fixedSize: Size.fromWidth(mediaQuery.size.width * .39),
      ),
    );
  }
}
