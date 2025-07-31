import 'package:flutter/material.dart';

InputDecoration inputStyle(BuildContext context, {String? hintText}) {
  final theme = Theme.of(context);
  
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(
      vertical: 4.0,
      horizontal: 14.0,
    ),
    fillColor: theme.colorScheme.surface,
    hintText: hintText,
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: theme.colorScheme.outline, width: 1.5),
      borderRadius: BorderRadius.circular(8.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: theme.colorScheme.outline, width: 1.5),
      borderRadius: BorderRadius.circular(8.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: theme.colorScheme.primary, width: 2.0),
      borderRadius: BorderRadius.circular(8.0),
    ),
  );
}
