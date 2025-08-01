import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final ThemeData theme = FlexThemeData.light(
  scheme: FlexScheme.blue,
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

final ThemeData themeDark = FlexThemeData.dark(
  scheme: FlexScheme.blue,
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

const CupertinoThemeData cupertinoTheme = CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFF2196F3),
  primaryContrastingColor: Colors.white,
  barBackgroundColor: Color(0xFFF8F9FA),
  scaffoldBackgroundColor: Colors.white,
  textTheme: CupertinoTextThemeData(
    primaryColor: Color(0xFF000000),
    textStyle: TextStyle(
      fontFamily: '.SF Pro Text',
      fontSize: 17,
      letterSpacing: -0.41,
      color: Color(0xFF000000),
    ),
  ),
);

const CupertinoThemeData cupertinoThemeDark = CupertinoThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(0xFF64B5F6),
  primaryContrastingColor: Colors.black,
  barBackgroundColor: Color(0xFF1C1C1E),
  scaffoldBackgroundColor: Color(0xFF000000),
  textTheme: CupertinoTextThemeData(
    primaryColor: Color(0xFFFFFFFF),
    textStyle: TextStyle(
      fontFamily: '.SF Pro Text',
      fontSize: 17,
      letterSpacing: -0.41,
      color: Color(0xFFFFFFFF),
    ),
  ),
);
