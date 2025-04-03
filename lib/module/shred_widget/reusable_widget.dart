import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_meal/core/network/local/shared_pref/cach_helper.dart';
import '../login/Meal_login_screen.dart';


TextButton buildTextbutton({
  required String text,
  required void Function()? onPressed,
}) =>
    TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ));
TextFormField buildtextFormField({
  void Function(String)? onSubmit,
  required TextEditingController controller,
  required String label,
  bool readOnly = false,
  bool isHiddenPassword = false,
  required IconData prefixIcon,
  IconButton? sufixIconBotton,
  required String? Function(String?) validator,
  required TextInputType type,
}) =>
    TextFormField(
      readOnly: readOnly,
      onFieldSubmitted: onSubmit,
      obscureText: isHiddenPassword,
      style: const TextStyle(),
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      validator: validator,
      decoration: InputDecoration(
          constraints: const BoxConstraints(minHeight: 0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: label,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: sufixIconBotton),
    );

MaterialButton buildmaterialbutton({
  required void Function()? onPressed,
  required Widget child,
}) {
  return MaterialButton(
    color: Colors.blue,
    height: 40,
    onPressed: onPressed,
    child: child,
  );
}

Future<bool?> buildshowToast({
  required String msg,
  required Color color,
}) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}

void buildSignOut({required BuildContext context}) {
  CachHelper.removeData(key: 'token').then(
    (value) {
      if (value && context.mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const MealLoginScreen(),
          ),
          (route) => false,
        );
      }
    },
  );
}

void buildPrintFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach(
        (match) => log(match.group(0).toString()),
      );
}

Widget buildHashTag(BuildContext context, String text) {
  return
      // ignore: sized_box_for_whitespace
      Container(
    padding: const EdgeInsetsDirectional.only(end: 6),
    height: 20,
    child: MaterialButton(
      minWidth: 1,
      padding: EdgeInsets.zero,
      onPressed: () {},
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 13.7, color: Colors.blue, height: 1.4),
      ),
    ),
  );
}
