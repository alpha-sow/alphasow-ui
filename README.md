# Alphasow UI

A Flutter package that provides a collection of reusable UI components with a consistent theming system.

## Features

- **Button Components**: Multiple variants including secondary, destructive, outline, ghost, and link buttons
- **Input Fields**: Customizable input components for forms
- **Labels**: Consistent text labeling components
- **Checkboxes**: Styled checkbox components
- **Circular Progress Indicators**: Loading indicators
- **Alert Dialogs**: Modal dialog components
- **Theme System**: Centralized theming with primary, secondary colors and radius configuration

## Getting Started

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  alphasow_ui: ^1.0.0
```

Then run:
```bash
flutter pub get
```

## Usage

### Initialize Theme

Before using any components, initialize the theme:

```dart
import 'package:alphasow_ui/alphasow_ui.dart';

void main() {
  ThemeUI.init();
  runApp(MyApp());
}
```

### Basic Components

```dart
import 'package:alphasow_ui/alphasow_ui.dart';

// Button variants
ButtonUI(text: 'Primary Button')
ButtonUI.secondary(text: 'Secondary Button')
ButtonUI.destructive(text: 'Destructive Button')
ButtonUI.outline(text: 'Outline Button')
ButtonUI.ghost(text: 'Ghost Button')
ButtonUI.link(text: 'Link Button')

// Input field
InputUI(hintText: 'Enter text here')

// Checkbox
CheckboxUI(value: true, onChanged: (value) {})

// Label
LabelUI(text: 'Label Text')

// Progress indicator
CircularProgressIndicatorUI()
```

## Example

Check out the `/example` folder for a complete demonstration of all available components.

To run the example:

```bash
cd example
flutter pub get
flutter run
```

## Architecture

- **ThemeUI**: Singleton class managing global theme configuration
- **Component Structure**: Each component follows the pattern `[name].dart` (export) and `[name]_ui.dart` (implementation)
- **Consistent Styling**: All components use the centralized theme system for colors and styling

## Additional Information

- **Version**: 1.0.0
- **Flutter SDK**: >=3.16.0
- **Dart SDK**: ^3.5.3

For issues and contributions, please refer to the project repository.