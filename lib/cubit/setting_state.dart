import 'package:flutter/material.dart';

class SettingsState {
  factory SettingsState.fromJson(Map<String, dynamic> json) {
    return SettingsState(
      themeMode: ThemeMode.values[json['themeMode']],
      locale: Locale(json['locale']),
    );
  }

  SettingsState({required this.themeMode, required this.locale});
  final ThemeMode themeMode;
  final Locale locale;

  SettingsState copyWith({ThemeMode? themeMode, Locale? locale}) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'themeMode': themeMode.index,
      'locale': locale.languageCode,
    };
  }
}
