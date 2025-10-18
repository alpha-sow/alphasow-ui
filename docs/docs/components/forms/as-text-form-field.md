---
sidebar_position: 2
---

# AsTextFormField

A form field component that wraps AsTextField with built-in validation support, form state management, and automatic error display.

## Import

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

## Basic Usage

```dart
AsTextFormField(
  label: 'Email',
  hintText: 'example@domain.com',
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    return null;
  },
)
```

## With Form Integration

```dart
class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AsForm(
      formKey: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          AsTextFormField(
            label: 'Username',
            hintText: 'Enter username',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Username is required';
              }
              if (value.length < 3) {
                return 'Username must be at least 3 characters';
              }
              return null;
            },
          ),
          AsButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // Form is valid
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
```

## Email Validation

```dart
AsTextFormField(
  type: Type.email,
  label: 'Email Address',
  hintText: 'you@example.com',
  description: 'We will never share your email.',
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  },
)
```

## Password Validation

```dart
AsTextFormField(
  type: Type.password,
  label: 'Password',
  hintText: 'Enter your password',
  description: 'Must be at least 8 characters with uppercase and number.',
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!RegExp('(?=.*[A-Z])').hasMatch(value)) {
      return 'Password must contain an uppercase letter';
    }
    if (!RegExp('(?=.*[0-9])').hasMatch(value)) {
      return 'Password must contain a number';
    }
    return null;
  },
)
```

## With Controller

```dart
class ControlledFormField extends StatefulWidget {
  @override
  _ControlledFormFieldState createState() => _ControlledFormFieldState();
}

class _ControlledFormFieldState extends State<ControlledFormField> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AsTextFormField(
          controller: _emailController,
          label: 'Email',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Email is required';
            }
            return null;
          },
        ),
        AsButton(
          onPressed: () {
            _emailController.clear();
          },
          child: Text('Clear'),
        ),
      ],
    );
  }
}
```

## With Prefix and Suffix

```dart
AsTextFormField(
  label: 'Search',
  hintText: 'Search users...',
  prefix: Icon(Icons.search),
  suffix: Icon(Icons.clear),
  validator: (value) => null, // Optional validation
)
```

## API Reference

### Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `controller` | `TextEditingController?` | null | Controls the text being edited |
| `label` | `String?` | null | Label text displayed above the field |
| `hintText` | `String?` | null | Hint text displayed when field is empty |
| `description` | `String?` | null | Description text displayed below the field |
| `type` | `Type?` | null | Preset input type (email, password) |
| `validator` | `String? Function(String?)?` | null | Form validation function |
| `onSaved` | `void Function(String?)?` | null | Called when form is saved |
| `initialValue` | `String?` | null | Initial value (cannot be used with controller) |
| `autovalidateMode` | `AutovalidateMode?` | null | When to automatically validate |
| `enabled` | `bool?` | null | Whether the field is enabled |
| `prefix` | `Widget?` | null | Widget displayed before the input |
| `suffix` | `Widget?` | null | Widget displayed after the input |
| `obscureText` | `bool?` | null | Whether to hide the text |
| `maxLines` | `int?` | 1 | Maximum number of lines |
| `onChanged` | `ValueChanged<String>?` | null | Called when text changes |

### Inherited from AsTextField

All properties from [AsTextField](./as-text-field) are also available.

## Validation Examples

### Required Field

```dart
validator: (value) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  }
  return null;
}
```

### Minimum Length

```dart
validator: (value) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  }
  if (value.length < 6) {
    return 'Must be at least 6 characters';
  }
  return null;
}
```

### Pattern Matching

```dart
validator: (value) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  }
  if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
    return 'Only letters, numbers and underscores allowed';
  }
  return null;
}
```

### Confirm Password

```dart
final passwordController = TextEditingController();

// Password field
AsTextFormField(
  controller: passwordController,
  type: Type.password,
  label: 'Password',
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  },
)

// Confirm password field
AsTextFormField(
  type: Type.password,
  label: 'Confirm Password',
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  },
)
```

## Platform Differences

### Material (Android/Web)
- Uses `TextFormField` with Material styling
- Error text displayed below field in red
- Material Design input decoration
- Material focus and error states

### Cupertino (iOS/macOS)
- Uses `CupertinoTextField` wrapped in FormField
- Error text displayed below field
- iOS-style input styling
- Native iOS keyboard behavior

## Best Practices

1. **Always provide validation** for required fields
2. **Use descriptive error messages** that tell users how to fix the issue
3. **Use `autovalidateMode`** for real-time feedback
4. **Dispose controllers** in the dispose method
5. **Use Type.email or Type.password** for automatic keyboard and behavior configuration

## See Also

- [AsForm](./as-form) - Form wrapper with validation
- [AsTextField](./as-text-field) - Basic text field without validation
- [AsCheckbox](./as-checkbox) - For boolean inputs
- [Form Examples](https://ui.alphasow.dev/forms) - Live demo
