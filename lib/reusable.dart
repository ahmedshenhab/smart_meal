import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'constant/constant.dart';

Stack buildHome1(BuildContext context) {
  return Stack(alignment: const AlignmentDirectional(-0.9, -0.3), children: [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Container(
        width: double.infinity,
        height: 250,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
        ),
        child: Container(
          // width: 288,
          // height: 248,
          decoration: const BoxDecoration(
            image: DecorationImage(
              // fit: BoxFit.fitHeight,
              alignment: AlignmentDirectional(1.3, 0),
              image: AssetImage('assets/images/main_image.png'),
            ),
          ),
        ),
      ),
    ),
    Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Text('   Searching For\n   a Mail ?',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyMedium!),
        const SizedBox(
          height: 10,
        ),
        Text('Let US Cock\nFor You',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Constant.brown,
                )),
        const SizedBox(
          height: 25,
        ),
      ],
    ),
    Positioned(
      top: 194,
      left: 20,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(6),
          minimumSize: const Size(0, 0),
          backgroundColor: Constant.deepOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text(
          'Search with Ingredients',
          style:
              TextStyle(color: Colors.white, fontFamily: 'Ranga', fontSize: 17),
        ),
      ),
    ),
  ]);
}

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

// TextFormField buildtextFormField({
//   void Function(String)? onSubmit,
//   required TextEditingController controller,
//   required String label,
//   bool readOnly = false,
//   bool isHiddenPassword = false,
//   required IconData prefixIcon,
//   IconButton? sufixIconBotton,
//   required String? Function(String?) validator,
//   required TextInputType type,
// }) =>
//     TextFormField(
//       readOnly: readOnly,
//       onFieldSubmitted: onSubmit,
//       obscureText: isHiddenPassword,
//       style: const TextStyle(),
//       controller: controller,
//       keyboardType: TextInputType.emailAddress,
//       validator: validator,
//       decoration: InputDecoration(
//           constraints: const BoxConstraints(minHeight: 0),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           labelText: label,
//           prefixIcon: Icon(prefixIcon),
//           suffixIcon: sufixIconBotton),
//     );
