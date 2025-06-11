
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/core/ui/theme/app_theme_dark.dart';
import 'package:smart_meal/core/ui/theme/app_theme_light.dart';
import 'core/setup/setup.dart';
import 'core/routing/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() async {
  await setupApp();

  // final List<CartItem> x = await getIt<DatabaseHelper>().getAllNames();

  // if (x.isNotEmpty) {
  //   for (var e in x) {
  //     log(e.name ?? '');
  //   }
  // }

  runApp(const MyApp());


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
          darkTheme: AppThemeDark.darkTheme,
          theme: AppThemeLight.lighTheme,

          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: getIntialRoute,
        );
      },
    );
  }
}
