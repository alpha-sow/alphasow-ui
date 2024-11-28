import 'package:alpha_ui/theme/theme.dart';
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
    return SizedBox(
      width: 20.0,
      height: 20.0,
      child: Checkbox(
        value: value,
        onChanged: onChanged,
        activeColor: theme.primary,
        splashRadius: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(theme.radius),
        ),
      ),
    );
  }
}
