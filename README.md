# Alphasow UI

[![Version](https://img.shields.io/badge/version-1.20.0-blue.svg)](https://github.com/alpha-sow/alphasow-ui)
[![Flutter](https://img.shields.io/badge/Flutter-%3E%3D3.16.0-blue.svg)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-%5E3.5.3-blue.svg)](https://dart.dev)

A Flutter package providing a comprehensive collection of reusable UI components with consistent theming and platform adaptation. Supports both Material Design (Android) and Cupertino (iOS) styling automatically.

## Features

- 🎨 **Consistent Theming** - Centralized theme system with dark/light mode support
- 📱 **Platform Adaptive** - Automatic Material/Cupertino styling based on platform
- 🔔 **Banner System** - Built-in notification overlay system
- 🧩 **Comprehensive Components** - Buttons, inputs, alerts, loaders, menus, and more
- 🌍 **Accessibility** - Built-in accessibility support across all components

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  alphasow_ui: ^1.21.0
```

Then run:

```bash
flutter pub get
```

## Quick Start

### Basic Setup

Wrap your app with `AlphasowUiApp` to enable all features:

```dart
import 'package:alphasow_ui/alphasow_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlphasowUiApp(
      title: 'My App',
      home: const HomePage(),
    );
  }
}
```

### Using Components

```dart
// Buttons
AsButton(
  onPressed: () => print('Pressed'),
  child: const Text('Primary Button'),
)

// Text Fields
AsTextField(
  labelText: 'Email',
  onChanged: (value) => print(value),
)

// Show Banner Notifications
context.showBanner(
  message: 'Success!',
  type: BannerType.success,
)

// Loading Indicators
AsLoadingSpinner()
```

## Available Components

### Buttons

- `AsButton` - Primary/secondary buttons with variants
- `AsIconButton` - Icon-based buttons with hover effects
- `AsLinkButton` - Text-based link buttons

### Form Controls

- `AsTextField` - Text input with validation
- `AsCheckbox` - Checkbox with custom styling

### Alerts & Notifications

- `AsAlertDialog` - Modal dialogs
- `AsAlertBanner` - In-line banner alerts
- `AsBottomSheet` - Bottom sheet modals
- Banner overlay system via `context.showBanner()`

### Navigation & Layout

- `AsScaffold` - Platform-adaptive scaffold
- `AsAppBar` - Application bar
- `AsNavigationRail` - Side navigation
- `AsListTile` - List item component

### Visual Elements

- `AsAvatar` - User avatar component
- `AsLabel` - Text labels with styling
- `AsDivider` - Visual separators
- `AsLoadingCircular` - Circular progress indicator
- `AsLoadingSpinner` - Custom spinner animation

### Menus

- `AsMenuDropdown` - Dropdown menu component
- `AsMenuDown` - Contextual dropdown menus

## Example App

Explore all components in the interactive example app:

**🌐 Live Demo**: [ui.alphasow.dev](https://ui.alphasow.dev)

Or run locally:

```bash
cd example
flutter pub get
flutter run
```

The example demonstrates:

- All available components
- Theme switching (light/dark mode)
- Color theme variations
- Platform adaptation
- Interactive component showcase

## Architecture

### Platform Adaptation

Components automatically adapt based on the current platform:

- **iOS/macOS**: Cupertino styling
- **Android/Web**: Material Design styling

### Theme System

- Centralized theming through `AlphasowUiApp`
- Support for custom themes and color schemes
- Dark/light mode switching
- Platform-appropriate default themes

### Component Structure

- Modular organization by component type
- Consistent naming: `as_[component_name].dart`
- Export files for each category (e.g., `button/button.dart`)

## Requirements

- **Flutter SDK**: >=3.16.0
- **Dart SDK**: ^3.5.3
- **Version**: 1.18.0

## Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details on:

- Setting up the development environment
- Component development guidelines
- Testing requirements
- Code style and formatting
- Pull request process

For issues and feature requests, please use our [GitHub issue templates](.github/ISSUE_TEMPLATE/).
