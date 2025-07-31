import 'package:flutter/material.dart';

/// A customized checkbox widget with consistent theming.
///
/// This widget provides a styled checkbox that integrates with the app's
/// theme and maintains consistent sizing and appearance.
class CheckboxUI extends StatelessWidget {
  /// Creates a themed checkbox.
  ///
  /// [onChanged] Callback executed when the checkbox state changes
  /// [value] The current state of the checkbox (true, false, or null for indeterminate)
  const CheckboxUI({
    required this.onChanged,
    super.key,
    this.value,
  });

  /// The current state of the checkbox (true, false, or null for indeterminate)
  final bool? value;

  /// Callback executed when the checkbox state changes
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: 20,
      height: 20,
      child: Checkbox(
        value: value,
        onChanged: onChanged,
        activeColor: theme.colorScheme.primary,
        splashRadius: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
