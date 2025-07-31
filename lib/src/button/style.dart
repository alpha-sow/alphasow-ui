import 'package:flutter/material.dart';

ButtonStyle buttonStyle(
  BuildContext context, {
  required Color color,
  required Color backgroundColor,
  bool outline = false,
  bool underline = false,
}) {
  final theme = Theme.of(context);
  
  return ElevatedButton.styleFrom(
    elevation: 0.0,
    foregroundColor: color,
    textStyle: underline
        ? const TextStyle(
            decoration: TextDecoration.underline,
          )
        : null,
    backgroundColor: backgroundColor,
    overlayColor: underline ? Colors.transparent : null,
    shadowColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
      side: outline
          ? BorderSide(
              color: theme.colorScheme.outline,
              width: 1.0,
              style: BorderStyle.solid,
            )
          : BorderSide.none,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
  );
}
