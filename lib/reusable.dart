import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'constant/constant.dart';



TextFormField buildLoginField(
  BuildContext context, {
  void Function(String)? onSubmit,
  required TextEditingController controller,
  required String hintText,
  bool readOnly = false,
  bool isHiddenPassword = false,
  IconButton? sufixIconBotton,
  required String? Function(String?) validator,
  required TextInputType type,
}) {
  return TextFormField(
    // autovalidateMode: AutovalidateMode.onUserInteraction,
    style: TextStyle(fontSize: 16.sp),
    readOnly: readOnly,
    onFieldSubmitted: onSubmit,
    obscureText: isHiddenPassword,
    controller: controller,
    keyboardType: type,
    validator: validator,
    decoration: InputDecoration(
      errorStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
      ),
      suffixIcon: sufixIconBotton,
      // labelText: label,
      hintText: hintText,
      hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontFamily: 'Poppins',
            fontSize: 14.sp,
            fontWeight: FontWeight.w100,
            color: Constant.fieldColorHint,
          ),
      // border: OutlineInputBorder(),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1.w),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Constant.gray),
      ),
    ),
  );
}

Future<bool?> buildshowToast({
  required String msg,
  required Color color,
}) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 13.0.sp);
}

ElevatedButton elevatedCategory(
  ThemeData theme,
  String text,
  Color backgroundColor,
  Color textColor,
) {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.r)),
    ),
    child: Text(
      text,
      style: theme.textTheme.bodyMedium!
          .copyWith(color: textColor, fontFamily: 'Sofia Pro', fontSize: 18.sp),
    ),
  );
}
