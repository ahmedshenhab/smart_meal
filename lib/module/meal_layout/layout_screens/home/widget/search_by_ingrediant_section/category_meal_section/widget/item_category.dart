import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/ui/style/app_color.dart';
import 'package:smart_meal/generated/l10n.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({super.key, required this.text, required this.image});

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
              maxLines: 1,

              overflow: TextOverflow.ellipsis,
              text,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: AppColor.white,
                fontSize: 15.sp,
                fontFamily: 'SofiaSans',
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              S.of(context).recipeCount,
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
