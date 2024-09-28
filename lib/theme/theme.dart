import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

get theme => getIt<ThemeUI>();

class ThemeUI {
  const ThemeUI({
    required this.primary,
    required this.secondary,
    required this.radius,
  });

  final Color primary;
  final Color secondary;
  final double radius;

  factory ThemeUI.set({ThemeUI? theme}) {
    final result = theme ??
        const ThemeUI(
          primary: Colors.black,
          secondary: Colors.grey,
          radius: 6.0,
        );
    getIt.registerSingleton(result);
    return result;
  }
}
