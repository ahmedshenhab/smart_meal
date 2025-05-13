import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_meal/cubit/setting_cubit.dart';
import 'package:smart_meal/cubit/setting_state.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/meal_layout_screen.dart';
import 'core/di/setup.dart';
import 'core/routing/router.dart';
import 'core/style/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() async {
  await setupApp();

  runApp(BlocProvider(create: (_) => SettingsCubit(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp(
              locale: const Locale('ar'),
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
              themeMode: state.themeMode,
              onGenerateRoute: AppRouter.onGenerateRoute,
              initialRoute: MealLayoutScreen.homeScreen,
            );
          },
        );
      },
    );
  }
}
