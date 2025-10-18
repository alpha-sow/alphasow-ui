---
sidebar_position: 3
---

# AsForm

A form wrapper component that provides validation, state management, and form submission handling for form fields.

## Import

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

## Basic Usage

```dart
final formKey = GlobalKey<FormState>();

AsForm(
  formKey: formKey,
  child: Column(
    children: [
      AsTextFormField(
        label: 'Name',
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Name is required';
          }
          return null;
        },
      ),
      AsButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            // Form is valid
          }
        },
        child: Text('Submit'),
      ),
    ],
  ),
)
```

## With Auto-validation

```dart
AsForm(
  formKey: formKey,
  autovalidateMode: AutovalidateMode.onUserInteraction,
  child: Column(
    children: [
      AsTextFormField(
        label: 'Email',
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Email is required';
          }
          return null;
        },
      ),
    ],
  ),
)
```

## Complete Registration Form

```dart
class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AsForm(
      formKey: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          AsTextFormField(
            controller: _usernameController,
            label: 'Username',
            hintText: 'Choose a username',
            description: 'This is your public display name.',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Username is required';
              }
              if (value.length < 3) {
                return 'Username must be at least 3 characters';
              }
              if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
                return 'Only letters, numbers and underscores allowed';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          AsTextFormField(
            controller: _emailController,
            type: Type.email,
            label: 'Email Address',
            hintText: 'you@example.com',
            description: 'We will never share your email.',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          AsTextFormField(
            controller: _passwordController,
            type: Type.password,
            label: 'Password',
            hintText: 'Enter your password',
            description: 'Must be at least 8 characters.',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          AsTextFormField(
            type: Type.password,
            label: 'Confirm Password',
            hintText: 'Re-enter your password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != _passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          SizedBox(height: 24),
          Row(
            children: [
              AsButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    context.showBanner(
                      message: 'Form submitted successfully!',
                      type: AlertType.success,
                    );
                  } else {
                    context.showBanner(
                      message: 'Please fix the errors',
                      type: AlertType.error,
                    );
                  }
                },
                child: Text('Submit'),
              ),
              SizedBox(width: 16),
              AsButton.outlined(
                onPressed: () {
                  _formKey.currentState!.reset();
                  _usernameController.clear();
                  _emailController.clear();
                  _passwordController.clear();
                },
                child: Text('Reset'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```

## With onChange Callback

```dart
AsForm(
  formKey: formKey,
  onChanged: () {
    // Called whenever any field in the form changes
    print('Form changed');
  },
  child: Column(
    children: [
      AsTextFormField(label: 'Field 1'),
      AsTextFormField(label: 'Field 2'),
    ],
  ),
)
```

## API Reference

### Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `child` | `Widget` | required | The widget tree containing form fields |
| `formKey` | `GlobalKey<FormState>?` | null | Global key for accessing form state |
| `onChanged` | `VoidCallback?` | null | Called when any form field value changes |
| `autovalidateMode` | `AutovalidateMode?` | null | When to automatically validate form fields |
| `canPop` | `bool?` | null | Whether the form can be popped |
| `onPopInvokedWithResult` | `PopInvokedWithResultCallback<Object?>?` | null | Callback invoked when pop is attempted |

### AutovalidateMode Options

| Mode | Description |
|------|-------------|
| `AutovalidateMode.disabled` | Never auto-validate (default) |
| `AutovalidateMode.always` | Always validate after any change |
| `AutovalidateMode.onUserInteraction` | Validate only after user has interacted |

## Form State Methods

### Validate

```dart
if (_formKey.currentState!.validate()) {
  // All fields are valid
}
```

### Save

```dart
_formKey.currentState!.save();
// Calls onSaved callback on all form fields
```

### Reset

```dart
_formKey.currentState!.reset();
// Resets all form fields to initial values
```

## Examples

### Login Form

```dart
class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AsForm(
      formKey: _formKey,
      child: Column(
        children: [
          AsTextFormField(
            controller: _emailController,
            type: Type.email,
            label: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          AsTextFormField(
            controller: _passwordController,
            type: Type.password,
            label: 'Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              return null;
            },
          ),
          SizedBox(height: 24),
          AsButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                // Perform login
                await login(
                  _emailController.text,
                  _passwordController.text,
                );
              }
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
```

### Search Form

```dart
AsForm(
  formKey: formKey,
  child: Row(
    children: [
      Expanded(
        child: AsTextFormField(
          hintText: 'Search...',
          prefix: Icon(Icons.search),
        ),
      ),
      SizedBox(width: 8),
      AsButton(
        onPressed: () {
          // Perform search
        },
        child: Text('Search'),
      ),
    ],
  ),
)
```

## Best Practices

1. **Always use a GlobalKey** to access form state
2. **Validate before submitting** using `validate()`
3. **Save form data** using `save()` after validation
4. **Use autovalidateMode** for better UX
5. **Clear controllers** when resetting the form
6. **Dispose controllers** in the dispose method
7. **Show feedback** to users after form submission

## Platform Differences

### Material (Android/Web)
- Uses Flutter's built-in `Form` widget
- Material Design validation styling

### Cupertino (iOS/macOS)
- Uses Flutter's built-in `Form` widget
- iOS-style validation styling

## Common Patterns

### Conditional Validation

```dart
String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }
  if (!value.contains('@')) {
    return 'Please enter a valid email';
  }
  return null;
}

AsTextFormField(
  label: 'Email',
  validator: validateEmail,
)
```

### Multi-step Form

```dart
class MultiStepForm extends StatefulWidget {
  @override
  _MultiStepFormState createState() => _MultiStepFormState();
}

class _MultiStepFormState extends State<MultiStepForm> {
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return AsForm(
      formKey: _formKey,
      child: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          if (_formKey.currentState!.validate()) {
            setState(() => _currentStep++);
          }
        },
        steps: [
          Step(
            title: Text('Personal Info'),
            content: AsTextFormField(
              label: 'Name',
              validator: (value) =>
                value?.isEmpty ?? true ? 'Required' : null,
            ),
          ),
          Step(
            title: Text('Contact'),
            content: AsTextFormField(
              label: 'Email',
              type: Type.email,
              validator: (value) =>
                value?.isEmpty ?? true ? 'Required' : null,
            ),
          ),
        ],
      ),
    );
  }
}
```

## See Also

- [AsTextFormField](./as-text-form-field) - Form field with validation
- [AsTextField](./as-text-field) - Basic text field
- [Form Examples](https://ui.alphasow.dev/forms) - Live demo
