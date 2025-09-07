---
sidebar_position: 4
---

# Système de Bannières

Le système de bannières global fournit des overlays de notification à l'échelle de l'application qui apparaissent en haut de l'écran pour afficher des messages importants.

## Import

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

## Configuration

Le système de bannières est automatiquement disponible lorsque vous enveloppez votre application avec `AlphasowUiApp` :

```dart
AlphasowUiApp(
  home: MyHomePage(),
)
```

## Utilisation de Base

```dart
context.showBanner(
  message: 'Opération terminée avec succès !',
  type: AlertType.success,
)
```

## Types de Bannières

### Bannière de Succès
```dart
context.showBanner(
  message: 'Vos modifications ont été sauvegardées',
  type: AlertType.success,
)
```

### Bannière d'Erreur
```dart
context.showBanner(
  message: 'Échec de connexion au serveur',
  type: AlertType.error,
)
```

### Warning Banner
```dart
context.showBanner(
  message: 'Your session will expire in 5 minutes',
  type: AlertType.warning,
)
```

### Info Banner
```dart
context.showBanner(
  message: 'New features are available',
  type: AlertType.info,
)
```

## Advanced Configuration

### Custom Duration
```dart
context.showBanner(
  message: 'This banner will disappear quickly',
  type: AlertType.info,
  duration: Duration(seconds: 2),
)
```

### With Action
```dart
context.showBanner(
  message: 'Connection lost',
  type: AlertType.warning,
  action: BannerAction(
    text: 'Retry',
    onPressed: () {
      _retryConnection();
    },
  ),
)
```

### Custom Animation
```dart
context.showBanner(
  message: 'Custom animated banner',
  type: AlertType.success,
  animation: BannerAnimationType.slideDown,
)
```

### Persistent Banner
```dart
context.showBanner(
  message: 'This banner stays until manually dismissed',
  type: AlertType.warning,
  persistent: true,
)
```

## API Reference

### showBanner Parameters

| Parameter | Type | Default | Description |
|----------|------|---------|-------------|
| `message` | `String` | required | The message to display |
| `type` | `AlertType` | required | Banner type/severity |
| `duration` | `Duration?` | `Duration(seconds: 4)` | Auto-dismiss duration |
| `action` | `BannerAction?` | null | Optional action button |
| `animation` | `BannerAnimationType?` | `BannerAnimationType.slideDown` | Animation type |
| `persistent` | `bool` | `false` | Whether banner stays until dismissed |
| `onDismiss` | `VoidCallback?` | null | Called when banner is dismissed |

### BannerAction Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `text` | `String` | required | Action button text |
| `onPressed` | `VoidCallback` | required | Action callback |

### BannerAnimationType

- `BannerAnimationType.slideDown` - Slide down from top (default)
- `BannerAnimationType.fade` - Fade in/out
- `BannerAnimationType.scale` - Scale from center
- `BannerAnimationType.combined` - Slide + fade + scale
- `BannerAnimationType.none` - No animation

## Examples

### Network Status Banners
```dart
class NetworkService {
  static void showConnected(BuildContext context) {
    context.showBanner(
      message: 'Connected to internet',
      type: AlertType.success,
      duration: Duration(seconds: 2),
    );
  }

  static void showDisconnected(BuildContext context) {
    context.showBanner(
      message: 'No internet connection',
      type: AlertType.error,
      persistent: true,
      action: BannerAction(
        text: 'Retry',
        onPressed: () => _retryConnection(),
      ),
    );
  }
}
```

### Form Validation Banners
```dart
class FormValidator {
  static void showValidationError(BuildContext context, String message) {
    context.showBanner(
      message: message,
      type: AlertType.error,
      duration: Duration(seconds: 3),
    );
  }

  static void showSuccess(BuildContext context) {
    context.showBanner(
      message: 'Form submitted successfully!',
      type: AlertType.success,
      animation: BannerAnimationType.scale,
    );
  }
}

// Usage
void _submitForm() {
  if (_validateForm()) {
    FormValidator.showSuccess(context);
  } else {
    FormValidator.showValidationError(context, 'Please fix the errors above');
  }
}
```

### Update Available Banner
```dart
void _showUpdateBanner() {
  context.showBanner(
    message: 'A new version is available',
    type: AlertType.info,
    persistent: true,
    action: BannerAction(
      text: 'Update',
      onPressed: () {
        _startUpdate();
      },
    ),
    onDismiss: () {
      _deferUpdate();
    },
  );
}
```

### Progress Banners
```dart
class ProgressBanners {
  static void showUploading(BuildContext context) {
    context.showBanner(
      message: 'Uploading files...',
      type: AlertType.info,
      persistent: true,
    );
  }

  static void showUploadComplete(BuildContext context) {
    // Dismiss any existing banners first
    context.dismissBanner();
    
    context.showBanner(
      message: 'Upload completed successfully!',
      type: AlertType.success,
    );
  }

  static void showUploadFailed(BuildContext context, String error) {
    context.dismissBanner();
    
    context.showBanner(
      message: 'Upload failed: $error',
      type: AlertType.error,
      action: BannerAction(
        text: 'Retry',
        onPressed: () => _retryUpload(),
      ),
    );
  }
}
```

### Multiple Banners Queue
```dart
class BannerQueue {
  static final List<BannerData> _queue = [];
  static bool _isShowing = false;

  static void add(BuildContext context, BannerData banner) {
    _queue.add(banner);
    _processQueue(context);
  }

  static void _processQueue(BuildContext context) async {
    if (_isShowing || _queue.isEmpty) return;
    
    _isShowing = true;
    final banner = _queue.removeAt(0);
    
    context.showBanner(
      message: banner.message,
      type: banner.type,
      duration: banner.duration,
      onDismiss: () {
        _isShowing = false;
        _processQueue(context);
      },
    );
  }
}
```

### Themed Banners
```dart
void _showThemedBanner() {
  context.showBanner(
    message: 'Custom themed banner',
    type: AlertType.info,
    // Banner automatically adapts to current theme
  );
}
```

## Best Practices

1. **Use appropriate types** - Match banner type to message severity
2. **Keep messages concise** - Short, clear messages work best
3. **Don't overuse** - Too many banners can be annoying
4. **Provide actions** - Include retry/undo actions when applicable
5. **Consider timing** - Use appropriate durations for different messages
6. **Queue management** - Avoid showing multiple banners simultaneously

## Platform Differences

### Material (Android/Web)
- Material Design banner styling
- Material color scheme and typography
- Material animations

### Cupertino (iOS/macOS)
- iOS-style banner appearance
- Cupertino color scheme
- Native iOS animations

## Troubleshooting

### Banner Not Showing
- Ensure your app is wrapped with `AlphasowUiApp`
- Check that you're calling `showBanner` with a valid `BuildContext`

### Multiple Banners
- Only one banner is shown at a time by default
- Previous banners are automatically dismissed when new ones appear
- Use a queue system if you need to show multiple messages

## See Also

- [AsAlertBanner](./as-alert-banner) - For inline banners
- [AsAlertDialog](./as-alert-dialog) - For modal alerts
- [Banner Examples](https://ui.alphasow.dev/alerts) - Live demo