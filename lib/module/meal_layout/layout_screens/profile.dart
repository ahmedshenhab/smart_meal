import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/profile/allergies.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/profile/widget/account.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/profile/widget/disease.dart';
import '../../../core/style/app_color.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Stack(
      children: [
        Image.asset('assets/images/image_profile.png', fit: BoxFit.fitHeight),

        Positioned(
          top: 25.h,
          right: 10.w,
          child: Container(
            alignment: Alignment.center,
            width: 40.w,
            height: 50.h,
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: AppColor.deepOrange,

              borderRadius: BorderRadius.circular(10.r),
            ),

            child: Icon(Icons.edit_outlined, color: AppColor.white, size: 30.w),
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,

          child: Container(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
            decoration: const BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.6,
            child: ListView(
              children: const [
                // account
                Account(),

                //allergy
                Allergies(),
                // disease
                Disease(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget buildTextField(
  TextEditingController controller, {
  bool readOnly = true,

  void Function(String)? onChanged,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    margin: EdgeInsets.only(bottom: 12.h, top: 5.h, left: 5.w, right: 5.w),
    decoration: BoxDecoration(
      color: const Color(0xFFF0F0F0),
      borderRadius: BorderRadius.circular(30),
    ),

    child: TextFormField(
      onChanged: onChanged,
      readOnly: readOnly,
      controller: controller,
      decoration: const InputDecoration(border: InputBorder.none),
    ),
  );
}
