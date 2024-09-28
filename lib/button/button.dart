import 'package:alpha_ui/button/style.dart';
import 'package:alpha_ui/theme/theme.dart';
import 'package:flutter/material.dart';

enum Variant { secondary, destructive, outline, ghost, link }

extension VariantExtension on Variant {
  ButtonStyle style() {
    final ThemeUI theme = DefaultThemeUI();
    switch (this) {
      case Variant.secondary:
        return buttonStyle(
          color: Colors.black,
          backgroundColor: theme.secondary,
        );
      case Variant.destructive:
        return buttonStyle(
          color: Colors.white,
          backgroundColor: Colors.red,
        );
      case Variant.outline:
        return buttonStyle(
          color: Colors.black,
          backgroundColor: Colors.transparent,
          outline: true,
        );
      case Variant.ghost:
        return buttonStyle(
          color: Colors.black,
          backgroundColor: Colors.transparent,
        );
      case Variant.link:
        return buttonStyle(
          color: Colors.black,
          backgroundColor: Colors.transparent,
          underline: true,
        );
    }
  }
}

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.child,
    required this.onPressed,
    this.isLoading = false,
    this.variant,
  });
  final Widget child;
  final Variant? variant;
  final void Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: variant?.style() ??
          buttonStyle(
            color: Colors.white,
            backgroundColor: theme.primary,
          ),
      child: child,
    );
  }
}
