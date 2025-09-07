---
sidebar_position: 2
---

# AsLoadingCircular

A circular progress indicator component for showing determinate or indeterminate progress.

## Import

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

## Basic Usage (Indeterminate)

```dart
AsLoadingCircular()
```

## Progress Indicator (Determinate)

```dart
AsLoadingCircular(
  value: 0.7, // 70% progress
)
```

## API Reference

### Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `value` | `double?` | null | Progress value (0.0 to 1.0). null for indeterminate |
| `size` | `double?` | `24` | Size of the indicator |
| `color` | `Color?` | null | Color of the indicator |
| `backgroundColor` | `Color?` | null | Background color |
| `strokeWidth` | `double?` | `4.0` | Width of the progress stroke |

## Examples

### Progress Bar
```dart
class ProgressExample extends StatefulWidget {
  @override
  _ProgressExampleState createState() => _ProgressExampleState();
}

class _ProgressExampleState extends State<ProgressExample> {
  double _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AsLoadingCircular(
          value: _progress,
          size: 64,
        ),
        SizedBox(height: 16),
        Text('${(_progress * 100).round()}%'),
        SizedBox(height: 16),
        AsButton(
          onPressed: () {
            setState(() => _progress = (_progress + 0.1).clamp(0.0, 1.0));
          },
          child: Text('Increment'),
        ),
      ],
    );
  }
}
```

## See Also

- [AsLoadingSpinner](./as-loading-spinner) - For simple spinners
- [Loader Examples](https://ui.alphasow.dev/loaders) - Live demo