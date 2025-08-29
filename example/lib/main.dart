import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:example/router.dart';
import 'package:example/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();
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
    ThemeData effectiveTheme;
    CupertinoThemeData effectiveCupertinoTheme;

    switch (_themeMode) {
      case ThemeMode.dark:
        effectiveTheme = getDarkTheme(_themeColor);
        effectiveCupertinoTheme = getDarkCupertinoTheme(_themeColor);
      case ThemeMode.light:
        effectiveTheme = getLightTheme(_themeColor);
        effectiveCupertinoTheme = getLightCupertinoTheme(_themeColor);
      case ThemeMode.system:
        final brightness = MediaQuery.platformBrightnessOf(context);
        if (brightness == Brightness.dark) {
          effectiveTheme = getDarkTheme(_themeColor);
          effectiveCupertinoTheme = getDarkCupertinoTheme(_themeColor);
        } else {
          effectiveTheme = getLightTheme(_themeColor);
          effectiveCupertinoTheme = getLightCupertinoTheme(_themeColor);
        }
    }

    return ThemeNotifier(
      changeTheme: changeTheme,
      changeColor: changeColor,
      currentThemeColor: _themeColor,
      child: AlphasowUiApp(
        debugShowCheckedModeBanner: false,
        title: 'Alphasow UI Example',
        theme: effectiveTheme,
        cupertinoTheme: effectiveCupertinoTheme,
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
