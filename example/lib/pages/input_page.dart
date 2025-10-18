import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController _textInputControl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _textInputControl.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Input',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        const Text(
          'Basic text fields without validation:',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        const AsTextField(hintText: 'Email'),
        const SizedBox(height: 10),
        const AsTextField(hintText: 'Email', disabled: true),
        const SizedBox(height: 10),
        const AsTextField(
          label: 'Username',
          hintText: 'alphasow_ui',
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Flexible(
              child: AsTextField(
                controller: _textInputControl,
                hintText: 'Enter text',
                onSubmitted: (_) =>
                    context.showBanner(message: _textInputControl.text),
              ),
            ),
            const SizedBox(width: 4),
            AsButton(
              child: const Text('Submit'),
              onPressed: () {
                context.showBanner(message: _textInputControl.text);
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        const AsTextField(
          hintText: 'With Prefix and Suffix Icons',
          suffix: Icon(Icons.person),
          prefix: Icon(Icons.email),
        ),
        const SizedBox(height: 30),
        Text(
          'Form with Validation',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const Text(
          'Complete registration form with real-time validation:',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 20),
        AsForm(
          formKey: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              AsTextFormField(
                controller: _usernameController,
                label: 'Username',
                hintText: 'alphasow_ui',
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
              const SizedBox(height: 10),
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
              const SizedBox(height: 10),
              AsTextFormField(
                controller: _passwordController,
                type: Type.password,
                label: 'Password',
                hintText: 'Enter your password',
                description:
                    'Must be at least 8 characters with uppercase and number.',
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
              ),
              const SizedBox(height: 10),
              AsTextFormField(
                controller: _confirmPasswordController,
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
              const SizedBox(height: 20),
              Row(
                children: [
                  AsButton(
                    child: const Text('Submit'),
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
                  ),
                  const SizedBox(width: 10),
                  AsButton.outlined(
                    onPressed: () {
                      _formKey.currentState!.reset();
                      _usernameController.clear();
                      _emailController.clear();
                      _passwordController.clear();
                      _confirmPasswordController.clear();
                    },
                    child: const Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
