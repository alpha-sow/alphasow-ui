import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A unified theme configuration for Alphasow UI apps.
///
/// Takes minimal configuration and generates both Material and Cupertino
/// themes automatically. Pass an [AsTheme] to `AlphasowUiApp.asTheme`
/// instead of providing separate [ThemeData] and [CupertinoThemeData].
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
  const AsTheme({
    this.primaryColor = const Color(0xFF2196F3),
    this.brightness = Brightness.light,
    this.colorSchemeSeed,
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

  /// Generates a [ThemeData] from this theme configuration.
  ThemeData toMaterialTheme() {
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
  CupertinoThemeData toCupertinoTheme() {
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
