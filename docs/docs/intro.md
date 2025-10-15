---
sidebar_position: 1
---

# Getting Started with Alphasow UI

Welcome to **Alphasow UI** - a comprehensive Flutter package providing reusable UI components with consistent theming and platform adaptation.

## What is Alphasow UI?

Alphasow UI is a Flutter package that offers:

- 🎨 **Consistent Theming** - Centralized theme system with dark/light mode support
- 📱 **Platform Adaptive** - Automatic Material/Cupertino styling based on platform
- 🔔 **Banner System** - Built-in notification overlay system
- 🧩 **Comprehensive Components** - Buttons, inputs, alerts, loaders, menus, and more
- 🌍 **Accessibility** - Built-in accessibility support across all components

## What you'll need

- [Flutter SDK](https://flutter.dev/docs/get-started/install) version **3.16.0** or above
- [Dart SDK](https://dart.dev/get-dart) version **3.5.3** or above

## Installation

Add Alphasow UI to your Flutter project by adding it to your `pubspec.yaml` file:

```yaml
dependencies:
  alphasow_ui: ^1.24.0
```

Then run:

```bash
flutter pub get
```

## Quick Start

### 1. Wrap your app with AlphasowUiApp

To enable all Alphasow UI features, wrap your application with `AlphasowUiApp`:

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlphasowUiApp(
      title: 'My App',
      home: const HomePage(),
    );
  }
}
```

### 2. Start using components

Now you can use any Alphasow UI component in your app:

```dart
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AsScaffold(
      appBar: AsAppBar(
        title: const Text('Welcome to Alphasow UI'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Primary Button
            AsButton(
              onPressed: () {
                context.showBanner(
                  message: 'Hello from Alphasow UI!',
                  type: AlertType.success,
                );
              },
              child: const Text('Show Success Banner'),
            ),
            
            const SizedBox(height: 16),
            
            // Text Field
            const AsTextField(
              labelText: 'Enter your name',
              hintText: 'John Doe',
            ),
            
            const SizedBox(height: 16),
            
            // Loading Spinner
            const AsLoadingSpinner(),
          ],
        ),
      ),
    );
  }
}
```

### 3. Platform Adaptation

Alphasow UI automatically adapts to your platform:

- **iOS/macOS**: Uses Cupertino styling
- **Android/Web**: Uses Material Design styling

No additional configuration needed - it works out of the box!

## Next Steps

- 📖 [Explore Components](./components/overview) - Learn about all available components
- 🌐 [Live Demo](https://ui.alphasow.dev) - See components in action

## Need Help?

- 📚 Browse the [component documentation](./components/overview)
- 🐛 Report issues on [GitHub](https://github.com/alpha-sow/alphasow-ui/issues)
- 💡 Check out our [contributing guide](https://github.com/alpha-sow/alphasow-ui/blob/main/CONTRIBUTING.md)
