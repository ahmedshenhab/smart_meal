import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/style/app_color.dart';

class HomeSection3 extends StatelessWidget {
  HomeSection3({super.key});
  final categoriesNames = {
    {"Breakfast": "assets/images/breakFast.png"},
    {"Lunch": "assets/images/lunch.png"},
    {"Dinner": "assets/images/dinner.png"},
  };
  final Set<String> categoriesImage = {
    "assets/images/breakFast.png",
    "assets/images/lunch.png",
    "assets/images/dinner.png",
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Container(
      width: double.infinity,
      height: mediaQuery.size.height * 0.44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        color: AppColor.white,
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: mediaQuery.size.height * 0.03),
          Text(
            "Recipes By Categories",
            style: theme.textTheme.bodyMedium!.copyWith(
              color: AppColor.black,
              fontSize: 22.sp,
            ),
            // textAlign: TextAlign.center,
          ),
          SizedBox(height: mediaQuery.size.height * 0.03),
          Text(
            "For Everytime",
            style: theme.textTheme.bodyMedium!.copyWith(
              color: Colors.brown,
              fontSize: 22.sp,
            ),
            // textAlign: TextAlign.center,
          ),
          SizedBox(height: mediaQuery.size.height * 0.04),
          Row(
            spacing: 3.5.w,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                categoriesNames.length,
                (index) => buildStackCategory3(
                  theme,
                  categoriesNames.elementAt(index).entries.first.key,
                  categoriesNames.elementAt(index).entries.first.value,
                  mediaQuery,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildStackCategory3(
    ThemeData theme,
    String text,
    String image,
    MediaQueryData mediaQuery,
  ) {
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
              textAlign: TextAlign.center,
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
