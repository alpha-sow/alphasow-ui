import 'package:alpha_ui/alpha_ui.dart';
import 'package:flutter/material.dart';

buttonStyle({
  required Color color,
  required Color backgroundColor,
  bool outline = false,
  bool underline = false,
}) {
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
      borderRadius: BorderRadius.circular(theme.radius),
      side: outline
          ? BorderSide(
              color: theme.secondary,
              width: 1.0,
              style: BorderStyle.solid,
            )
          : BorderSide.none,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
  );
}
