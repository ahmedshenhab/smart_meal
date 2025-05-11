import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/di.dart';
import 'core/routing/router.dart';
import 'core/style/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() async {
  await setupApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (_, child) => MaterialApp(
            locale: const Locale('en'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,

            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            darkTheme: AppTheme.darkTheme,
            theme: AppTheme.lighTheme,
            themeMode: ThemeMode.light,
            onGenerateRoute: AppRouter.onGenerateRoute,

            initialRoute: getIntialRoute,
          ),
    );
  }
}
