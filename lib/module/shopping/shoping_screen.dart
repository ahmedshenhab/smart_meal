import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/generated/l10n.dart';
import '../../core/style/app_color.dart';
import 'cubit/shopping_cubit.dart';

class ShopingScreen extends StatelessWidget {
  const ShopingScreen({super.key});
  static const shopingScreen = 'shoping-screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingCubit, ShoppingState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColor.scaffoldBackgroundheavy,

          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 30.h),
                  Container(
                    width: 30.w,
                    height: 30.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.deepOrange,
                    ),

                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: AppColor.black,
                      size: 18.w,
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

                      padding: EdgeInsets.only(
                        left: 12.w,
                        right: 12.w,
                        top: 4.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              ShoppingCubit.get(context).deleteAllCarts();
                            },
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
                              S.of(context).deleteAll,
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
                              itemCount:
                                  ShoppingCubit.get(context).carts.length,
                              padding: const EdgeInsets.all(0),

                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 10.h,
                                  ),

                                  margin: EdgeInsets.only(
                                    bottom: 10.h,
                                    top: 10,
                                  ),
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
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),

                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxWidth:
                                              MediaQuery.of(
                                                context,
                                              ).size.width *
                                              0.6,
                                        ),

                                        child: Text(
                                          ShoppingCubit.get(
                                            context,
                                          ).carts[index].ingrediant,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium!.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.sp,
                                            fontFamily: 'SofiaSans',
                                          ),
                                        ),
                                      ),

                                      InkWell(
                                        onTap: () {
                                          ShoppingCubit.get(context).deleteRow(
                                            ShoppingCubit.get(
                                                  context,
                                                ).carts[index].id ??
                                                0,
                                          );
                                        },
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
      },
    );
  }
}
