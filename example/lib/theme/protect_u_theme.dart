import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// ProtectU theme colors
class ProtectUColors {
  static const veryDarkGrey = Color(0xFF111111);
  static const darkGrey = Color(0xFF515151);
  static const mediumGrey = Color(0xFF7B7B7B);
  static const lightGrey = Color(0xFFA8A8A8);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
}

/// Get ProtectU light Material theme
ThemeData getProtectULightTheme() {
  final baseTheme = FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: ProtectUColors.veryDarkGrey,
      primaryContainer: ProtectUColors.darkGrey,
      secondary: ProtectUColors.mediumGrey,
      secondaryContainer: ProtectUColors.lightGrey,
      tertiary: ProtectUColors.darkGrey,
      tertiaryContainer: Color(0xFFD0D0D0),
      appBarColor: ProtectUColors.white,
      error: Color(0xFFB00020),
    ),
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 0,
      useM2StyleDividerInM3: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3ErrorColors: true,
    swapLegacyOnMaterial3: true,
  );

  return baseTheme.copyWith(
    scaffoldBackgroundColor: ProtectUColors.white,
    colorScheme: baseTheme.colorScheme.copyWith(
      surface: ProtectUColors.white,
      onSurface: ProtectUColors.veryDarkGrey,
      surfaceContainerLowest: ProtectUColors.white,
      surfaceContainerLow: const Color(0xFFFAFAFA),
      surfaceContainer: const Color(0xFFF5F5F5),
      surfaceContainerHigh: const Color(0xFFEEEEEE),
      surfaceContainerHighest: const Color(0xFFE0E0E0),
      onSurfaceVariant: ProtectUColors.darkGrey,
      outline: ProtectUColors.mediumGrey,
      outlineVariant: ProtectUColors.lightGrey,
    ),
  );
}

/// Get ProtectU dark Material theme
ThemeData getProtectUDarkTheme() {
  final baseTheme = FlexThemeData.dark(
    colors: const FlexSchemeColor(
      primary: ProtectUColors.lightGrey,
      primaryContainer: ProtectUColors.mediumGrey,
      secondary: ProtectUColors.darkGrey,
      secondaryContainer: ProtectUColors.veryDarkGrey,
      tertiary: ProtectUColors.mediumGrey,
      tertiaryContainer: Color(0xFF2A2A2A),
      appBarColor: ProtectUColors.black,
      error: Color(0xFFCF6679),
    ),
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 0,
      useM2StyleDividerInM3: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3ErrorColors: true,
    swapLegacyOnMaterial3: true,
  );

  return baseTheme.copyWith(
    scaffoldBackgroundColor: ProtectUColors.black,
    colorScheme: baseTheme.colorScheme.copyWith(
      surface: ProtectUColors.black,
      onSurface: ProtectUColors.lightGrey,
      surfaceContainerLowest: ProtectUColors.black,
      surfaceContainerLow: ProtectUColors.veryDarkGrey,
      surfaceContainer: const Color(0xFF1E1E1E),
      surfaceContainerHigh: const Color(0xFF2A2A2A),
      surfaceContainerHighest: const Color(0xFF3A3A3A),
      onSurfaceVariant: ProtectUColors.mediumGrey,
      outline: ProtectUColors.darkGrey,
      outlineVariant: ProtectUColors.veryDarkGrey,
    ),
  );
}

/// Get ProtectU light Cupertino theme
CupertinoThemeData getProtectULightCupertinoTheme() {
  return const CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: ProtectUColors.veryDarkGrey,
    primaryContrastingColor: ProtectUColors.white,
    barBackgroundColor: ProtectUColors.white,
    scaffoldBackgroundColor: ProtectUColors.white,
    textTheme: CupertinoTextThemeData(
      primaryColor: ProtectUColors.veryDarkGrey,
      textStyle: TextStyle(
        fontFamily: '.SF Pro Text',
        fontSize: 17,
        letterSpacing: -0.41,
        color: ProtectUColors.veryDarkGrey,
      ),
    ),
  );
}

/// Get ProtectU dark Cupertino theme
CupertinoThemeData getProtectUDarkCupertinoTheme() {
  return const CupertinoThemeData(
    brightness: Brightness.dark,
    primaryColor: ProtectUColors.lightGrey,
    primaryContrastingColor: ProtectUColors.black,
    barBackgroundColor: ProtectUColors.black,
    scaffoldBackgroundColor: ProtectUColors.black,
    textTheme: CupertinoTextThemeData(
      primaryColor: ProtectUColors.lightGrey,
      textStyle: TextStyle(
        fontFamily: '.SF Pro Text',
        fontSize: 17,
        letterSpacing: -0.41,
        color: ProtectUColors.lightGrey,
      ),
    ),
  );
}
