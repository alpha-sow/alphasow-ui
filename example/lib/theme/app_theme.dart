import 'package:example/theme/protect_u_theme.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ThemeColor { blue, red, green, orange, protectU }

ThemeData getLightTheme(ThemeColor themeColor) {
  if (themeColor == ThemeColor.protectU) {
    return getProtectULightTheme();
  }

  final scheme = switch (themeColor) {
    ThemeColor.blue => FlexScheme.blue,
    ThemeColor.red => FlexScheme.red,
    ThemeColor.green => FlexScheme.green,
    ThemeColor.orange => FlexScheme.orangeM3,
    ThemeColor.protectU => FlexScheme.blackWhite,
  };

  return FlexThemeData.light(
    scheme: scheme,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      useM2StyleDividerInM3: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3ErrorColors: true,
    swapLegacyOnMaterial3: true,
  );
}

ThemeData getDarkTheme(ThemeColor themeColor) {
  if (themeColor == ThemeColor.protectU) {
    return getProtectUDarkTheme();
  }

  final scheme = switch (themeColor) {
    ThemeColor.blue => FlexScheme.blue,
    ThemeColor.red => FlexScheme.red,
    ThemeColor.green => FlexScheme.green,
    ThemeColor.orange => FlexScheme.orangeM3,
    ThemeColor.protectU => FlexScheme.blackWhite,
  };

  return FlexThemeData.dark(
    scheme: scheme,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      useM2StyleDividerInM3: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3ErrorColors: true,
    swapLegacyOnMaterial3: true,
  );
}

final ThemeData theme = getLightTheme(ThemeColor.blue);
final ThemeData themeDark = getDarkTheme(ThemeColor.blue);

CupertinoThemeData getLightCupertinoTheme(ThemeColor themeColor) {
  if (themeColor == ThemeColor.protectU) {
    return getProtectULightCupertinoTheme();
  }

  final primaryColor = switch (themeColor) {
    ThemeColor.blue => const Color(0xFF2196F3),
    ThemeColor.red => const Color(0xFFF44336),
    ThemeColor.green => const Color(0xFF4CAF50),
    ThemeColor.orange => const Color(0xFFFF9800),
    ThemeColor.protectU => const Color(0xFF000000),
  };

  return CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    primaryContrastingColor: Colors.white,
    barBackgroundColor: const Color(0xFFF8F9FA),
    scaffoldBackgroundColor: Colors.white,
    textTheme: const CupertinoTextThemeData(
      primaryColor: Color(0xFF000000),
      textStyle: TextStyle(
        fontFamily: '.SF Pro Text',
        fontSize: 17,
        letterSpacing: -0.41,
        color: Color(0xFF000000),
      ),
    ),
  );
}

CupertinoThemeData getDarkCupertinoTheme(ThemeColor themeColor) {
  if (themeColor == ThemeColor.protectU) {
    return getProtectUDarkCupertinoTheme();
  }

  final primaryColor = switch (themeColor) {
    ThemeColor.blue => const Color(0xFF64B5F6),
    ThemeColor.red => const Color(0xFFEF5350),
    ThemeColor.green => const Color(0xFF66BB6A),
    ThemeColor.orange => const Color(0xFFFFB74D),
    ThemeColor.protectU => const Color(0xFFFFFFFF),
  };

  return CupertinoThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    primaryContrastingColor: Colors.black,
    barBackgroundColor: const Color(0xFF1C1C1E),
    scaffoldBackgroundColor: const Color(0xFF000000),
    textTheme: const CupertinoTextThemeData(
      primaryColor: Color(0xFFFFFFFF),
      textStyle: TextStyle(
        fontFamily: '.SF Pro Text',
        fontSize: 17,
        letterSpacing: -0.41,
        color: Color(0xFFFFFFFF),
      ),
    ),
  );
}

final CupertinoThemeData cupertinoTheme =
    getLightCupertinoTheme(ThemeColor.blue);
final CupertinoThemeData cupertinoThemeDark =
    getDarkCupertinoTheme(ThemeColor.blue);
