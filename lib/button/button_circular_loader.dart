import 'package:alpha_ui/theme.dart';
import 'package:flutter/material.dart';

class ButtonCircularLoader extends StatelessWidget {
  ButtonCircularLoader({super.key});

  final ThemeUI theme = DefaultThemeUI();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 14.0,
      height: 14.0,
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
        color: theme.primary,
      ),
    );
  }
}
