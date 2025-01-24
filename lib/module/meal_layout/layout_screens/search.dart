// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:smart_meal/constant/constant.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/home.dart';

import '../../../reusable.dart';
import 'package:side_sheet/side_sheet.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    List<String> images = [
      'assets/images/m1.png',
      'assets/images/m2.png',
    ];
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
          ),

          //search
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: SizedBox(
              width: 322,
              height: 55,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search, color: Constant.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Constant.white,
                ),
              ),
            ),
          ),

          Transform.translate(
            offset: Offset(130, 25),
            child: InkWell(
              // focusColor: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                // way by showModalBottomSheet
                // showModalBottomSheet(
                //   isScrollControlled: true,
                //   useSafeArea: true,
                //   context: context,
                //   builder: (context) => filtersModal(),
                // );

// way by navigation

                // Navigator.of(context).push(PageRouteBuilder(
                //     opaque: false,
                //     pageBuilder: (context, animation, secondaryAnimation) =>
                //         SlideTransition(
                //           position: animation.drive(
                //             Tween(begin: Offset(1, 0), end: Offset(0, 0))
                //                 .chain(CurveTween(curve: Curves.easeInOut)),
                //           ),
                //           child: SideSheet(filtersModal()),
                //         )));

                // /// by dialog

                // showDialog(
                //   context: context,
                //   builder: (context) {
                //     return Align(
                //       alignment:
                //           Alignment.centerLeft, // أو Alignment.centerRight
                //       child: Container(
                //           width: MediaQuery.of(context).size.width * 0.8,
                //           height: double.infinity,
                //           color: Colors.white,
                //           child: filtersModal()),
                //     );
                //   },
                // );

                SideSheet.right(
                    body: filtersModal(context),
                    context: context,
                    transitionDuration: Duration(milliseconds: 230));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'More Filters',
                    style: theme.textTheme.bodyMedium!.copyWith(
                        color: Constant.frannyColor,
                        fontFamily: 'Inter',
                        fontSize: 14.7),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Icon(
                    Icons.filter_list,
                    size: 16,
                  )
                ],
              ),
            ),
          ),

          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              elevatedCategory(
                theme,
                'BreakFast',
                Constant.deepOrange,
                Constant.white,
              ),
              elevatedCategory(
                theme,
                'Lunch',
                Constant.white,
                Constant.black,
              ),
              elevatedCategory(
                theme,
                'Dinner',
                Constant.white,
                Constant.black,
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),

          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return buildRecomended(
                theme,
                'salad farm fries',
                Constant.deepOrange,
                Constant.white,
                images[1],
              );
            },
          ),
        ],
      ),
    );
  }
}

filtersModal(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Filters',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: 'cambria', fontSize: 25, color: Constant.black)),
        SizedBox(height: 40),
        _buildSlider('Calories', '0 calorie - 5000 calories', 0, 5000, context),
        _buildSlider('Protein', '0 gram - 5000 grams', 0, 5000, context),
        _buildSlider('Sugar', '0 gram - 5000 grams', 0, 5000, context),
        _buildSlider('Fats', '0 gram - 5000 grams', 0, 5000, context),
        _buildSlider('Carbs', '0 gram - 5000 grams', 0, 5000, context),
      ],
    ),
  );
}

Widget _buildSlider(
    String label, String labe2, double min, double max, BuildContext context) {
  return Column(
    // crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontFamily: 'cambria', fontSize: 25, color: Constant.black)),
      SizedBox(
        height: 5,
      ),
      Text(labe2,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontFamily: 'cambria', fontSize: 20, color: Constant.black)),
      Slider(
        value: min,
        onChanged: (value) {},
        min: min,
        max: max,
        inactiveColor: Constant.deepOrange,
        activeColor: Constant.saveColor,
      ),
    ],
  );
}
