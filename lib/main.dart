import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/style/meal_theme.dart';
import 'package:smart_meal/module/meal_details/meal_datails_screen.dart';
// i ahmed shenhab

import 'core/observer/observer.dart';

//// ahmed

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: MealTheme.lighTheme,
        home: const MealDatailsScreen(),
      ),
    );
  }
}

// class FoodCategoryToggle extends StatefulWidget {
//   @override
//   _FoodCategoryToggleState createState() => _FoodCategoryToggleState();
// }

// class _FoodCategoryToggleState extends State<FoodCategoryToggle> {
//   String selectedCategory = 'Breakfast';

//   List<String> categoryMeal = ['Breakfast', 'Lunch', 'Dinner'];

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: categoryMeal
//           .map(
//             (e) => InkWell(
//               onTap: () {
//                 log(selectedCategory + 'befor');
//                 setState(() {
//                   selectedCategory = e;
//                 });
//                 log(selectedCategory);
//               },
//               child: Container(
                
//                 padding: EdgeInsets.all(5),
//                 decoration: BoxDecoration(
                  
//                     color: selectedCategory == e ? Colors.orange : Colors.white,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Text(e),
//               ),
//             ),
//           )
//           .toList(),
//     ));
//   }

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

