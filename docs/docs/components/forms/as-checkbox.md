---
sidebar_position: 2
---

# AsCheckbox

A checkbox component with customizable styling and platform-adaptive appearance for boolean input.

## Import

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

## Basic Usage

```dart
bool isChecked = false;

AsCheckbox(
  value: isChecked,
  onChanged: (value) {
    setState(() {
      isChecked = value ?? false;
    });
  },
)
```

## With Label

```dart
bool acceptTerms = false;

AsCheckbox(
  value: acceptTerms,
  label: 'I accept the terms and conditions',
  onChanged: (value) {
    setState(() {
      acceptTerms = value ?? false;
    });
  },
)
```

## Tristate Checkbox

```dart
bool? triState = null; // null = indeterminate, true = checked, false = unchecked

AsCheckbox(
  value: triState,
  tristate: true,
  onChanged: (value) {
    setState(() {
      triState = value;
    });
  },
)
```

## Disabled Checkbox

```dart
AsCheckbox(
  value: true,
  onChanged: null, // null makes the checkbox disabled
  label: 'Disabled checkbox',
)
```

## API Reference

### Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `value` | `bool?` | required | Current state of the checkbox |
| `onChanged` | `ValueChanged<bool?>?` | required | Called when checkbox state changes. null disables the checkbox |
| `label` | `String?` | null | Text label displayed next to checkbox |
| `tristate` | `bool` | `false` | Whether checkbox supports indeterminate state |
| `activeColor` | `Color?` | null | Color when checkbox is checked |
| `checkColor` | `Color?` | null | Color of the check mark |
| `focusColor` | `Color?` | null | Color when checkbox has focus |
| `hoverColor` | `Color?` | null | Color when checkbox is hovered |
| `semanticsLabel` | `String?` | null | Accessibility label |

## Examples

### Form Checkbox List
```dart
class CheckboxForm extends StatefulWidget {
  @override
  _CheckboxFormState createState() => _CheckboxFormState();
}

class _CheckboxFormState extends State<CheckboxForm> {
  Map<String, bool> preferences = {
    'notifications': false,
    'newsletter': false,
    'marketing': false,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AsCheckbox(
          value: preferences['notifications'],
          label: 'Enable notifications',
          onChanged: (value) {
            setState(() {
              preferences['notifications'] = value ?? false;
            });
          },
        ),
        AsCheckbox(
          value: preferences['newsletter'],
          label: 'Subscribe to newsletter',
          onChanged: (value) {
            setState(() {
              preferences['newsletter'] = value ?? false;
            });
          },
        ),
        AsCheckbox(
          value: preferences['marketing'],
          label: 'Receive marketing emails',
          onChanged: (value) {
            setState(() {
              preferences['marketing'] = value ?? false;
            });
          },
        ),
      ],
    );
  }
}
```

### Select All Checkbox
```dart
class SelectAllCheckbox extends StatefulWidget {
  @override
  _SelectAllCheckboxState createState() => _SelectAllCheckboxState();
}

class _SelectAllCheckboxState extends State<SelectAllCheckbox> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  Set<String> selectedItems = {};

  bool? get selectAllValue {
    if (selectedItems.isEmpty) return false;
    if (selectedItems.length == items.length) return true;
    return null; // Indeterminate
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AsCheckbox(
          value: selectAllValue,
          tristate: true,
          label: 'Select All',
          onChanged: (value) {
            setState(() {
              if (value == true) {
                selectedItems = Set.from(items);
              } else {
                selectedItems.clear();
              }
            });
          },
        ),
        Divider(),
        ...items.map((item) => AsCheckbox(
          value: selectedItems.contains(item),
          label: item,
          onChanged: (value) {
            setState(() {
              if (value == true) {
                selectedItems.add(item);
              } else {
                selectedItems.remove(item);
              }
            });
          },
        )),
      ],
    );
  }
}
```

### Custom Colors
```dart
AsCheckbox(
  value: isChecked,
  activeColor: Colors.green,
  checkColor: Colors.white,
  label: 'Custom styled checkbox',
  onChanged: (value) {
    setState(() {
      isChecked = value ?? false;
    });
  },
)
```

### Agreement Checkbox
```dart
bool agreedToTerms = false;

Column(
  children: [
    AsCheckbox(
      value: agreedToTerms,
      onChanged: (value) {
        setState(() {
          agreedToTerms = value ?? false;
        });
      },
      label: 'I have read and agree to the Terms of Service',
    ),
    AsButton(
      onPressed: agreedToTerms ? () {
        // Proceed with registration
      } : null,
      child: Text('Register'),
    ),
  ],
)
```

## Platform Differences

### Material (Android/Web)
- Uses `Checkbox` with Material styling
- Material ripple effects
- Material Design color scheme

### Cupertino (iOS/macOS)
- Uses `CupertinoSwitch` styled as checkbox
- iOS-style animations
- Follows iOS Human Interface Guidelines

## Accessibility

AsCheckbox automatically includes:
- Proper semantic roles for screen readers
- Keyboard navigation support
- Focus indicators
- State announcements

## See Also

- [AsTextField](./as-text-field) - For text input
- [Form Examples](https://ui.alphasow.dev/forms) - Live demo