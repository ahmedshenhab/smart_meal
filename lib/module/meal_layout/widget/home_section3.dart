import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/constant/constant.dart';

class HomeSection3 extends StatelessWidget {
  const HomeSection3({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: mediaQuery.size.height * 0.07,
        ),
        Text(
          "Recipes By Categories",
          style: theme.textTheme.bodyMedium!.copyWith(
            color: Constant.black,
            fontSize: 22.sp,
          ),
          // textAlign: TextAlign.center,
        ),
        SizedBox(
          height: mediaQuery.size.height * 0.03,
        ),
        Text(
          "For Everytime",
          style: theme.textTheme.bodyMedium!
              .copyWith(color: Colors.brown, fontSize: 22.sp),
          // textAlign: TextAlign.center,
        ),
        SizedBox(
          height: mediaQuery.size.height * 0.04,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildStackCategory3(
                theme, 'Breackfat', 'assets/images/breakFast.png', mediaQuery),
            buildStackCategory3(
                theme, 'lunch', 'assets/images/lunch.png', mediaQuery),
            buildStackCategory3(
                theme, 'dinner', 'assets/images/dinner.png', mediaQuery),
          ],
        ),
      ],
    );
  }

  Widget buildStackCategory3(
      ThemeData theme, String text, String image, MediaQueryData mediaQuery) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          width: mediaQuery.size.width * 0.308,
          height: mediaQuery.size.height * 0.35,
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //   fit: BoxFit.cover,
          //   image: AssetImage(
          //     image,
          //   ),
          // )),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            Text(
              text,
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: Constant.white, fontSize: 15.sp),
            ),
            Text(
              "150+ recipe",
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: Constant.categoriesColor, fontSize: 10.sp),
            ),
          ],
        ),
      ],
    );
  }
}
