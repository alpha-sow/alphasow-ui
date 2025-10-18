import 'package:flutter/material.dart';

/// A form widget that wraps Flutter's Form with consistent styling.
///
/// This widget provides a convenient wrapper around Flutter's Form widget
/// while maintaining all of its functionality. It can be used with form field
/// widgets to create validated forms.
///
/// Example usage:
/// ```dart
/// final formKey = GlobalKey<FormState>();
///
/// AsForm(
///   formKey: formKey,
///   child: Column(
///     children: [
///       TextFormField(
///         validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
///       ),
///       ElevatedButton(
///         child: Text('Submit'),
///         onPressed: () {
///           if (formKey.currentState!.validate()) {
///             formKey.currentState!.save();
///           }
///         },
///       ),
///     ],
///   ),
/// )
/// ```
class AsForm extends StatelessWidget {
  /// Creates a form widget with validation support.
  ///
  /// [child] The widget tree containing form fields
  /// [formKey] Optional GlobalKey for accessing form state from outside
  /// [onChanged] Callback invoked whenever a form field value changes
  /// [autovalidateMode] When to automatically validate form fields
  /// [canPop] Whether the form can be popped
  /// [onPopInvokedWithResult] Callback invoked when pop is attempted
  const AsForm({
    required this.child,
    super.key,
    this.formKey,
    this.onChanged,
    this.autovalidateMode,
    this.canPop,
    this.onPopInvokedWithResult,
  });

  /// The widget tree containing form fields
  final Widget child;

  /// Global key for accessing the form state
  final GlobalKey<FormState>? formKey;

  /// Callback invoked when any form field value changes
  final VoidCallback? onChanged;

  /// Controls when form fields are automatically validated
  final AutovalidateMode? autovalidateMode;

  /// Whether the form can be popped
  final bool? canPop;

  /// Callback invoked when pop is attempted with the result
  final PopInvokedWithResultCallback<Object?>? onPopInvokedWithResult;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      onChanged: onChanged,
      autovalidateMode: autovalidateMode,
      canPop: canPop,
      onPopInvokedWithResult: onPopInvokedWithResult,
      child: child,
    );
  }
}
