
import 'dart:developer';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/network/local/sql/sqldb.dart';
import 'core/di/setup.dart';
import 'core/routing/router.dart';
import 'core/style/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() async {
  await setupApp();

                            final List<CartItem> x=    await  getIt<DatabaseHelper>().getAllNames( );
                            log(x.toString());
                            log(x[0].name.toString());

  

  runApp(const MyApp());
 
  log(ui.PlatformDispatcher.instance.locale.languageCode);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
  
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          darkTheme: AppTheme.darkTheme,
          theme: AppTheme.lighTheme,
          themeMode: ThemeMode.light,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: getIntialRoute,
        );
      },
    );
  }
}
