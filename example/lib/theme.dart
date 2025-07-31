import 'package:flex_color_scheme/flex_color_scheme.dart';

final theme = FlexThemeData.light(
  scheme: FlexScheme.blue,
  useMaterial3: true,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 7,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 10,
    blendOnColors: false,
    useM2StyleDividerInM3: true,
    alignedDropdown: true,
    useInputDecoratorThemeInDialogs: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3ErrorColors: true,
  swapLegacyOnMaterial3: true,
);

final themeDark = FlexThemeData.dark(
  scheme: FlexScheme.blue,
  useMaterial3: true,
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
