import 'package:flutter/material.dart';

class CheckboxUI extends StatelessWidget {
  const CheckboxUI({
    super.key,
    this.value,
    required this.onChanged,
  });
  final bool? value;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return SizedBox(
      width: 20.0,
      height: 20.0,
      child: Checkbox(
        value: value,
        onChanged: onChanged,
        activeColor: theme.colorScheme.primary,
        splashRadius: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    );
  }
}
