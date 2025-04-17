import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/style/app_color.dart';
import 'package:smart_meal/reusable.dart';

class IngrediantBody extends StatelessWidget {
  const IngrediantBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ingredients',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp,
                      fontFamily: 'SofiaSans',
                    ),
                  ),
                  Text(
                    '4 items',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColor.gray.withValues(alpha: 0.9),
                      fontSize: 13.sp,
                      fontFamily: 'SofiaSans',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              InkWell(
                onTap: () {},
                child: Text(
                  'Add All to Cart',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColor.deepOrange,
                    height: -1.h,
                    fontSize: 16,
                    fontFamily: 'SofiaSans',
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 15.h),
          shrinkWrap: true,

          padding: const EdgeInsets.all(0),

          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,

          itemBuilder:
              (context, index) => Align(
                child: Container(
                  alignment: Alignment.center,
                  width: 238,
                  height: 50.h,

                  decoration: BoxDecoration(
                    boxShadow:
                        index.isOdd
                            ? [
                              BoxShadow(
                                color: Colors.grey.withValues(alpha: 0.25),
                                offset: const Offset(0.0, 2),
                                blurRadius: 16,
                              ),
                            ]
                            : null,
                    color: index.isEven ? AppColor.deepOrange : AppColor.white,
                    borderRadius: BorderRadius.circular(16.r),
                  ),

                  child: Text(
                    '1/2 tsp of salt',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 18.sp,
                      fontFamily: 'SofiaSans',
                      fontWeight: FontWeight.w900,
                      color:
                          (index + 1).isEven
                              ? AppColor.gray.withAlpha(200)
                              : AppColor.white,
                    ),
                  ),
                ),
              ),
        ),

        SizedBox(height: 25.h),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: SizedBox(
            width: double.infinity,
            height: 52.h,
            child: CustomElevatedButton(text: 'Add to Cart', onPressed: () {}),
          ),
        ),
      ],
    );
  }
}
