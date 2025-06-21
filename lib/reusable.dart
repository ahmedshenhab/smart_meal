import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/extention/extention.dart';
import 'core/ui/style/app_color.dart';
import 'package:fluttertoast/fluttertoast.dart';

TextFormField buildCustomField(
  BuildContext context, {
  void Function(String)? onSubmit,
  required TextEditingController controller,
  String? hintText,
  required String labelText,
  bool readOnly = false,
  bool isHiddenPassword = false,
  Widget? sufixIconBotton,
  required String? Function(String?) validator,
  TextInputType? type,
}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.disabled,

    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, height: 0),

    readOnly: readOnly,
    onFieldSubmitted: onSubmit,
    obscureText: isHiddenPassword,
    controller: controller,
    keyboardType: type ?? TextInputType.none,
    validator: validator,
    decoration: InputDecoration(
      errorMaxLines: 3,

      errorStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
        color: AppColor.primary,

        overflow: TextOverflow.ellipsis,
      ),
      suffixIcon: sufixIconBotton,

      // hintText: hintText,
      alignLabelWithHint: true,

      floatingLabelBehavior: FloatingLabelBehavior.never,
      labelText: labelText,

      labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontFamily: 'Poppins',
        fontSize: 13.sp,
        fontWeight: FontWeight.w100,
        color: context.isDark ? AppColor.grayTone : AppColor.fieldColorHint,
      ),

      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColor.deepOrange, width: 1.w),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColor.deepOrange, width: 1.w),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1.w),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColor.gray),
      ),
    ),
  );
}

Future<bool?> buildshowToast( {required String msg, required Color color}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 13.0.sp,
  );
}
