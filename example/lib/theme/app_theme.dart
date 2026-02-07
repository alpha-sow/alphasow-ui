import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

enum ThemeColor { blue, red, green, orange, protectU }

AsTheme getAsTheme(ThemeColor themeColor, Brightness brightness) {
  final primaryColor = switch (themeColor) {
    ThemeColor.blue => const Color(0xFF2196F3),
    ThemeColor.red => const Color(0xFFF44336),
    ThemeColor.green => const Color(0xFF4CAF50),
    ThemeColor.orange => const Color(0xFFFF9800),
    ThemeColor.protectU => const Color(0xFF111111),
  };

  return AsTheme(
    primaryColor: primaryColor,
    brightness: brightness,
  );
}
