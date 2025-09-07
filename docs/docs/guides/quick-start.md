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

## Key Features Enabled

By using `AlphasowUiApp`, you automatically get:

- **Platform adaptation** - Components switch between Material and Cupertino styles
- **Banner system** - Global notification overlay via `context.showBanner()`
- **Consistent theming** - Centralized theme management
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