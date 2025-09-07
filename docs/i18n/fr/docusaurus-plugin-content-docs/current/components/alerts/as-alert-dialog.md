---
sidebar_position: 2
---

# AsAlertDialog

A modal dialog component for displaying important messages, confirmations, and user interactions.

## Import

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

## Basic Usage

```dart
AsAlertDialog.show(
  context: context,
  title: 'Confirmation',
  message: 'Are you sure you want to continue?',
  actions: [
    AsAlertDialogAction(
      text: 'Cancel',
      onPressed: () => Navigator.of(context).pop(),
    ),
    AsAlertDialogAction(
      text: 'Continue',
      isDestructive: true,
      onPressed: () {
        Navigator.of(context).pop();
        // Handle continue action
      },
    ),
  ],
)
```

## Information Dialog

```dart
AsAlertDialog.show(
  context: context,
  title: 'Information',
  message: 'Your profile has been successfully updated.',
  actions: [
    AsAlertDialogAction(
      text: 'OK',
      onPressed: () => Navigator.of(context).pop(),
    ),
  ],
)
```

## Confirmation Dialog

```dart
void _showDeleteConfirmation() {
  AsAlertDialog.show(
    context: context,
    title: 'Delete Item',
    message: 'This action cannot be undone. Are you sure you want to delete this item?',
    type: AlertType.error,
    actions: [
      AsAlertDialogAction(
        text: 'Cancel',
        onPressed: () => Navigator.of(context).pop(false),
      ),
      AsAlertDialogAction(
        text: 'Delete',
        isDestructive: true,
        onPressed: () {
          Navigator.of(context).pop(true);
          _deleteItem();
        },
      ),
    ],
  ).then((confirmed) {
    if (confirmed == true) {
      // Item was deleted
    }
  });
}
```

## Custom Dialog

```dart
AsAlertDialog(
  title: Text('Custom Dialog'),
  content: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text('This is a custom dialog with multiple widgets'),
      SizedBox(height: 16),
      AsTextField(
        labelText: 'Enter value',
        onChanged: (value) {},
      ),
    ],
  ),
  actions: [
    AsAlertDialogAction(
      text: 'Cancel',
      onPressed: () => Navigator.of(context).pop(),
    ),
    AsAlertDialogAction(
      text: 'Save',
      onPressed: () => Navigator.of(context).pop(),
    ),
  ],
)
```

## API Reference

### AsAlertDialog Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `title` | `Widget?` | null | Dialog title widget |
| `content` | `Widget?` | null | Dialog content widget |
| `actions` | `List<Widget>?` | null | List of action buttons |
| `type` | `AlertType?` | null | Alert type for styling |
| `barrierDismissible` | `bool` | `true` | Whether dialog can be dismissed by tapping outside |

### AsAlertDialog.show Parameters

| Parameter | Type | Default | Description |
|----------|------|---------|-------------|
| `context` | `BuildContext` | required | Build context |
| `title` | `String?` | null | Dialog title text |
| `message` | `String?` | null | Dialog message text |
| `type` | `AlertType?` | null | Alert type for styling |
| `actions` | `List<AsAlertDialogAction>?` | null | List of action buttons |
| `barrierDismissible` | `bool` | `true` | Whether dialog can be dismissed by tapping outside |

### AsAlertDialogAction Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `text` | `String` | required | Button text |
| `onPressed` | `VoidCallback?` | required | Button press callback |
| `isDestructive` | `bool` | `false` | Whether action is destructive (uses warning colors) |
| `isDefault` | `bool` | `false` | Whether action is the default action |

## Examples

### Loading Dialog
```dart
class LoadingDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AsAlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AsLoadingSpinner(),
            SizedBox(height: 16),
            Text('Loading...'),
          ],
        ),
      ),
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context).pop();
  }
}

// Usage
void _performAsyncOperation() async {
  LoadingDialog.show(context);
  try {
    await someAsyncOperation();
    LoadingDialog.hide(context);
    // Show success
  } catch (e) {
    LoadingDialog.hide(context);
    // Show error
  }
}
```

### Input Dialog
```dart
Future<String?> _showInputDialog() {
  final controller = TextEditingController();
  
  return showDialog<String>(
    context: context,
    builder: (context) => AsAlertDialog(
      title: Text('Enter Name'),
      content: AsTextField(
        controller: controller,
        labelText: 'Name',
        autofocus: true,
      ),
      actions: [
        AsAlertDialogAction(
          text: 'Cancel',
          onPressed: () => Navigator.of(context).pop(),
        ),
        AsAlertDialogAction(
          text: 'Save',
          isDefault: true,
          onPressed: () => Navigator.of(context).pop(controller.text),
        ),
      ],
    ),
  );
}
```

### Choice Dialog
```dart
Future<String?> _showChoiceDialog() {
  return AsAlertDialog.show(
    context: context,
    title: 'Choose Option',
    message: 'Please select one of the following options:',
    actions: [
      AsAlertDialogAction(
        text: 'Option A',
        onPressed: () => Navigator.of(context).pop('A'),
      ),
      AsAlertDialogAction(
        text: 'Option B',
        onPressed: () => Navigator.of(context).pop('B'),
      ),
      AsAlertDialogAction(
        text: 'Cancel',
        onPressed: () => Navigator.of(context).pop(),
      ),
    ],
  );
}
```

### Error Dialog with Details
```dart
void _showErrorDialog(String error, String details) {
  AsAlertDialog.show(
    context: context,
    title: 'Error Occurred',
    message: error,
    type: AlertType.error,
    actions: [
      AsAlertDialogAction(
        text: 'Details',
        onPressed: () {
          Navigator.of(context).pop();
          _showDetailDialog(details);
        },
      ),
      AsAlertDialogAction(
        text: 'OK',
        isDefault: true,
        onPressed: () => Navigator.of(context).pop(),
      ),
    ],
  );
}
```

## Platform Differences

### Material (Android/Web)
- Uses `AlertDialog` with Material styling
- Material Design button layout
- Material animations and transitions

### Cupertino (iOS/macOS)
- Uses `CupertinoAlertDialog`
- iOS-style button layout and spacing
- Native iOS animations

## Best Practices

1. **Use sparingly** - Dialogs interrupt user flow
2. **Clear actions** - Use descriptive button labels
3. **Destructive actions** - Mark dangerous actions with `isDestructive: true`
4. **Default action** - Mark primary action with `isDefault: true`
5. **Barrier dismissible** - Allow users to dismiss non-critical dialogs

## See Also

- [AsAlertBanner](./as-alert-banner) - For inline alerts
- [AsBottomSheet](./as-bottom-sheet) - For bottom sheet modals
- [Dialog Examples](https://ui.alphasow.dev/alerts) - Live demo