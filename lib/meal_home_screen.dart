// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:smart_meal/constant/constant.dart';
// import 'reusable.dart';

// class MealHomeScreen extends StatelessWidget {
//   const MealHomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Scaffold(
//       backgroundColor: Constant.scaffoldBackgroundheavy,
//       body: SingleChildScrollView(
//         // physics: BouncingScrollPhysics(),
//         child: Padding(
//           padding: const EdgeInsets.only(
//             left: 10,
//             right: 10,
//             top: 50,
//             bottom: 50,
//           ),
//           child: Container(
//             height: 2250,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: Constant.scaffoldBackgroundLight,
//               borderRadius: BorderRadius.circular(25),
//             ),
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.start,
//               // crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 ///1
//                 buildHome1(context),
//                 SizedBox(
//                   height: 20,
//                 ),

//                 //2
//                 Container(
//                   width: double.infinity,
//                   height: 435,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                     color: Constant.brownBurn,
//                   ),
//                   child: buildElemt2(context, theme),
//                 ),

//                 ////3
//                 ///
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   width: double.infinity,
//                   height: 480,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                     color: Constant.white,
//                   ),
//                   child: Column(
//                     // mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: 35,
//                       ),
//                       Text(
//                         "Recipes By Categories",
//                         style: theme.textTheme.bodyMedium!
//                             .copyWith(color: Constant.black),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "For Everytime",
//                         style: theme.textTheme.bodyMedium!
//                             .copyWith(color: Colors.brown),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           buildStackCategory3(theme, 'Breackfat',
//                               'assets/images/breakFast.png'),
//                           buildStackCategory3(
//                               theme, 'lunch', 'assets/images/lunch.png'),
//                           buildStackCategory3(
//                               theme, 'dinner', 'assets/images/dinner.png'),
//                         ],
//                       ),
//                     ],
//                   ),
//                 )

// ////4

//                 ,
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   width: double.infinity,
//                   height: 480,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                     color: Constant.brownBurn,
//                   ),
//                   child: Column(
//                     // mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: 35,
//                       ),
//                       Text(
//                         "Made Just  For You",
//                         style: theme.textTheme.bodyMedium!.copyWith(
//                           color: Constant.white,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "Recommended Meals",
//                         style: theme.textTheme.bodyMedium!
//                             .copyWith(color: Colors.deepOrange),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           buildRecomended(
//                               theme,
//                               'salad farm fries',
//                               Constant.deepOrange,
//                               Constant.white,
//                               'assets/images/meal2.png'),
//                           buildRecomended(
//                               theme,
//                               'Fried Chicken',
//                               Constant.white,
//                               Constant.saveColor,
//                               'assets/images/meal1.png')
//                         ],
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       InkWell(
//                         onTap: () {},
//                         child: Image.asset(
//                           'assets/images/elevatebottun.png',
//                           width: 250,
//                           height: 30,
//                           fit: BoxFit.cover,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),

// ////5

//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   width: double.infinity,
//                   height: 480,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                     color: Constant.white,
//                   ),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 35,
//                       ),
//                       Text(
//                         "Top Rated Meals",
//                         style: theme.textTheme.bodyMedium!.copyWith(
//                           color: Constant.black,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "Updated Everyday",
//                         style: theme.textTheme.bodyMedium!
//                             .copyWith(color: Colors.brown),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           buildRecomended(
//                             theme,
//                             'salad farm fries',
//                             Constant.deepOrange,
//                             Constant.white,
//                             'assets/images/meal2.png',
//                             boxShadow: BoxShadow(
//                               color: Constant.shadow.withOpacity(0.25),
//                               spreadRadius: 5,
//                               blurRadius: 4,
//                               offset: Offset(0, 5),
//                             ),
//                           ),
//                           buildRecomended(
//                             theme,
//                             'Fried Chicken',
//                             Constant.white,
//                             Constant.saveColor,
//                             'assets/images/meal1.png',
//                             boxShadow: BoxShadow(
//                               color: Constant.shadow.withOpacity(0.25),
//                               spreadRadius: 5,
//                               blurRadius: 4,
//                               offset: Offset(0, 5),
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       InkWell(
//                         onTap: () {},
//                         child: Image.asset(
//                           'assets/images/elevatebottun.png',
//                           width: 250,
//                           height: 30,
//                           fit: BoxFit.cover,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildRecomended(
//       ThemeData theme, String text, Color color1, Color color2, String image,
//       {BoxShadow? boxShadow}) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//       child: Container(
//         width: 170,
//         height: 190,
//         decoration: BoxDecoration(
//             boxShadow: boxShadow != null ? [boxShadow] : [],
//             color: Constant.white,
//             borderRadius: BorderRadius.circular(25)),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 2,
//             ),
//             Stack(
//               alignment: AlignmentDirectional(0.8, -.8),
//               children: [
//                 Container(
//                   width: 180,
//                   height: 100,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: AssetImage(
//                       image,
//                     ),
//                   )),
//                 ),
//                 Container(
//                   width: 37,
//                   height: 37,
//                   decoration: BoxDecoration(
//                       color: color1, borderRadius: BorderRadius.circular(30)),
//                   child: Icon(
//                     color: color2,
//                     Icons.bookmark,
//                     size: 25,
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 6,
//             ),
//             Align(
//               alignment: AlignmentDirectional(-0.4, 0),
//               child: Text(
//                 text,
//                 style: theme.textTheme.bodyMedium!.copyWith(
//                   fontFamily: 'RobotoSerif',
//                   color: Constant.black,
//                   fontWeight: FontWeight.normal,
//                   fontSize: 18,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             SizedBox(
//               height: 2,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Row(
//                   children: [
//                     Image.asset(
//                       'assets/images/Union.png',
//                       width: 20,
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     Baseline(
//                       baseline: 22,
//                       baselineType: TextBaseline.alphabetic,
//                       child: Text(
//                         'Lunch',
//                         style: theme.textTheme.bodyMedium!.copyWith(
//                             color: Constant.gray,
//                             fontFamily: 'Roboto',
//                             fontSize: 15),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Image.asset(
//                       'assets/images/fire.png',
//                       width: 18,
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     Baseline(
//                       baseline: 22,
//                       baselineType: TextBaseline.alphabetic,
//                       child: Text.rich(
//                         TextSpan(
//                           children: [
//                             TextSpan(
//                               text: '400',
//                               style: theme.textTheme.bodyMedium!.copyWith(
//                                 color: Constant.gray,
//                                 fontFamily: 'Roboto',
//                                 fontSize: 15,
//                               ),
//                             ),
//                             TextSpan(
//                               text: ' cal',
//                               style: theme.textTheme.bodyMedium!.copyWith(
//                                 color: Constant.gray,
//                                 fontFamily: 'Roboto',
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ],
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 7,
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildStackCategory3(
//     ThemeData theme,
//     String text,
//     String image,
//   ) {
//     return Stack(
//       // alignment: Alignment(-0.5, 0.7),
//       children: [
//         Container(
//           width: 110,
//           height: 230,
//           decoration: BoxDecoration(
//               image: DecorationImage(
//             fit: BoxFit.cover,
//             image: AssetImage(
//               image,
//             ),
//           )),
//         ),
//         Positioned(
//           bottom: 1.9,
//           left: 17,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 text,
//                 style: theme.textTheme.bodyMedium!
//                     .copyWith(color: Constant.white, fontSize: 15),
//                 textAlign: TextAlign.center,
//               ),
//               Text(
//                 "150+ recipe",
//                 style: theme.textTheme.bodyMedium!
//                     .copyWith(color: Constant.categoriesColor, fontSize: 10),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// Widget buildElemt2(BuildContext context, ThemeData theme) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     // crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       Text(
//         "Don't Know What To Cook?",
//         style: theme.textTheme.bodyMedium!.copyWith(color: Colors.white),
//         textAlign: TextAlign.center,
//       ),
//       SizedBox(height: 8),
//       Text('Search With Ingredients',
//           style:
//               theme.textTheme.bodyMedium!.copyWith(color: Constant.deepOrange)),
//       SizedBox(height: 20),
//       Container(
//         // padding: EdgeInsets.all(20),
//         width: 308,
//         height: 270,

//         decoration: BoxDecoration(
//           color: Constant.white,
//           borderRadius: BorderRadius.circular(30),
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 'Your Ingredients',
//                 style: theme.textTheme.bodyMedium!
//                     .copyWith(color: Constant.brown, fontSize: 20),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 16),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Constant.fieldColor,
//                     prefixIcon: Icon(Icons.search,
//                         color: Constant.fieldHintSearchColor),
//                     hintText: 'Search for Ingredient...',
//                     hintStyle: theme.textTheme.bodyMedium!.copyWith(
//                         fontFamily: 'Roboto',
//                         fontSize: 14,
//                         color: Constant.fieldHintSearchColor),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(50),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16),
//               Wrap(
//                 spacing: 10,
//                 runSpacing: 10,
//                 children: [
//                   _buildIngredientButton2('Meat', theme),
//                   _buildIngredientButton2('Vegetables', theme),
//                   _buildIngredientButton2('water', theme),
//                   _buildIngredientButton2('Dry Ingredients', theme),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     ],
//   );
// }

// Widget _buildIngredientButton2(String label, ThemeData theme) {
//   return ElevatedButton.icon(
//     onPressed: () {},
//     icon: Icon(Icons.search, color: Constant.resuiltIconSearchColor),
//     label: Text(label,
//         textAlign: TextAlign.center,
//         maxLines: 1,
//         style: theme.textTheme.bodyMedium!
//             .copyWith(fontSize: 13, color: Constant.resuiltIconSearchColor)),
//     style: ElevatedButton.styleFrom(
//       // fixedSize: Size.lerp(Size.fromWidth(4), Size.fromWidth(20), 2),
//       backgroundColor: Colors.grey.shade100,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(50),
//       ),
//       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//     ),
//   );
// }

// //  GridView.builder(
// //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                   crossAxisCount: 2,
// //                   crossAxisSpacing: 10,
// //                   mainAxisSpacing: 10,
// //                 ),
// //                 itemCount: _filteredIngredients.length,
// //                 itemBuilder: (context, index) {
// //                   return Container(
// //                     decoration: BoxDecoration(
// //                       color: Colors.brown.shade100,
// //                       borderRadius: BorderRadius.circular(8.0),
// //                     ),
// //                     child: Center(
// //                       child: Text(
// //                         _filteredIngredients[index],
// //                         style: TextStyle(
// //                             fontSize: 16, fontWeight: FontWeight.bold),
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
