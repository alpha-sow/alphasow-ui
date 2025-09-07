---
sidebar_position: 1
---

# AsButton

A versatile button component that adapts to the current platform with support for different styles, loading states, and accessibility features.

## Import

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

## Basic Usage

```dart
AsButton(
  onPressed: () {
    print('Button pressed!');
  },
  child: const Text('Press Me'),
)
```

## Button Styles

### Primary Button (Default)
```dart
AsButton(
  style: AsButtonStyle.primary, // Optional, this is the default
  onPressed: () {},
  child: const Text('Primary Button'),
)
```

### Secondary Button
```dart
AsButton(
  style: AsButtonStyle.secondary,
  onPressed: () {},
  child: const Text('Secondary Button'),
)
```

### Outline Button
```dart
AsButton(
  style: AsButtonStyle.outline,
  onPressed: () {},
  child: const Text('Outline Button'),
)
```

## Loading State

```dart
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AsButton(
      loading: _isLoading,
      onPressed: _isLoading ? null : () async {
        setState(() => _isLoading = true);
        
        // Simulate async operation
        await Future.delayed(const Duration(seconds: 2));
        
        setState(() => _isLoading = false);
      },
      child: const Text('Submit'),
    );
  }
}
```

## Custom Colors

```dart
AsButton(
  backgroundColor: Colors.green,
  foregroundColor: Colors.white,
  onPressed: () {},
  child: const Text('Custom Colors'),
)
```

## Disabled State

```dart
AsButton(
  onPressed: null, // null makes the button disabled
  child: const Text('Disabled Button'),
)
```

## Full Width Button

```dart
SizedBox(
  width: double.infinity,
  child: AsButton(
    onPressed: () {},
    child: const Text('Full Width Button'),
  ),
)
```

## API Reference

### Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `child` | `Widget` | required | The button's child widget (usually Text) |
| `onPressed` | `VoidCallback?` | required | Called when button is pressed. null disables the button |
| `style` | `AsButtonStyle?` | `AsButtonStyle.primary` | Visual style of the button |
| `loading` | `bool` | `false` | Shows loading spinner when true |
| `backgroundColor` | `Color?` | null | Custom background color |
| `foregroundColor` | `Color?` | null | Custom text/icon color |
| `borderRadius` | `BorderRadius?` | null | Custom border radius |
| `padding` | `EdgeInsetsGeometry?` | null | Custom padding |
| `elevation` | `double?` | null | Shadow elevation (Material only) |
| `semanticsLabel` | `String?` | null | Accessibility label |

### AsButtonStyle

- `AsButtonStyle.primary` - Filled button with primary color
- `AsButtonStyle.secondary` - Filled button with secondary color  
- `AsButtonStyle.outline` - Outlined button with transparent background
- `AsButtonStyle.text` - Text-only button with no background

## Platform Differences

### Material (Android/Web)
- Uses `ElevatedButton`, `OutlinedButton`, or `TextButton`
- Supports Material elevation and ripple effects
- Follows Material Design 3 guidelines

### Cupertino (iOS/macOS)
- Uses `CupertinoButton`
- iOS-style pressed state animation
- Follows iOS Human Interface Guidelines

## Accessibility

AsButton automatically includes:
- Proper semantic roles
- Touch target size enforcement (minimum 44x44 points)
- Focus and keyboard navigation support
- Screen reader compatibility

## Examples

### With Icon
```dart
AsButton(
  onPressed: () {},
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      const Icon(Icons.download),
      const SizedBox(width: 8),
      const Text('Download'),
    ],
  ),
)
```

### Rounded Button
```dart
AsButton(
  borderRadius: BorderRadius.circular(30),
  onPressed: () {},
  child: const Text('Rounded'),
)
```

### Large Button
```dart
AsButton(
  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
  onPressed: () {},
  child: const Text('Large Button'),
)
```

## See Also

- [AsIconButton](./as-icon-button) - For icon-only buttons
- [AsLinkButton](./as-link-button) - For text-based link buttons
- [Button Examples](https://ui.alphasow.dev/buttons) - Live demo