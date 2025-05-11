// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:smart_meal/core/style/app_color.dart';
// import 'package:smart_meal/module/meal_layout/cubit/cubit.dart';
// import 'package:smart_meal/module/meal_layout/data/model/meals_model.dart';

// class CustomItemMeal extends StatelessWidget {
//   const CustomItemMeal({
//     super.key,

   
//     this.boxShadow,
//     this.meal,
//   });


//   final BoxShadow? boxShadow;

//   final MealsModel? meal;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Container(
//       width: 150.w,
//       height: 145.h,

//       decoration: BoxDecoration(
//         boxShadow: boxShadow != null ? [boxShadow!] : [],
//         color: AppColor.white,
//         borderRadius: BorderRadius.circular(25.r),
//       ),
//       child: Column(
//         spacing: 2.h,
//         mainAxisAlignment: MainAxisAlignment.center,

//         children: [
//           Stack(
//             alignment: AlignmentDirectional.topEnd,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(15.r),
//                 child: Image.asset(
//                   'assets/images/m1.png',
//                   width: 135.w,
//                   height: 80.h,

//                   fit: BoxFit.cover,
//                 ),
//               ),

     
             

//                    InkWell(
//                     onTap: () {
//                       MealLayoutCubit.get(
//                         context,
//                       ).deleteFavoriteFromsaved(meal?.recipeId ?? 3);
//                     },
//                     child: CircleAvatar(
//                       backgroundColor:
//                           meal?.isFavorite ?? false
//                               ? AppColor.deepOrange
//                               : AppColor.white,
//                       child: Icon(
//                         Icons.bookmark,
//                         color:
//                             meal?.isFavorite ?? false
//                                 ? AppColor.white
//                                 : AppColor.gray,
//                       ),
//                     ),
//                   ),
                
              
//             ],
//           ),

//           SizedBox(height: 1.h),
//           Text(
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,

//             meal?.recipeName ?? 'default',
//             style: theme.textTheme.bodyMedium!.copyWith(
//               fontFamily: 'RobotoSerif',
//               color: AppColor.black,
//               fontWeight: FontWeight.normal,
//               fontSize: 13.sp,
//             ),
//             textAlign: TextAlign.center,
//           ),

//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             spacing: 10.w,
//             children: [
//               Row(
//                 spacing: 2.w,
//                 children: [
//                   Image.asset('assets/images/Union.png', height: 14.h),
//                   Baseline(
//                     baseline: 15.h,
//                     baselineType: TextBaseline.alphabetic,
//                     child: ConstrainedBox(
//                       constraints: const BoxConstraints(maxWidth: 50),

//                       child: Text(
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         meal?.type ?? 'default',
//                         // 'breakfast',
//                         style: theme.textTheme.bodyMedium!.copyWith(
//                           color: AppColor.gray,
//                           fontFamily: 'Roboto',
//                           fontSize: 12.sp,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 spacing: 2.w,
//                 children: [
//                   Image.asset('assets/images/fire.png', height: 15.h),
//                   Baseline(
//                     baseline: 15.h,
//                     baselineType: TextBaseline.alphabetic,

//                     child: ConstrainedBox(
//                       constraints: const BoxConstraints(maxWidth: 40),
//                       child: Text.rich(
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,

//                         TextSpan(
//                           text: meal?.calories100g.toString() ?? 'default',
//                           style: theme.textTheme.bodyMedium!.copyWith(
//                             color: AppColor.gray,
//                             fontFamily: 'Roboto',
//                             fontSize: 12.sp,
//                           ),
//                           children: [
//                             TextSpan(
//                               text: 'cal                     ',
//                               style: theme.textTheme.bodyMedium!.copyWith(
//                                 color: AppColor.gray,
//                                 fontFamily: 'Roboto',
//                                 fontSize: 12.sp,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
