import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:example/router.dart';
import 'package:example/theme/theme.dart';
import 'package:flutter/material.dart';

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
    final Brightness brightness;

    switch (_themeMode) {
      case ThemeMode.dark:
        brightness = Brightness.dark;
      case ThemeMode.light:
        brightness = Brightness.light;
      case ThemeMode.system:
        brightness = MediaQuery.platformBrightnessOf(context);
    }

    return ThemeNotifier(
      changeTheme: changeTheme,
      changeColor: changeColor,
      currentThemeColor: _themeColor,
      child: AlphasowUiApp(
        platformMode: AsPlatformMode.material,
        debugShowCheckedModeBanner: false,
        title: 'Alphasow UI Example',
        asTheme: getAsTheme(_themeColor, brightness),
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
