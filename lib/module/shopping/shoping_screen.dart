import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/style/app_color.dart';

class ShopingScreen extends StatelessWidget {
  const ShopingScreen({super.key});
  static const shopingScreen = 'shoping-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundheavy,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 30.h),
              IconButton(
                style: Theme.of(context).iconButtonTheme.style!.copyWith(
                  minimumSize: WidgetStateProperty.all(Size(30.w, 30.h)),
                  backgroundColor: WidgetStateProperty.all(AppColor.deepOrange),
                ),
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColor.black,
                  size: 22.w,
                ),
              ),

              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                    color: AppColor.white,
                  ),

                  padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 4.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: Theme.of(
                          context,
                        ).textButtonTheme.style!.copyWith(
                          minimumSize: WidgetStateProperty.all(
                            const Size(119, 30),
                          ),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                          ),
                          alignment: Alignment.center,

                          padding: WidgetStateProperty.all(EdgeInsets.zero),
                          backgroundColor: WidgetStateProperty.all(
                            AppColor.deepOrange,
                          ),
                        ),
                        child: Text(
                          'Delete All',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(
                            color: AppColor.white,
                            fontSize: 15.sp,
                            fontFamily: 'SofiaSans',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),

                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 20,
                          padding: EdgeInsets.only(bottom: 15.w),

                          itemBuilder: (context, index) {
                            return Container(
                              height: 40.h,

                              margin: EdgeInsets.only(bottom: 10.h, top: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(
                                      alpha: 0.13,
                                    ), // same as Figma 10% opacity
                                    blurRadius: 10, // spread of shadow
                                    offset: const Offset(
                                      0,
                                      2,
                                    ), // position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(30.r),
                              ),

                              child: Row(
                                spacing: 30.w,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '50g of red onions ',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp,
                                      fontFamily: 'SofiaSans',
                                    ),
                                  ),

                                  InkWell(
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 25.w,
                                      height: 25.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
                                        color: AppColor.deepOrange,
                                      ),

                                      child: const Icon(
                                        Icons.close_outlined,
                                        color: AppColor.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
