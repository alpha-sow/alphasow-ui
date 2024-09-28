import 'package:flutter/material.dart';

abstract class ThemeUI {
  Color get primary;
  Color get secondary;
  double get radius;
}

class DefaultThemeUI implements ThemeUI {
  @override
  Color get primary => Colors.black;
  @override
  Color get secondary => Colors.grey;
  @override
  double get radius => 6.0;
}

class OrangeThemeUI implements ThemeUI {
  @override
  Color get primary => Colors.orange;
  @override
  Color get secondary => Colors.grey;
  @override
  double get radius => 6.0;
}
