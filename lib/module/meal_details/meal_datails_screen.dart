import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MealDatailsScreen extends StatelessWidget {
  const MealDatailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 600,
            elevation: 0,
            pinned: true,

            stretch: true,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              // centerTitle: true,
              background: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "https://media.istockphoto.com/id/814423752/photo/eye-of-model-with-colorful-art-make-up-close-up.jpg?s=2048x2048&w=is&k=20&c=KTpY1O4d7-EuX-R_GR_44Upc-n9esJOZFpcqvA4CM0E=",
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),

                  // Image.asset(images[0], fit: BoxFit.cover),
                  const Positioned(
                    top: 40,
                    left: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.close, color: Colors.black),
                    ),
                  ),
                   const Positioned(
                    top: 40,
                    right: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.bookmark_border, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding:  const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Container(color: Colors.red, height: 1000),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}


// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';

// class MealDatailsScreen extends StatelessWidget {
//   MealDatailsScreen({super.key});

//   final List<String> images = ['assets/images/m1.png', 'assets/images/m2.png'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(

          
//           children: [
//             // 1. Top Image & Icons




    //         Stack(
    //           children: [
               
    //             CachedNetworkImage(
                 
    //     imageUrl: "https://media.istockphoto.com/id/814423752/photo/eye-of-model-with-colorful-art-make-up-close-up.jpg?s=2048x2048&w=is&k=20&c=KTpY1O4d7-EuX-R_GR_44Upc-n9esJOZFpcqvA4CM0E=",
    //     placeholder: (context, url) => CircularProgressIndicator(),
    //     errorWidget: (context, url, error) => Icon(Icons.error),
    //  ),

    //             // Image.asset(images[0], fit: BoxFit.cover),
    //             Positioned(
    //               top: 40,
    //               left: 20,
    //               child: CircleAvatar(
    //                 backgroundColor: Colors.white,
    //                 child: Icon(Icons.close, color: Colors.black),
    //               ),
    //             ),
    //             Positioned(
    //               top: 40,
    //               right: 20,
    //               child: CircleAvatar(
    //                 backgroundColor: Colors.white,
    //                 child: Icon(Icons.bookmark_border, color: Colors.black),
    //               ),
    //             ),
    //           ],
    //         ),

//             // 2. Title & Tag
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Text(
//                           'Farm Fries Salad',
//                           style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Icon(Icons.wb_sunny, color: Colors.orange),
//                           SizedBox(width: 4),
//                           Text('Breakfast'),
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'Savor the perfect blend of crispy fries and fresh vegetables, all tossed in a tangy...',
//                     style: TextStyle(color: Colors.grey[600]),
//                   ),
//                 ],
//               ),
//             ),

//             // 3. Nutritional Info
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Wrap(
//                 alignment: WrapAlignment.spaceBetween,
//                 spacing: 10,
//                 runSpacing: 10,
//                 children: [
//                   _nutrientItem(Icons.local_fire_department, '120 cal'),
//                   _nutrientItem(Icons.fitness_center, '20g protein'),
//                   _nutrientItem(Icons.grain, '40g carbs'),
//                   _nutrientItem(Icons.cake_outlined, '0g sugar'),
//                   _nutrientItem(Icons.opacity, '5g fats'),
//                 ],
//               ),
//             ),

//             // 4. Tabs (Fake Tab Bar)
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.orange,
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       child: Center(
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 10),
//                           child: Text(
//                             'Ingredients',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   Expanded(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.grey[200],
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       child: Center(
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 10),
//                           child: Text('Instructions'),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // 5. Ingredient List
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 children: [
//                   _ingredientItem('50g of red onions', true),
//                   _ingredientItem('1/2 tsp of salt', true),
//                   _ingredientItem('200g of farm fries', false),
//                   _ingredientItem('100g of tomatoes', false),
//                 ],
//               ),
//             ),

//             // 6. Add To Cart
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.orange,
//                   minimumSize: Size(double.infinity, 50),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 onPressed: () {},
//                 child: Text('Add To Cart'),
//               ),
//             ),

//             // 7. Related Recipes
//             _recipeSection('Related Recipes'),

//             // 8. Recommended Recipes
//             _recipeSection('Recommended Recipes'),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _nutrientItem(IconData icon, String text) {
//     return Container(
//       padding: EdgeInsets.all(10),
//       width: 100,
//       decoration: BoxDecoration(
//         color: Colors.grey[100],
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Column(
//         children: [
//           Icon(icon, color: Colors.orange),
//           SizedBox(height: 8),
//           Text(text),
//         ],
//       ),
//     );
//   }

//   Widget _ingredientItem(String text, bool selected) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 12),
//       decoration: BoxDecoration(
//         color: selected ? Colors.orange : Colors.grey[200],
//         borderRadius: BorderRadius.circular(12),
//       ),
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(vertical: 14),
//       alignment: Alignment.center,
//       child: Text(
//         text,
//         style: TextStyle(
//           color: selected ? Colors.white : Colors.black,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     );
//   }

//   Widget _recipeSection(String title) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Text(
//               title,
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ),
//           SizedBox(height: 8),
//           SizedBox(
//             height: 130,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: 5,
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               itemBuilder:
//                   (context, index) => Container(
//                     margin: EdgeInsets.only(right: 12),
//                     width: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       borderRadius: BorderRadius.circular(20),
//                       image: DecorationImage(
//                         image: AssetImage(images[1]),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
