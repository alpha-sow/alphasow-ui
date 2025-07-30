import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

inputStyle({String? hintText}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(
      vertical: 4.0,
      horizontal: 14.0,
    ),
    fillColor: theme.primary,
    hintText: hintText,
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: theme.secondary, width: 1.5),
      borderRadius: BorderRadius.circular(theme.radius),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: theme.secondary, width: 1.5),
      borderRadius: BorderRadius.circular(theme.radius),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: theme.primary, width: 2.0),
      borderRadius: BorderRadius.circular(theme.radius),
    ),
  );
}
