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

    return Container(
      height: mediaQuery.size.height * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        color: context.isDark ? AppColor.darkGray : AppColor.white,
      ),
      child: Stack(
        children: [
          Transform.translate(
            offset: Offset(22.w, 0),

            child: Align(
              child: Image.asset('assets/images/chefImage.png', width: 300.w),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 6.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).seachForMeal,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 22.sp,
                    color: context.isDark ? Colors.white : AppColor.black,
                    fontFamily: 'cambria',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 7.h),
                Text(
                  S.of(context).letUsCockForYou,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.brown,
                    fontSize: 22.sp,
                    fontFamily: 'cambria',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
