import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'core/constant/constant.dart';

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
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 13.0.sp);
}

Widget elevatedCategory(
  ThemeData theme,
  
) {
  List<String> categorys = ['Breakfast', 'Lunch', 'Dinner'];
  String selectedCategory = categorys[1];

  return Row(
    children: categorys
        .map((e) => ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    selectedCategory == e ? Colors.orange : Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.r)),
              ),
              child: Text(
                e,
                style: theme.textTheme.bodyMedium!.copyWith(
                    color: selectedCategory == e ? Colors.white : Colors.black,
                    fontFamily: 'Sofia Pro',
                    fontSize: 18.sp),
              ),
            ))
        .toList(),
  );
}

Widget buildRecomended(
    ThemeData theme, String text, Color color1, Color color2, String image,
    {BoxShadow? boxShadow, required MediaQueryData mediaQuery}) {
  /// you can wrap the contaner with card and details
  // shape: RoundedRectangleBorder(
  // borderRadius: BorderRadius.circular(25),
  // ),

  return Container(
    width: mediaQuery.size.width * 0.455,
    height: mediaQuery.size.height * 0.28,
    decoration: BoxDecoration(
        boxShadow: boxShadow != null ? [boxShadow] : [],
        color: Constant.white,
        borderRadius: BorderRadius.circular(25.r)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional(
            mediaQuery.size.width * 0.0024,
            mediaQuery.size.height * -0.0011,
          ),
          children: [
            Container(
              height: mediaQuery.size.height * 0.137,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  image,
                ),
              )),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: mediaQuery.size.width * 0.1,
                height: mediaQuery.size.height * 0.047,
                decoration: BoxDecoration(
                    color: color1, borderRadius: BorderRadius.circular(30)),
                child: Icon(
                  color: color2,
                  Icons.bookmark,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: mediaQuery.size.height * 0.011,
        ),
        Align(
          alignment:
              AlignmentDirectional(mediaQuery.size.height * (-0.0001), 0),
          child: Text(
            text,
            style: theme.textTheme.bodyMedium!.copyWith(
              fontFamily: 'RobotoSerif',
              color: Constant.black,
              fontWeight: FontWeight.normal,
              fontSize: 18.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: mediaQuery.size.height * (0.01)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/Union.png',
                  width: mediaQuery.size.width * 0.05,
                ),
                SizedBox(
                  width: mediaQuery.size.height * (0.005),
                ),
                Baseline(
                  baseline: 18.h,
                  baselineType: TextBaseline.alphabetic,
                  child: Text(
                    'Lunch',
                    style: theme.textTheme.bodyMedium!.copyWith(
                        color: Constant.gray,
                        fontFamily: 'Roboto',
                        fontSize: 15.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/fire.png',
                  width: mediaQuery.size.width * 0.045,
                ),
                SizedBox(
                  width: mediaQuery.size.height * (0.005),
                ),
                Baseline(
                  baseline: 18.h,
                  baselineType: TextBaseline.alphabetic,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '400',
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: Constant.gray,
                            fontFamily: 'Roboto',
                            fontSize: 15.sp,
                          ),
                        ),
                        TextSpan(
                          text: ' cal',
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: Constant.gray,
                            fontFamily: 'Roboto',
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    // textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
