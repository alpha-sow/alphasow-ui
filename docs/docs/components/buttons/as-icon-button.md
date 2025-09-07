---
sidebar_position: 2
---

# AsIconButton

An icon-based button component that provides various styles including filled, outlined, ghost, and more with platform-adaptive styling.

## Import

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

## Basic Usage

```dart
AsIconButton(
  icon: Icons.favorite,
  onPressed: () {
    print('Icon button pressed!');
  },
)
```

## Button Styles

### Standard Icon Button (Default)
```dart
AsIconButton(
  icon: Icons.home,
  onPressed: () {},
)
```

### Filled Icon Button
```dart
AsIconButton.filled(
  icon: Icons.favorite,
  onPressed: () {},
)
```

### Outlined Icon Button
```dart
AsIconButton.outlined(
  icon: Icons.share,
  onPressed: () {},
)
```

### Ghost Icon Button
```dart
AsIconButton.ghost(
  icon: Icons.settings,
  onPressed: () {},
)
```

## Custom Colors

```dart
AsIconButton(
  icon: Icons.star,
  backgroundColor: Colors.amber,
  iconColor: Colors.white,
  onPressed: () {},
)
```

## Sizes

```dart
// Small icon button
AsIconButton(
  icon: Icons.add,
  size: AsIconButtonSize.small,
  onPressed: () {},
)

// Medium icon button (default)
AsIconButton(
  icon: Icons.add,
  size: AsIconButtonSize.medium,
  onPressed: () {},
)

// Large icon button
AsIconButton(
  icon: Icons.add,
  size: AsIconButtonSize.large,
  onPressed: () {},
)
```

## Disabled State

```dart
AsIconButton(
  icon: Icons.delete,
  onPressed: null, // null makes the button disabled
)
```

## API Reference

### Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `icon` | `IconData` | required | The icon to display |
| `onPressed` | `VoidCallback?` | required | Called when button is pressed. null disables the button |
| `size` | `AsIconButtonSize?` | `AsIconButtonSize.medium` | Size of the button |
| `backgroundColor` | `Color?` | null | Custom background color |
| `iconColor` | `Color?` | null | Custom icon color |
| `borderRadius` | `BorderRadius?` | null | Custom border radius |
| `tooltip` | `String?` | null | Tooltip message |
| `semanticsLabel` | `String?` | null | Accessibility label |

### AsIconButtonSize

- `AsIconButtonSize.small` - 32x32 points
- `AsIconButtonSize.medium` - 40x40 points (default)
- `AsIconButtonSize.large` - 48x48 points

## Examples

### With Tooltip
```dart
AsIconButton(
  icon: Icons.info,
  tooltip: 'Information',
  onPressed: () {},
)
```

### Custom Border Radius
```dart
AsIconButton.filled(
  icon: Icons.play_arrow,
  borderRadius: BorderRadius.circular(8),
  onPressed: () {},
)
```

### Loading State
```dart
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AsIconButton(
      icon: _isLoading ? Icons.hourglass_empty : Icons.refresh,
      onPressed: _isLoading ? null : () async {
        setState(() => _isLoading = true);
        await Future.delayed(const Duration(seconds: 2));
        setState(() => _isLoading = false);
      },
    );
  }
}
```

## Platform Differences

### Material (Android/Web)
- Uses `IconButton` with Material styling
- Supports Material ripple effects
- Material elevation for filled variants

### Cupertino (iOS/macOS)
- Uses `CupertinoButton` with icon
- iOS-style pressed state animation
- Follows iOS Human Interface Guidelines

## See Also

- [AsButton](./as-button) - For text-based buttons
- [AsLinkButton](./as-link-button) - For link-style buttons
- [Icon Button Examples](https://ui.alphasow.dev/buttons) - Live demo