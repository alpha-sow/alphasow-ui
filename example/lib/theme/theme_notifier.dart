import 'package:example/theme/theme.dart';
import 'package:flutter/material.dart';

class ThemeNotifier extends InheritedWidget {
  const ThemeNotifier({
    required this.changeTheme,
    required this.changeColor,
    required this.currentThemeColor,
    required super.child,
    super.key,
  });

  final void Function(ThemeMode) changeTheme;
  final void Function(ThemeColor) changeColor;
  final ThemeColor currentThemeColor;

  static ThemeNotifier? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeNotifier>();
  }

  @override
  bool updateShouldNotify(ThemeNotifier oldWidget) {
    return changeTheme != oldWidget.changeTheme ||
        changeColor != oldWidget.changeColor ||
        currentThemeColor != oldWidget.currentThemeColor;
  }
}
