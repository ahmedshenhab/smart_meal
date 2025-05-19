import 'package:flutter/material.dart';

extension ThemeModeExtension on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}