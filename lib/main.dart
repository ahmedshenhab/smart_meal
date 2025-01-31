import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constant/constant.dart';
import 'constant/observer.dart';
import 'data/network/local/shared_pref/cach_helper.dart';
import 'firebase_options.dart';
import 'module/login/meal_login_screen.dart';
import 'module/meal_layout/meal_layout.dart';

//// ahmed

void main() async {
  late Widget startWidget;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  await CachHelper.init;
  if (Constant.uId != null) {
    log('uid from main = ${Constant.uId}');
    startWidget = const MealLayout();
  } else {
    log('uid from main= ${Constant.uId}');

    startWidget = const MealLoginScreen();
  }
  // SystemChrome.setEnabledSystemUIMode(
  //   SystemUiMode.immersive,
  // );
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor:  Colors.transparent, // Set the status bar color
  //   statusBarIconBrightness: Brightness.dark, // For white icons
  // ));

  runApp(MyApp(
    startWidget: startWidget,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.startWidget});
  final Widget startWidget;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: Constant.lighTheme,
        // home: startWidget
        home: const MealLayout(),
      ),
    );
  }
}

// class IngredientSearchScreen extends StatefulWidget {
//   @override
//   _IngredientSearchScreenState createState() => _IngredientSearchScreenState();
// }

// class _IngredientSearchScreenState extends State<IngredientSearchScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   final List<String> _ingredients = [
//     'Chicken',
//     'Beef',
//     'Carrots',
//     'Tomatoes',
//     'Milk',
//     'Flour',
//     'Sugar',
//     'Potatoes',
//     'Fish'
//   ];

//   String _selectedCategory = 'All';
//   List<String> _filteredIngredients = [];

//   @override
//   void initState() {
//     super.initState();
//     _filteredIngredients = _ingredients;
//   }

//   void _filterIngredients(String query) {
//     List<String> results = [];
//     if (query.isEmpty && _selectedCategory == 'All') {
//       results = _ingredients;
//     } else {
//       results = _ingredients.where((ingredient) {
//         bool matchesQuery =
//             ingredient.toLowerCase().contains(query.toLowerCase());
//         bool matchesCategory = _selectedCategory == 'All' ||
//             (_selectedCategory == 'Meat' &&
//                 ['Chicken', 'Beef', 'Fish'].contains(ingredient)) ||
//             (_selectedCategory == 'Vegetables' &&
//                 ['Carrots', 'Tomatoes', 'Potatoes'].contains(ingredient)) ||
//             (_selectedCategory == 'Wet' && ['Milk'].contains(ingredient)) ||
//             (_selectedCategory == 'Dry' &&
//                 ['Flour', 'Sugar'].contains(ingredient));
//         return matchesQuery && matchesCategory;
//       }).toList();
//     }

//     setState(() {
//       _filteredIngredients = results;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your Ingredients'),
//         backgroundColor: Colors.brown,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Search Bar
//             TextField(
//               controller: _searchController,
//               onChanged: (value) => _filterIngredients(value),
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.search),
//                 hintText: 'Search for Ingredient...',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),

//             // Category Filters
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   _buildCategoryButton('All'),
//                   _buildCategoryButton('Meat'),
//                   _buildCategoryButton('Vegetables'),
//                   _buildCategoryButton('Wet'),
//                   _buildCategoryButton('Dry'),
//                 ],
//               ),
//             ),
//             SizedBox(height: 16),

//             // Filtered Ingredients Grid
//             Expanded(
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                 ),
//                 itemCount: _filteredIngredients.length,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     decoration: BoxDecoration(
//                       color: Colors.brown.shade100,
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     child: Center(
//                       child: Text(
//                         _filteredIngredients[index],
//                         style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCategoryButton(String category) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor:
//             _selectedCategory == category ? Colors.brown : Colors.grey,
//       ),
//       onPressed: () {
//         setState(() {
//           _selectedCategory = category;
//           _filterIngredients(_searchController.text);
//         });
//       },
//       child: Text(category),
//     );
//   }
// }
