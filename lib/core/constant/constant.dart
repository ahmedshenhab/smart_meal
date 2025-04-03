import 'package:flutter/material.dart';
import 'package:smart_meal/core/network/local/shared_pref/cach_helper.dart';

class Constant {
  // if make set will make get else return null
  static String? get uId => CachHelper.getData(key: 'uId');

  static const Color scaffoldBackgroundLight = Color(0xFFf7e9dc);
  static const Color scaffoldBackgroundheavy = Color(0xFFf1ded1);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color saveColor = Color(0xFFD9D9D9);
  static const Color shadow = Color(0xFF000000);
  static const Color brown = Color(0xFFAB7B6D);
  static const Color categoriesColor = Color(0xFFA49FA2);
  static const Color brownBurn = Color(0xFF4D434B);
  static const Color deepOrange = Color(0xFFFA5A19);
  static const Color fieldHintSearchColor = Color(0xFF697077);
  static const Color resuiltIconSearchColor = Color(0xFFA2A9B0);
  static const Color gray = Color(0xFF938F8B);
  static const Color logInLaterColor = Color(0xFFB9B9BA);
  static const Color fieldColorHint = Color(0xFFB9B9BA);
  static const Color fieldprefixColor = Color(0xFFB9B9BA);
  static const Color orColor = Color(0xFFB1A0A0);
  static const Color allreadyHaveAcountColor = Color(0xFFBDADAD);
  static const Color frannyColor = Color(0xFF4F5162);

  static const Color fieldColor = Color(0xFFF2F4F8);

  static ThemeData lighTheme = ThemeData(
    fontFamily: 'cambria',
    textTheme: const TextTheme(
      // titleSmall: TextStyle(
      // fontFamily: 'cambria',
      //                 fontSize: 22,
      //                 height: 1.1,
      //                 fontWeight: FontWeight.bold,
      //                 color: Colors.black
      // ),
      bodySmall: TextStyle(
        fontFamily: 'cambria',
        //                 fontSize: 22,
        //                 height: 1.1,
        //                 fontWeight: FontWeight.bold,
        //                 color: Colors.black
      ),
      bodyMedium: TextStyle(
        fontFamily: 'cambria',
        fontSize: 22,
        height: 1.3,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),

    // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    // expansionTileTheme:
    //     const ExpansionTileThemeData(backgroundColor: Colors.white),
    // inputDecorationTheme: InputDecorationTheme(
    //   fillColor:
    //       Colors.white, // Ensure the background color is white for light theme
    //   filled: true,
    //   border: OutlineInputBorder(
    //     gapPadding: 7,
    //     borderRadius: BorderRadius.circular(20),
    //   ),
    //   hintStyle: const TextStyle(color: Colors.grey),
    //   labelStyle: const TextStyle(
    //     color: Colors.black,
    //   ),
    // ),

    // progressIndicatorTheme:
    //     const ProgressIndicatorThemeData(color: Colors.deepOrange),
    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //     selectedItemColor: Colors.blue,
    //     elevation: 20,
    //     type: BottomNavigationBarType.fixed),
    // appBarTheme: const AppBarTheme(
    //   iconTheme: IconThemeData(color: Colors.black),
    //   titleTextStyle: TextStyle(
    //       fontFamily: 'cambria',
    //       color: Colors.black,
    //       fontSize: 20,
    //       fontWeight: FontWeight.bold),
    //   systemOverlayStyle: SystemUiOverlayStyle(
    //       statusBarColor: Colors.blueAccent,
    //       statusBarIconBrightness: Brightness.light),
    //   backgroundColor: Colors.white,
    // ),
    // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
  );
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'cambria',
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        height: 1.3,
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      // bodyMedium: TextStyle(
      //     fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
    ),
    // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    // expansionTileTheme: ExpansionTileThemeData(
    //   backgroundColor: HexColor('333739').withRed(50),
    // ),
    // inputDecorationTheme: InputDecorationTheme(
    //     fillColor: Colors
    //         .grey[800], // Ensure the background color is white for light theme
    //     filled: true,
    //     focusedBorder: const OutlineInputBorder(
    //         borderSide: BorderSide(color: Colors.white)),
    //     border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(20),
    //         borderSide: const BorderSide(color: Colors.white, width: 30)),
    //     hintStyle: const TextStyle(color: Colors.black),
    //     labelStyle: const TextStyle(
    //       fontSize: 18,
    //       color: Colors.white,
    //       fontWeight: FontWeight.bold,
    //     )),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.deepOrange,
    ),
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //     selectedItemColor: Colors.deepOrange,
    //     backgroundColor: HexColor('333739').withRed(50),
    //     unselectedItemColor: Colors.grey[100],
    //     elevation: 20,
    //     type: BottomNavigationBarType.fixed),
    // scaffoldBackgroundColor: HexColor('333739'),
    // appBarTheme: AppBarTheme(
    //   iconTheme: const IconThemeData(color: Colors.white),
    //   titleTextStyle: const TextStyle(
    //       fontFamily: 'cambria',
    //       color: Colors.white,
    //       fontSize: 20,
    //       fontWeight: FontWeight.bold),
    //   systemOverlayStyle: SystemUiOverlayStyle(
    //       statusBarColor: HexColor('333739'),
    //       statusBarIconBrightness: Brightness.light),
    //   backgroundColor: HexColor('333739'),
    // ),
  );
}
