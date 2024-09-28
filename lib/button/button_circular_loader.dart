import 'package:alpha_ui/theme/theme.dart';
import 'package:flutter/material.dart';

class ButtonCircularLoader extends StatelessWidget {
  const ButtonCircularLoader({super.key});

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
