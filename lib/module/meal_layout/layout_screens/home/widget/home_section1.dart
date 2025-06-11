import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/extention/extention.dart';
import 'package:smart_meal/core/ui/style/app_color.dart';
import 'package:smart_meal/generated/l10n.dart';

class HomeSection1 extends StatelessWidget {
  const HomeSection1({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Stack(
      alignment: AlignmentDirectional(-.92.w, -.1.h),
      children: [
        Container(
          padding: EdgeInsetsDirectional.only(start: 40.w),
          height: mediaQuery.size.height * 0.37,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0.r)),
            color: context.isDark ? Colors.black : Colors.white,
          ),
          child: Image.asset(fit: BoxFit.cover, 'assets/images/chefImage.png'),
        ),

        Column(
          children: [
            Text(
              S.of(context).seachForMeal,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: context.isDark ? Colors.white : AppColor.black,
              ),
            ),
            SizedBox(height: 7.h),
            Text(
              S.of(context).letUsCockForYou,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: AppColor.brown),
            ),
          ],
        ),
      ],
    );
  }
}
