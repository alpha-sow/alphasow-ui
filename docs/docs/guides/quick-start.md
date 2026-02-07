---
sidebar_position: 1
---

# Quick Start Guide

Get up and running with Alphasow UI in just a few minutes.

## Installation

Add Alphasow UI to your `pubspec.yaml`:

```yaml
dependencies:
  alphasow_ui: ^1.21.0
```

Run the installation command:

```bash
flutter pub get
```

## Basic Setup

### 1. Import Alphasow UI

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

### 2. Wrap Your App

Replace your `MaterialApp` or `CupertinoApp` with `AlphasowUiApp`:

```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlphasowUiApp(
      title: 'My Alphasow UI App',
      home: const HomeScreen(),
    );
  }
}
```

### 3. Create Your First Screen

```dart
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AsScaffold(
      appBar: AsAppBar(
        title: const Text('Welcome'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Hello, Alphasow UI!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            AsButton(
              onPressed: _showSuccessMessage,
              child: Text('Test Button'),
            ),
          ],
        ),
      ),
    );
  }
  
  void _showSuccessMessage(BuildContext context) {
    context.showBanner(
      message: 'Button pressed successfully!',
      type: AlertType.success,
    );
  }
}
```

## Theming

### Simple Theming

Use `AsTheme` with a primary color and brightness:

```dart
AlphasowUiApp(
  asTheme: AsTheme(
    primaryColor: Colors.indigo,
    brightness: Brightness.light,
  ),
  home: const HomeScreen(),
)
```

### Advanced Theming with FlexColorScheme

For richer theming, pass pre-built `ThemeData` via `materialTheme` and `darkMaterialTheme`. This works with any theme generator, such as [FlexColorScheme](https://pub.dev/packages/flex_color_scheme):

```dart
AlphasowUiApp(
  asTheme: AsTheme(
    brightness: brightness,
    materialTheme: FlexThemeData.light(
      scheme: FlexScheme.shadRed,
      subThemesData: const FlexSubThemesData(
        interactionEffects: true,
        inputDecoratorBorderType: FlexInputBorderType.outline,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      cupertinoOverrideTheme:
          const CupertinoThemeData(applyThemeToAll: true),
    ),
    darkMaterialTheme: FlexThemeData.dark(
      scheme: FlexScheme.shadRed,
      subThemesData: const FlexSubThemesData(
        interactionEffects: true,
        blendOnColors: true,
        inputDecoratorBorderType: FlexInputBorderType.outline,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      cupertinoOverrideTheme:
          const CupertinoThemeData(applyThemeToAll: true),
    ),
  ),
  home: const HomeScreen(),
)
```

You can also pass a custom `CupertinoThemeData` via the `cupertinoTheme` parameter when running on iOS/macOS.

### AsTheme Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `primaryColor` | `Color` | `Color(0xFF2196F3)` | Primary color for generated themes |
| `brightness` | `Brightness` | `Brightness.light` | Light or dark mode |
| `colorSchemeSeed` | `Color?` | null | Seed color for Material 3 `ColorScheme.fromSeed` |
| `materialTheme` | `ThemeData?` | null | Pre-built light Material theme |
| `darkMaterialTheme` | `ThemeData?` | null | Pre-built dark Material theme |
| `cupertinoTheme` | `CupertinoThemeData?` | null | Pre-built Cupertino theme |

When `materialTheme` or `darkMaterialTheme` is provided, `AsTheme` returns it directly instead of generating a theme from `primaryColor`.

## Key Features Enabled

By using `AlphasowUiApp`, you automatically get:

- **Platform adaptation** - Components switch between Material and Cupertino styles
- **Banner system** - Global notification overlay via `context.showBanner()`
- **Consistent theming** - Centralized theme management with support for pre-built themes
- **Accessibility support** - Built-in screen reader and keyboard navigation

## Next Steps

- Explore the [Component Library](../components/overview)
- See the [Live Demo](https://ui.alphasow.dev)

## Common Issues

### Import Errors
Make sure you're importing the main package:
```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

### Platform Detection
Platform detection works automatically, but you can check the current platform:
```dart
final platform = PlatformType.currentPlatform();
print('Current platform: $platform'); // cupertino or material
```

### Banner Not Showing
Ensure your app is wrapped with `AlphasowUiApp` and you're calling `showBanner` on a valid `BuildContext`.