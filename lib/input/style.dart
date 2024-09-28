import 'package:alpha_ui/theme.dart';
import 'package:flutter/material.dart';

inputStyle({String? hintText}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(
      vertical: 4.0,
      horizontal: 14.0,
    ),
    fillColor: ThemeUI().primary,
    hintText: hintText,
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ThemeUI().secondary, width: 1.5),
      borderRadius: BorderRadius.circular(ThemeUI().radius),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ThemeUI().secondary, width: 1.5),
      borderRadius: BorderRadius.circular(ThemeUI().radius),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ThemeUI().primary, width: 2.0),
      borderRadius: BorderRadius.circular(ThemeUI().radius),
    ),
  );
}
