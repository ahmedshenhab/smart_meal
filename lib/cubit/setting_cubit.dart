import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:smart_meal/cubit/setting_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit()
    : super(
        SettingsState(themeMode: ThemeMode.light, locale: const Locale('en')),
      );

  void changeMode() {
    emit(
      state.copyWith(
        themeMode:
            state.themeMode == ThemeMode.light
                ? ThemeMode.dark
                : ThemeMode.light,
      ),
    );
  }

  changeLocale() {
    emit(
      state.copyWith(
        locale:
            state.locale == const Locale('ar')
                ? const Locale('en')
                : const Locale('ar'),
      ),
    );
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    return SettingsState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    {
      return state.toJson();
    }
  }
}
