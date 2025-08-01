import 'package:flutter/material.dart';

/// A customized checkbox widget with consistent theming.
///
/// This widget provides a styled checkbox that integrates with the app's
/// theme and maintains consistent sizing and appearance.
class AsCheckbox extends StatelessWidget {
  /// Creates a themed checkbox.
  ///
  /// [onChanged] Callback executed when the checkbox state changes
  /// [value] The current state of the checkbox (true, false, or null for indeterminate)
  const AsCheckbox({
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
    final isChecked = value ?? true;
    final isIndeterminate = value == null;

    return GestureDetector(
      onTap: onChanged != null
          ? () {
              if (value == false) {
                onChanged!(true);
              } else {
                onChanged!(false);
              }
            }
          : null,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: isChecked || isIndeterminate
                ? theme.colorScheme.primary
                : theme.colorScheme.outline,
            width: 2,
          ),
          color: isChecked || isIndeterminate
              ? theme.colorScheme.primary
              : Colors.transparent,
        ),
        child: isChecked
            ? const Icon(
                Icons.check,
                size: 14,
                color: Colors.white,
              )
            : isIndeterminate
                ? Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(1),
                    ),
                  )
                : null,
      ),
    );
  }
}
