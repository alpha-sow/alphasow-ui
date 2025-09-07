---
sidebar_position: 1
---

# AsTextField

A versatile text input component with platform-adaptive styling, validation support, and customizable appearance.

## Import

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

## Basic Usage

```dart
AsTextField(
  labelText: 'Enter your name',
  onChanged: (value) {
    print('Text changed: $value');
  },
)
```

## With Hint and Helper Text

```dart
AsTextField(
  labelText: 'Email',
  hintText: 'example@domain.com',
  helperText: 'We will never share your email',
  onChanged: (value) {},
)
```

## Password Field

```dart
AsTextField(
  labelText: 'Password',
  obscureText: true,
  suffixIcon: Icons.visibility,
  onChanged: (value) {},
)
```

## With Validation

```dart
class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AsTextField(
            labelText: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an email';
              }
              if (!value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
            onChanged: (value) {},
          ),
          AsButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
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

## Multiline Text Field

```dart
AsTextField(
  labelText: 'Description',
  maxLines: 4,
  minLines: 2,
  onChanged: (value) {},
)
```

## With Prefix and Suffix

```dart
AsTextField(
  labelText: 'Phone',
  prefixIcon: Icons.phone,
  suffixText: 'Required',
  keyboardType: TextInputType.phone,
  onChanged: (value) {},
)
```

## API Reference

### Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `controller` | `TextEditingController?` | null | Controls the text being edited |
| `labelText` | `String?` | null | Label text displayed above the field |
| `hintText` | `String?` | null | Hint text displayed when field is empty |
| `helperText` | `String?` | null | Helper text displayed below the field |
| `errorText` | `String?` | null | Error text displayed when validation fails |
| `obscureText` | `bool` | `false` | Whether to hide the text being edited |
| `enabled` | `bool` | `true` | Whether the text field is enabled |
| `readOnly` | `bool` | `false` | Whether the text field is read-only |
| `maxLines` | `int?` | `1` | Maximum number of lines |
| `minLines` | `int?` | null | Minimum number of lines |
| `maxLength` | `int?` | null | Maximum number of characters |
| `keyboardType` | `TextInputType?` | null | Type of keyboard to show |
| `textInputAction` | `TextInputAction?` | null | Action button on the keyboard |
| `validator` | `String? Function(String?)?` | null | Form validation function |
| `onChanged` | `ValueChanged<String>?` | null | Called when text changes |
| `onSubmitted` | `ValueChanged<String>?` | null | Called when user submits |
| `prefixIcon` | `IconData?` | null | Icon displayed at the start |
| `suffixIcon` | `IconData?` | null | Icon displayed at the end |
| `prefixText` | `String?` | null | Text displayed at the start |
| `suffixText` | `String?` | null | Text displayed at the end |

## Examples

### Search Field
```dart
AsTextField(
  labelText: 'Search',
  prefixIcon: Icons.search,
  hintText: 'Search for items...',
  onChanged: (value) {
    // Perform search
  },
)
```

### Number Input
```dart
AsTextField(
  labelText: 'Age',
  keyboardType: TextInputType.number,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your age';
    }
    final age = int.tryParse(value);
    if (age == null || age < 0 || age > 150) {
      return 'Please enter a valid age';
    }
    return null;
  },
  onChanged: (value) {},
)
```

### Currency Input
```dart
AsTextField(
  labelText: 'Price',
  prefixText: '\$',
  keyboardType: TextInputType.numberWithOptions(decimal: true),
  onChanged: (value) {},
)
```

### Controlled Input
```dart
class ControlledTextField extends StatefulWidget {
  @override
  _ControlledTextFieldState createState() => _ControlledTextFieldState();
}

class _ControlledTextFieldState extends State<ControlledTextField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AsTextField(
          controller: _controller,
          labelText: 'Controlled Input',
          onChanged: (value) {},
        ),
        AsButton(
          onPressed: () {
            _controller.clear();
          },
          child: Text('Clear'),
        ),
      ],
    );
  }
}
```

## Platform Differences

### Material (Android/Web)
- Uses `TextFormField` with Material styling
- Material Design input decoration
- Material focus and error states

### Cupertino (iOS/macOS)
- Uses `CupertinoTextFormFieldRow`
- iOS-style input styling
- Native iOS keyboard behavior

## See Also

- [AsCheckbox](./as-checkbox) - For boolean inputs
- [Form Examples](https://ui.alphasow.dev/forms) - Live demo