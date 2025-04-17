import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/style/app_color.dart';
import 'package:smart_meal/module/shred_widget/custom_item_meal.dart';

class Saved extends StatelessWidget {
  const Saved({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = ['assets/images/m1.png', 'assets/images/m2.png'];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 30.h),
          const InkWell(
            child: Icon(
              Icons.shopping_cart_outlined,
              color: AppColor.deepOrange,
              size: 20,
            ),
          ),
          SizedBox(height: 1.h),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                color: AppColor.white,
              ),

              padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 4.h),

              child: GridView.builder(
                padding: EdgeInsets.only(bottom: 30.h), // <-- Add this line

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,

                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CustomItemMeal(
                    color1: AppColor.deepOrange,
                    color2: AppColor.white,

                    boxShadow: BoxShadow(
                      blurStyle: BlurStyle.outer,
                      offset: const Offset(0, 4),
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 15,
                    ),
                    image: images[1],
                    text: 'salad farm fries',
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
