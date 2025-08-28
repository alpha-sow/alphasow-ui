import 'package:example/router.dart';
import 'package:example/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();
  ThemeMode _themeMode = ThemeMode.system;
  ThemeColor _themeColor = ThemeColor.blue;

  void changeTheme(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  void changeColor(ThemeColor color) {
    setState(() {
      _themeColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeNotifier(
      changeTheme: changeTheme,
      changeColor: changeColor,
      currentThemeColor: _themeColor,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Alphasow UI Example',
        theme: getLightTheme(_themeColor),
        darkTheme: getDarkTheme(_themeColor),
        themeMode: _themeMode,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}

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
