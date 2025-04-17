import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/style/app_color.dart';

class CustomItemMeal extends StatelessWidget {
  const CustomItemMeal({
    super.key,
    required this.text,
    required this.color1,
    required this.color2,
    required this.image,
    this.boxShadow,
  });

  final String text;
  final Color color1;
  final Color color2;
  final String image;
  final BoxShadow? boxShadow;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 150.w,
      height: 145.h,

      decoration: BoxDecoration(
        boxShadow: boxShadow != null ? [boxShadow!] : [],
        color: AppColor.white.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Column(
        spacing: 2.h,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.asset(
                  image,
                  width: 135.w,
                  height: 80.h,

                  fit: BoxFit.cover,
                ),
              ),

              IconButton(
                alignment: AlignmentDirectional.center,
                constraints: BoxConstraints(
                  minWidth: 30.w,
                  minHeight: 30.h,
                  maxWidth: 30.w,
                  maxHeight: 30.h,
                ),
                onPressed: () {},

                icon: const Icon(Icons.bookmark),
                style: theme.iconButtonTheme.style!.copyWith(
                  iconSize: WidgetStateProperty.all(19.h),
                  backgroundColor: WidgetStateProperty.all(color2),
                  foregroundColor: WidgetStateProperty.all(color1),
                  padding: WidgetStateProperty.all(EdgeInsets.zero),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
              ),
            ],
          ),

          SizedBox(height: 1.h),
          Align(
            alignment: AlignmentDirectional(-0.4.w, 0),
            child: Text(
              text,
              style: theme.textTheme.bodyMedium!.copyWith(
                fontFamily: 'RobotoSerif',
                color: AppColor.black,
                fontWeight: FontWeight.normal,
                fontSize: 13.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                spacing: 4.w,
                children: [
                  Image.asset(
                    'assets/images/Union.png',
                    width: 18.w,
                    height: 17.h,
                  ),
                  Baseline(
                    baseline: 16.7.h,
                    baselineType: TextBaseline.alphabetic,
                    child: Text(
                      'Lunch',
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: AppColor.gray,
                        fontFamily: 'Roboto',
                        fontSize: 12.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/fire.png',
                    width: 18.w,
                    height: 17.h,
                  ),
                  Baseline(
                    baseline: 16.7.h,
                    baselineType: TextBaseline.alphabetic,

                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '400',
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: AppColor.gray,
                              fontFamily: 'Roboto',
                              fontSize: 12.sp,
                            ),
                          ),
                          TextSpan(
                            text: ' cal',
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: AppColor.gray,
                              fontFamily: 'Roboto',
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      // textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
