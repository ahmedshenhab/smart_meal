import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/style/app_color.dart';

class ProperitylItemMeal extends StatelessWidget {
  const ProperitylItemMeal({
    super.key,
    required this.image,
    required this.title,
    this.widget,
  });
  final String? image;
  final String title;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(image!, width: 40.w, height: 40.h),

        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColor.gray.withValues(alpha: 0.8),
              fontSize: 17.sp,
              height: 1.3,
              fontFamily: 'SofiaSans',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
