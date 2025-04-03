import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSection1 extends StatelessWidget {
  const HomeSection1({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Container(
        // clipBehavior: Clip.hardEdge,
        height: mediaQuery.size.height * 0.43,
        // padding: EdgeInsets.only(bottom: mediaQuery.size.height * 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0.r)),
          color: Colors.white,
        ),
        child: Image.asset(
          fit: BoxFit.contain,
          'assets/images/chefImage.png',
        ));
  }
}
