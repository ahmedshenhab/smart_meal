// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/constant/constant.dart';
import 'package:smart_meal/reusable.dart';
import 'package:smart_meal/module/meal_layout/widget/home_section1.dart';
import 'package:smart_meal/module/meal_layout/widget/home_section2.dart';

import '../widget/home_section3.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return SingleChildScrollView(
      // physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.02),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: mediaQuery.size.height * 0.03,
              ),

              ///1
              HomeSection1(),
              const SizedBox(
                height: 20,
              ),

              //2
              Container(
                width: double.infinity,
                height: mediaQuery.size.height * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.r)),
                  color: Constant.brownBurn,
                ),
                child: HomeSection2(),
              ),

              ////3
              ///
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: double.infinity,
                  height: mediaQuery.size.height * 0.64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    color: Constant.white,
                  ),
                  child: HomeSection3())

              ////4

              ,
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: mediaQuery.size.height * 0.62,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.r)),
                  color: Constant.brownBurn,
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: mediaQuery.size.height * 0.05,
                    ),
                    Text(
                      "Made Just  For You",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Constant.white, fontSize: 22.sp),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.014,
                    ),
                    Text(
                      "Recommended Meals",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.deepOrange, fontSize: 22.sp),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildRecomended(
                          mediaQuery: mediaQuery,
                          theme,
                          'salad farm fries',
                          Constant.deepOrange,
                          Constant.white,
                          'assets/images/meal2.png',
                        ),
                        buildRecomended(
                          mediaQuery: mediaQuery,
                          theme,
                          'Fried Chicken',
                          Constant.white,
                          Constant.saveColor,
                          'assets/images/meal1.png',
                        )
                      ],
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.047,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/elevatebottun.png',
                        width: mediaQuery.size.width * 0.7,
                        // height: mediaQuery.size.height * 0.09,
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
                ),
              ),

              ////5

              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: mediaQuery.size.height * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.r)),
                  color: Constant.white,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: mediaQuery.size.height * 0.045,
                    ),
                    Text(
                      "Top Rated Meals",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: Constant.black,
                        fontSize: 22.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.02,
                    ),
                    Text(
                      "Updated Everyday",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: Colors.brown,
                        fontSize: 22.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildRecomended(
                          mediaQuery: mediaQuery,
                          theme,
                          'salad farm fries',
                          Constant.deepOrange,
                          Constant.white,
                          'assets/images/meal2.png',
                          boxShadow: BoxShadow(
                            color: Constant.shadow.withOpacity(0.25),
                            spreadRadius: 5.r,
                            blurRadius: 4.r,
                            offset: Offset(0, 5.h),
                          ),
                        ),
                        buildRecomended(theme, 'Fried Chicken', Constant.white,
                            Constant.saveColor, 'assets/images/meal1.png',
                            boxShadow: BoxShadow(
                              color: Constant.shadow.withOpacity(0.25),
                              spreadRadius: 5.r,
                              blurRadius: 4.r,
                              offset: Offset(0, 5.h),
                            ),
                            mediaQuery: mediaQuery)
                      ],
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.047,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/elevatebottun.png',
                        width: 250,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: mediaQuery.size.height * 0.02,
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Widget buildRecomended(
//     ThemeData theme, String text, Color color1, Color color2, String image,
//     {BoxShadow? boxShadow, required MediaQueryData mediaQuery}) {
//   /// you can wrap the contaner with card and details
//   // shape: RoundedRectangleBorder(
//   // borderRadius: BorderRadius.circular(25),
//   // ),

//   return Container(
//     width: mediaQuery.size.width * 0.455,
//     height: mediaQuery.size.height * 0.28,
//     decoration: BoxDecoration(
//         boxShadow: boxShadow != null ? [boxShadow] : [],
//         color: Constant.white,
//         borderRadius: BorderRadius.circular(25.r)),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Stack(
//           alignment: AlignmentDirectional(
//             mediaQuery.size.width * 0.0024,
//             mediaQuery.size.height * -0.0011,
//           ),
//           children: [
//             Container(
//               height: mediaQuery.size.height * 0.137,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: AssetImage(
//                   image,
//                 ),
//               )),
//             ),
//             InkWell(
//               onTap: () {},
//               child: Container(
//                 width: mediaQuery.size.width * 0.1,
//                 height: mediaQuery.size.height * 0.047,
//                 decoration: BoxDecoration(
//                     color: color1, borderRadius: BorderRadius.circular(30)),
//                 child: Icon(
//                   color: color2,
//                   Icons.bookmark,
//                 ),
//               ),
//             )
//           ],
//         ),
//         SizedBox(
//           height: mediaQuery.size.height * 0.011,
//         ),
//         Align(
//           alignment:
//               AlignmentDirectional(mediaQuery.size.height * (-0.0001), 0),
//           child: Text(
//             text,
//             style: theme.textTheme.bodyMedium!.copyWith(
//               fontFamily: 'RobotoSerif',
//               color: Constant.black,
//               fontWeight: FontWeight.normal,
//               fontSize: 18.sp,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//         SizedBox(height: mediaQuery.size.height * (0.01)),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Row(
//               children: [
//                 Image.asset(
//                   'assets/images/Union.png',
//                   width: mediaQuery.size.width * 0.05,
//                 ),
//                 SizedBox(
//                   width: mediaQuery.size.height * (0.005),
//                 ),
//                 Baseline(
//                   baseline: 18.h,
//                   baselineType: TextBaseline.alphabetic,
//                   child: Text(
//                     'Lunch',
//                     style: theme.textTheme.bodyMedium!.copyWith(
//                         color: Constant.gray,
//                         fontFamily: 'Roboto',
//                         fontSize: 15.sp),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Image.asset(
//                   'assets/images/fire.png',
//                   width: mediaQuery.size.width * 0.045,
//                 ),
//                 SizedBox(
//                   width: mediaQuery.size.height * (0.005),
//                 ),
//                 Baseline(
//                   baseline: 18.h,
//                   baselineType: TextBaseline.alphabetic,
//                   child: Text.rich(
//                     TextSpan(
//                       children: [
//                         TextSpan(
//                           text: '400',
//                           style: theme.textTheme.bodyMedium!.copyWith(
//                             color: Constant.gray,
//                             fontFamily: 'Roboto',
//                             fontSize: 15.sp,
//                           ),
//                         ),
//                         TextSpan(
//                           text: ' cal',
//                           style: theme.textTheme.bodyMedium!.copyWith(
//                             color: Constant.gray,
//                             fontFamily: 'Roboto',
//                             fontSize: 14.sp,
//                           ),
//                         ),
//                       ],
//                     ),
//                     // textAlign: TextAlign.center,
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
