---
sidebar_position: 1
---

# AsAlertBanner

An inline banner component for displaying alerts, notifications, and status messages with different severity levels.

## Import

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

## Basic Usage

```dart
AsAlertBanner(
  message: 'This is an informational message',
  type: AlertType.info,
)
```

## Alert Types

### Info Banner
```dart
AsAlertBanner(
  message: 'Information: Your profile has been updated',
  type: AlertType.info,
)
```

### Success Banner
```dart
AsAlertBanner(
  message: 'Success: Your changes have been saved',
  type: AlertType.success,
)
```

### Warning Banner
```dart
AsAlertBanner(
  message: 'Warning: This action cannot be undone',
  type: AlertType.warning,
)
```

### Error Banner
```dart
AsAlertBanner(
  message: 'Error: Failed to save your changes',
  type: AlertType.error,
)
```

## With Action Button

```dart
AsAlertBanner(
  message: 'Your session will expire soon',
  type: AlertType.warning,
  action: AsLinkButton(
    text: 'Extend Session',
    onPressed: () {
      // Handle session extension
    },
  ),
)
```

## Dismissible Banner

```dart
class DismissibleBanner extends StatefulWidget {
  @override
  _DismissibleBannerState createState() => _DismissibleBannerState();
}

class _DismissibleBannerState extends State<DismissibleBanner> {
  bool _showBanner = true;

  @override
  Widget build(BuildContext context) {
    if (!_showBanner) return SizedBox.shrink();
    
    return AsAlertBanner(
      message: 'This banner can be dismissed',
      type: AlertType.info,
      onDismiss: () {
        setState(() {
          _showBanner = false;
        });
      },
    );
  }
}
```

## API Reference

### Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `message` | `String` | required | The message to display |
| `type` | `AlertType` | required | The type/severity of the alert |
| `action` | `Widget?` | null | Optional action button or widget |
| `onDismiss` | `VoidCallback?` | null | Called when dismiss button is pressed |
| `icon` | `IconData?` | null | Custom icon (overrides default type icon) |
| `backgroundColor` | `Color?` | null | Custom background color |
| `textColor` | `Color?` | null | Custom text color |
| `borderRadius` | `BorderRadius?` | null | Custom border radius |

### AlertType

- `AlertType.info` - Blue color scheme with info icon
- `AlertType.success` - Green color scheme with check icon  
- `AlertType.warning` - Orange color scheme with warning icon
- `AlertType.error` - Red color scheme with error icon

## Examples

### Custom Styled Banner
```dart
AsAlertBanner(
  message: 'Custom styled banner',
  type: AlertType.info,
  backgroundColor: Colors.purple.shade100,
  textColor: Colors.purple.shade800,
  icon: Icons.star,
)
```

### Multiple Actions
```dart
AsAlertBanner(
  message: 'Multiple actions available',
  type: AlertType.warning,
  action: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      AsLinkButton(
        text: 'Cancel',
        onPressed: () {},
      ),
      SizedBox(width: 16),
      AsButton(
        style: AsButtonStyle.secondary,
        onPressed: () {},
        child: Text('Confirm'),
      ),
    ],
  ),
)
```

### Form Validation Banner
```dart
class FormWithBanner extends StatefulWidget {
  @override
  _FormWithBannerState createState() => _FormWithBannerState();
}

class _FormWithBannerState extends State<FormWithBanner> {
  String? _errorMessage;
  String? _successMessage;

  void _submitForm() {
    setState(() {
      _errorMessage = null;
      _successMessage = null;
    });

    // Simulate form submission
    if (/* validation fails */) {
      setState(() {
        _errorMessage = 'Please fix the errors below';
      });
    } else {
      setState(() {
        _successMessage = 'Form submitted successfully!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_errorMessage != null)
          AsAlertBanner(
            message: _errorMessage!,
            type: AlertType.error,
            onDismiss: () {
              setState(() => _errorMessage = null);
            },
          ),
        if (_successMessage != null)
          AsAlertBanner(
            message: _successMessage!,
            type: AlertType.success,
            onDismiss: () {
              setState(() => _successMessage = null);
            },
          ),
        // Form fields here
        AsButton(
          onPressed: _submitForm,
          child: Text('Submit'),
        ),
      ],
    );
  }
}
```

### Animated Banner
```dart
class AnimatedBanner extends StatefulWidget {
  @override
  _AnimatedBannerState createState() => _AnimatedBannerState();
}

class _AnimatedBannerState extends State<AnimatedBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: AsAlertBanner(
            message: 'Animated banner',
            type: AlertType.success,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
```

## Platform Differences

### Material (Android/Web)
- Material Design alert styling
- Material color scheme
- Material icons and typography

### Cupertino (iOS/macOS)
- iOS-style alert appearance
- Cupertino color scheme
- iOS system icons

## See Also

- [AsAlertDialog](./as-alert-dialog) - For modal alerts
- [AsBottomSheet](./as-bottom-sheet) - For bottom sheet alerts
- [Banner System](./banner-system) - For global overlay banners
- [Alert Examples](https://ui.alphasow.dev/alerts) - Live demo