import 'package:flutter/material.dart';

final theme = ThemeUI.instance();

class ThemeUI {
  ThemeUI._internal({
    required this.primary,
    required this.secondary,
    required this.radius,
  });

  static late ThemeUI _instance;

  final Color primary;
  final Color secondary;
  final double radius;

  static ThemeUI instance() => _instance;

  factory ThemeUI.init({
    Color? primary,
    Color? secondary,
    double? radius,
  }) {
    _instance = ThemeUI._internal(
      primary: primary ?? Colors.black,
      secondary: secondary ?? Colors.grey,
      radius: radius ?? 6.0,
    );
    return _instance;
  }
}
