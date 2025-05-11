import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/style/app_color.dart';

class InstructionItem extends StatelessWidget {
  const InstructionItem({
    super.key,
    required this.number,
    required this.description,
  });
  final int number;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // Number Circle
          Container(
            width: 20.w,
            height: 20.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColor.deepOrange,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Text(
              '$number',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColor.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 12.w),

          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5.h),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14.sp,
                    fontFamily: 'SofiaSans',
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
