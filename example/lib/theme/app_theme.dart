import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';

enum ThemeColor { blue, red, green, orange, protectU }

/// Maps [ThemeColor] to a [FlexScheme].
FlexScheme _flexScheme(ThemeColor themeColor) {
  return switch (themeColor) {
    ThemeColor.blue => FlexScheme.blueM3,
    ThemeColor.red => FlexScheme.shadRed,
    ThemeColor.green => FlexScheme.money,
    ThemeColor.orange => FlexScheme.amber,
    ThemeColor.protectU => FlexScheme.greys,
  };
}

const _subThemesData = FlexSubThemesData(
  interactionEffects: true,
  tintedDisabledControls: true,
  useM2StyleDividerInM3: true,
  inputDecoratorIsFilled: true,
  inputDecoratorBorderType: FlexInputBorderType.outline,
  alignedDropdown: true,
  navigationBarIndicatorSchemeColor: SchemeColor.surfaceContainer,
  navigationRailUseIndicator: true,
);

AsTheme getAsTheme(ThemeColor themeColor, Brightness brightness) {
  final scheme = _flexScheme(themeColor);

  return AsTheme(
    brightness: brightness,
    materialTheme: FlexThemeData.light(
      scheme: scheme,
      subThemesData: _subThemesData,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
    ),
    darkMaterialTheme: FlexThemeData.dark(
      scheme: scheme,
      subThemesData: _subThemesData.copyWith(blendOnColors: true),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
    ),
  );
}
