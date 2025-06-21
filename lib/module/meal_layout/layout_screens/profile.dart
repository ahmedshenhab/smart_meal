import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/extention/extention.dart';
import 'package:smart_meal/core/ui/style/app_color.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/profile/allergies.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/profile/widget/account.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/profile/widget/disease.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/image_profile.png', fit: BoxFit.fitHeight),

        Align(
          alignment: Alignment.bottomCenter,

          child: Container(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
            decoration: BoxDecoration(
              color: context.isDark ? Colors.black : Colors.white,

              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.6,
            child: ListView(
              children: const [Account(), Allergies(), Disease()],
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
  required BuildContext context,

  void Function(String)? onChanged,
}) {
  return Container(
    margin: EdgeInsetsDirectional.only(
      bottom: 10.h,
      top: 10.h,
      start: 6.w,
      end: 6.w,
    ),

    child: TextFormField(
      onChanged: onChanged,
      readOnly: readOnly,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w),

        fillColor: context.isDark ? AppColor.blackLight : AppColor.fieldColor,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}
