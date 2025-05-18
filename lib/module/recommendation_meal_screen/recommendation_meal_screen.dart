import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/module/category_screen/widget/more_filter_category.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/home/widget/custom_item_meal_recomendation.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/home/widget/home_section4.dart';
import 'package:smart_meal/module/recommendation_meal_screen/cubit/recommendation_cubit.dart';
import 'package:smart_meal/module/shred_widget/custom_search_field.dart';
import '../../core/style/app_color.dart';



class RecommendationMealScreen extends StatelessWidget {
  const RecommendationMealScreen({super.key});
  static const recommendationMealScreen = '/recommendationMealScreen';

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: const Text(''),
        actionsPadding: EdgeInsetsDirectional.only(end: 10.w),
      
      ),
      body: Column(
        children: [
          SizedBox(height: mediaQuery.size.height * 0.01),
           CustomSearchField(onChanged: (p0) {
            
          },),
          SizedBox(height: mediaQuery.size.height * 0.02),

          //more filters
          const MoreFilterCategory(),
          SizedBox(height: mediaQuery.size.height * 0.033),

          BlocBuilder<RecommendationCubit, RecommendationStates >(
            builder: (context, state) {
              return Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                    color: AppColor.white,
                  ),
                  padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 7.h),
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(0),

                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,

                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 20.h,
                    ),
                    itemCount: 12,
                    itemBuilder:
                        (context, index) => InkWell(
                          onTap: () {
                            // Navigator.pushNamed(
                            //   arguments: state.meals[index],
                            //   context,
                            //   MealDetailsScreen.mealDetailsScreen,
                            // );
                          },
                          child: CustomItemMealRecomendation(
                            searchByMealResponseModel: fack,
                                                    
                            boxShadow: BoxShadow(
                              offset: const Offset(0, 5),
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 15,
                                                    
                              spreadRadius: 5,
                            ),
                          ),
                        ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
