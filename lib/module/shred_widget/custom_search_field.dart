import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/extention/extention.dart';
import 'package:smart_meal/generated/l10n.dart';
import '../../core/ui/style/app_color.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key, required this.onChanged});
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(
        left: mediaQuery.size.width * 0.06,
        right: mediaQuery.size.width * 0.06,
      ),

      child: TextField(
        onChanged: onChanged,

        decoration: InputDecoration(
          hintText: S.of(context).search,
          hintStyle: TextStyle(
            color: context.isDark ? AppColor.steelBlueGray : AppColor.gray,
          ),
          prefixIcon: Icon(
            Icons.search,

            color:
                context.isDark
                    ? AppColor.skyBlue
                    : AppColor.black.withValues(alpha: 0.7),

            size: 22.w,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: context.isDark ? AppColor.black : AppColor.white,

          // isCollapsed: true,
        ),
      ),
    );
  }
}
