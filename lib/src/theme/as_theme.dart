import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A unified theme configuration for Alphasow UI apps.
///
/// Takes minimal configuration and generates both Material and Cupertino
/// themes automatically. Pass an [AsTheme] to `AlphasowUiApp.asTheme`
/// instead of providing separate [ThemeData] and [CupertinoThemeData].
///
/// For simple theming, use the default constructor with [primaryColor]:
///
/// ```dart
/// AlphasowUiApp(
///   asTheme: AsTheme(
///     primaryColor: Colors.green,
///     brightness: Brightness.dark,
///   ),
///   home: MyHomePage(),
/// )
/// ```
///
/// For advanced theming (e.g. with FlexColorScheme), pass pre-built themes:
///
/// ```dart
/// AlphasowUiApp(
///   asTheme: AsTheme(
///     materialTheme: FlexThemeData.light(scheme: FlexScheme.shadRed),
///     darkMaterialTheme: FlexThemeData.dark(scheme: FlexScheme.shadRed),
///   ),
///   home: MyHomePage(),
/// )
/// ```
class AsTheme {
  /// Creates an Alphasow UI theme configuration.
  ///
  /// [primaryColor] The primary color used throughout the app.
  /// Defaults to Material blue (`0xFF2196F3`).
  ///
  /// [brightness] The overall brightness of the theme.
  /// Defaults to [Brightness.light].
  ///
  /// [colorSchemeSeed] Optional seed color for Material 3 color scheme
  /// generation. When provided, this is used instead of [primaryColor]
  /// for [ColorScheme.fromSeed].
  ///
  /// [materialTheme] Optional pre-built Material [ThemeData] for light mode.
  /// When provided, [toMaterialTheme] returns this directly.
  ///
  /// [darkMaterialTheme] Optional pre-built Material [ThemeData] for dark
  /// mode. When provided and brightness is dark, [toMaterialTheme] returns
  /// this instead.
  ///
  /// [cupertinoTheme] Optional pre-built [CupertinoThemeData].
  /// When provided, [toCupertinoTheme] returns this directly.
  const AsTheme({
    this.primaryColor = const Color(0xFF2196F3),
    this.brightness = Brightness.light,
    this.colorSchemeSeed,
    this.materialTheme,
    this.darkMaterialTheme,
    this.cupertinoTheme,
  });

  /// The primary color used throughout the app.
  final Color primaryColor;

  /// The overall brightness of the theme.
  final Brightness brightness;

  /// Optional seed color for Material 3 color scheme generation.
  ///
  /// When provided, [ColorScheme.fromSeed] uses this instead of
  /// [primaryColor] as the seed.
  final Color? colorSchemeSeed;

  /// Optional pre-built Material [ThemeData] for light mode.
  ///
  /// When provided, [toMaterialTheme] returns this directly instead of
  /// generating a theme from [primaryColor].
  final ThemeData? materialTheme;

  /// Optional pre-built Material [ThemeData] for dark mode.
  ///
  /// When provided and [brightness] is [Brightness.dark],
  /// [toMaterialTheme] returns this instead of generating a theme.
  final ThemeData? darkMaterialTheme;

  /// Optional pre-built [CupertinoThemeData].
  ///
  /// When provided, [toCupertinoTheme] returns this directly instead of
  /// generating a theme from [primaryColor].
  final CupertinoThemeData? cupertinoTheme;

  /// Generates a [ThemeData] from this theme configuration.
  ///
  /// If [materialTheme] or [darkMaterialTheme] is provided, returns the
  /// appropriate pre-built theme based on [brightness]. Otherwise generates
  /// a theme from [primaryColor] or [colorSchemeSeed].
  ThemeData toMaterialTheme() {
    if (brightness == Brightness.dark && darkMaterialTheme != null) {
      return darkMaterialTheme!;
    }
    if (materialTheme != null) return materialTheme!;

    final colorScheme = ColorScheme.fromSeed(
      seedColor: colorSchemeSeed ?? primaryColor,
      brightness: brightness,
    );

    return ThemeData(
      colorScheme: colorScheme,
      brightness: brightness,
      useMaterial3: true,
    );
  }

  /// Generates a [CupertinoThemeData] from this theme configuration.
  ///
  /// If [cupertinoTheme] is provided, returns it directly. Otherwise
  /// generates a theme from [primaryColor] and [brightness].
  CupertinoThemeData toCupertinoTheme() {
    if (cupertinoTheme != null) return cupertinoTheme!;

    final isDark = brightness == Brightness.dark;

    return CupertinoThemeData(
      primaryColor: primaryColor,
      brightness: brightness,
      barBackgroundColor: isDark
          ? const Color(0xF01D1D1D)
          : const Color(0xF0F9F9F9),
      scaffoldBackgroundColor: isDark
          ? CupertinoColors.black
          : CupertinoColors.systemGroupedBackground,
      textTheme: CupertinoTextThemeData(
        primaryColor: primaryColor,
      ),
    );
  }
}
