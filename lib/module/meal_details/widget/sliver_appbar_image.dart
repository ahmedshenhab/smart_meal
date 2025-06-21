import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/module/meal_details/cubit/meal_detail_cubit.dart';
import '../../../core/ui/style/app_color.dart';

class SliverAppbarImage extends StatelessWidget {
  const SliverAppbarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 350.h,
      surfaceTintColor: Colors.blue,

      backgroundColor: AppColor.deepOrange.withValues(alpha: 0.5),

      flexibleSpace: FlexibleSpaceBar(
        background:
            MealDetailCubit.get(context).mealsModel.imageUrl == null ||
                    MealDetailCubit.get(context).mealsModel.imageUrl == ''
                ? Image.asset('assets/images/m1.png')
                : CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl:
                      MealDetailCubit.get(context).mealsModel.imageUrl ?? '',
                  placeholder:
                      (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                  errorWidget:
                      (context, url, error) =>
                          const Center(child: Icon(Icons.error)),
                ),
      ),
    );
  }
}
