// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/extention/extention.dart';
import 'package:smart_meal/core/ui/style/app_color.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/home/widget/home_section1.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/home/widget/sec4/home_section4.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/home/widget/search_by_ingrediant_section.dart';

import 'widget/category_meal_section.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          color:
              context.isDark
                  ? AppColor.black
                  : AppColor.scaffoldBackgroundheavy,
        ),
        margin: EdgeInsets.only(
          left: mediaQuery.size.width * 0.02,
          right: mediaQuery.size.width * 0.02,
          top: mediaQuery.size.height * 0.02,
        ),
        padding: EdgeInsets.only(
          left: mediaQuery.size.width * 0.02,
          right: mediaQuery.size.width * 0.02,
          top: mediaQuery.size.height * 0.01,
        ),
        child: ListView(
          children: [
            // Section 1 - Top section
            const HomeSection1(),

            SizedBox(height: 20.h), // Spacing between sections
            // Section 2 - Search by ingredient
            const SearchByIngrediantSection(),

            SizedBox(height: 20.h), // Spacing between sections
            // Section 3 - Categories
            const CategoryMealSection(),

            SizedBox(height: 20.h), // Spacing between sections
            // Section 4
            const HomeSection4(),

            // Section 5 - Bottom section
            // const HomeSection5(),

            // Add bottom padding if needed
          ],
        ),
      ),
    );
  }
}











// // ignore_for_file: deprecated_member_use


// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:smart_meal/core/style/app_color.dart';
// import 'package:smart_meal/module/meal_layout/layout_screens/home/widget/home_section4.dart';
// import 'package:smart_meal/module/meal_layout/layout_screens/home/widget/home_section5.dart';
// import 'package:smart_meal/module/meal_layout/layout_screens/home/widget/home_section1.dart';
// import 'package:smart_meal/module/meal_layout/layout_screens/home/widget/search_by_ingrediant_section.dart';

// import 'widget/category_meal_section.dart';

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final MediaQueryData mediaQuery = MediaQuery.of(context);

//     return SingleChildScrollView(
     
//       child: Container(
//         height: mediaQuery.size.height * 2.48,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20.r),
//             topRight: Radius.circular(20.r),
//           ),
//           color: AppColor.scaffoldBackgroundheavy,
//         ),
//         margin: EdgeInsets.only(
//           left: mediaQuery.size.width * 0.02,
//           right: mediaQuery.size.width * 0.02,
//           top: mediaQuery.size.height * 0.02,
//         ),
//         padding: EdgeInsets.only(
//           left: mediaQuery.size.width * 0.02,
//           right: mediaQuery.size.width * 0.02,
//           top: mediaQuery.size.height * 0.02,
//         ),
//         child: Stack(
//           children: [
//             ///1
//             const HomeSection1(),
//             // const SizedBox(height: 20),

//             // 2
//             Transform.translate(
//               offset: Offset(0, 200.h),

//               child: const SearchByIngrediantSection(),
//             ),

//             // ////3
//             // const SizedBox(height: 20),
//             Transform.translate(
//               offset: Offset(0, 592.h),

//               child: const CategoryMealSection(),
//             ),
//             // const SizedBox(height: 20),

//             // ////4
//             Transform.translate(
//               offset: Offset(0, 900.h),
//               child: const HomeSection4(),
//             ),
//             // ////5
//             // const SizedBox(height: 20),
//             Transform.translate(
//               offset: Offset(0, 1250.h),
//               child: const HomeSection5(),
//             ),
//             // SizedBox(height: mediaQuery.size.height * 0.02),
//           ],
//         ),
//       ),
//     );
//   }
// }
