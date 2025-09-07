---
sidebar_position: 1
---

# AsLoadingSpinner

A customizable loading spinner component for indicating loading states.

## Import

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

## Basic Usage

```dart
AsLoadingSpinner()
```

## Custom Size and Color

```dart
AsLoadingSpinner(
  size: 32,
  color: Colors.blue,
)
```

## API Reference

### Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `size` | `double?` | `24` | Size of the spinner |
| `color` | `Color?` | null | Color of the spinner |
| `strokeWidth` | `double?` | `2.0` | Width of the spinner stroke |

## Examples

### In Button
```dart
AsButton(
  loading: isLoading,
  onPressed: isLoading ? null : () async {
    setState(() => isLoading = true);
    await performAsyncOperation();
    setState(() => isLoading = false);
  },
  child: Text('Submit'),
)
```

### Centered Loading
```dart
Center(
  child: AsLoadingSpinner(
    size: 48,
    color: Theme.of(context).primaryColor,
  ),
)
```

## See Also

- [AsLoadingCircular](./as-loading-circular) - For circular progress indicator
- [Loader Examples](https://ui.alphasow.dev/loaders) - Live demo