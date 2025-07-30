# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is `alphasow_ui`, a Flutter package that provides a collection of reusable UI components. The package includes buttons, inputs, labels, checkboxes, circular progress indicators, and alert dialogs with a consistent theming system.

## Project Structure

```text
lib/
├── alpha_ui.dart           # Main entry point (legacy name)
├── alphasow_ui.dart        # New entry point
├── src/                    # Core components
│   ├── src.dart           # Component exports
│   ├── alert_dialog/      # Alert dialog components
│   ├── button/            # Button components with variants
│   ├── checkbox/          # Checkbox components
│   ├── circular_progress_indicator/  # Progress indicator
│   ├── input/             # Input field components
│   └── label/             # Label components
└── theme/                 # Theming system
    ├── theme.dart         # Theme exports
    └── theme_ui.dart      # Theme configuration class

example/                   # Example app demonstrating components
test/                      # Package tests
```

## Development Commands

### Package Development

```bash
# Get dependencies
flutter pub get

# Run static analysis
flutter analyze

# Run tests
flutter test

# Clean build artifacts
flutter clean
```

### Example App Development

```bash
# Navigate to example directory
cd example

# Get dependencies
flutter pub get

# Run the example app
flutter run

# Run on specific device
flutter run -d <device-id>

# Build for release
flutter build apk        # Android
flutter build ios        # iOS
flutter build web        # Web
```

## Architecture

### Theming System

- **ThemeUI**: Singleton class that manages global theme configuration
- Components use `theme.primary`, `theme.secondary`, and `theme.radius` for consistent styling
- Theme must be initialized with `ThemeUI.init()` before using components
- Located in `lib/theme/theme_ui.dart:3-30`

### Component Structure

- Each component has its own directory under `lib/src/`
- Components follow a pattern: `[name].dart` (export) and `[name]_ui.dart` (implementation)
- Button variants: secondary, destructive, outline, ghost, link (defined in `lib/src/button/button_ui.dart:4`)
- Components use Flutter Material Design principles

### Export Strategy

- Main exports through `lib/alpha_ui.dart` (legacy) and `lib/alphasow_ui.dart` (current)
- Component exports centralized in `lib/src/src.dart`
- Theme exports in `lib/theme/theme.dart`

## Common Development Tasks

### Adding New Components

1. Create component directory under `lib/src/`
2. Add `[component].dart` (export file) and `[component]_ui.dart` (implementation)
3. Export the component in `lib/src/src.dart`
4. Add example usage in `example/lib/`

### Testing Components

- Use the example app to test components visually
- Example app demonstrates all available components
- Run `flutter run` in the example directory for live testing

### Package Publishing

- Version managed in `pubspec.yaml`
- Currently at version 1.0.0
- Uses flutter_lints ^5.0.0 for code quality

## Key Files to Understand

- `lib/theme/theme_ui.dart`: Core theming system implementation
- `lib/src/button/button_ui.dart`: Button variants and styling
- `example/lib/main.dart`: Component usage examples
- `pubspec.yaml`: Package configuration and dependencies
