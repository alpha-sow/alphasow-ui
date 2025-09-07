---
sidebar_position: 3
---

# AsLinkButton

A text-based button that appears as a clickable link with customizable styling and hover effects.

## Import

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

## Basic Usage

```dart
AsLinkButton(
  text: 'Click here',
  onPressed: () {
    print('Link button pressed!');
  },
)
```

## With Custom Styling

```dart
AsLinkButton(
  text: 'Custom Link',
  color: Colors.blue,
  fontSize: 16,
  fontWeight: FontWeight.w600,
  onPressed: () {},
)
```

## Underlined Link

```dart
AsLinkButton(
  text: 'Underlined Link',
  underline: true,
  onPressed: () {},
)
```

## External Link Style

```dart
AsLinkButton(
  text: 'External Link',
  external: true, // Adds external link icon
  onPressed: () {
    // Open external URL
  },
)
```

## Disabled State

```dart
AsLinkButton(
  text: 'Disabled Link',
  onPressed: null, // null makes the link disabled
)
```

## API Reference

### Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `text` | `String` | required | The text to display |
| `onPressed` | `VoidCallback?` | required | Called when button is pressed. null disables the button |
| `color` | `Color?` | null | Custom text color |
| `fontSize` | `double?` | null | Custom font size |
| `fontWeight` | `FontWeight?` | null | Custom font weight |
| `underline` | `bool` | `false` | Whether to show underline |
| `external` | `bool` | `false` | Whether to show external link icon |
| `semanticsLabel` | `String?` | null | Accessibility label |

## Examples

### Navigation Link
```dart
AsLinkButton(
  text: 'Go to Settings',
  onPressed: () {
    Navigator.pushNamed(context, '/settings');
  },
)
```

### URL Link
```dart
AsLinkButton(
  text: 'Visit Website',
  external: true,
  underline: true,
  onPressed: () async {
    const url = 'https://example.com';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  },
)
```

### Inline Link
```dart
RichText(
  text: TextSpan(
    text: 'By signing up, you agree to our ',
    style: TextStyle(color: Colors.black),
    children: [
      WidgetSpan(
        child: AsLinkButton(
          text: 'Terms of Service',
          fontSize: 14,
          onPressed: () {
            // Show terms
          },
        ),
      ),
    ],
  ),
)
```

### Custom Hover Effect
```dart
class CustomLinkButton extends StatefulWidget {
  @override
  _CustomLinkButtonState createState() => _CustomLinkButtonState();
}

class _CustomLinkButtonState extends State<CustomLinkButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AsLinkButton(
        text: 'Hover Me',
        color: _isHovering ? Colors.blue : Colors.grey,
        underline: _isHovering,
        onPressed: () {},
      ),
    );
  }
}
```

## Platform Differences

### Material (Android/Web)
- Uses Material text button styling
- Material hover and focus effects
- Follows Material Design guidelines

### Cupertino (iOS/macOS)
- Uses Cupertino button styling
- iOS-style pressed state
- Follows iOS Human Interface Guidelines

## See Also

- [AsButton](./as-button) - For standard buttons
- [AsIconButton](./as-icon-button) - For icon-only buttons
- [Link Button Examples](https://ui.alphasow.dev/buttons) - Live demo