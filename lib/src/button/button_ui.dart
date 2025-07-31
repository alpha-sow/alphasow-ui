import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

enum Variant { secondary, destructive, outline, ghost, link }

extension VariantExtension on Variant {
  ButtonStyle style(BuildContext context) {
    final theme = Theme.of(context);
    
    switch (this) {
      case Variant.secondary:
        return buttonStyle(
          context,
          color: theme.colorScheme.onSecondary,
          backgroundColor: theme.colorScheme.secondary,
        );
      case Variant.destructive:
        return buttonStyle(
          context,
          color: Colors.white,
          backgroundColor: theme.colorScheme.error,
        );
      case Variant.outline:
        return buttonStyle(
          context,
          color: theme.colorScheme.onSurface,
          backgroundColor: Colors.transparent,
          outline: true,
        );
      case Variant.ghost:
        return buttonStyle(
          context,
          color: theme.colorScheme.onSurface,
          backgroundColor: Colors.transparent,
        );
      case Variant.link:
        return buttonStyle(
          context,
          color: theme.colorScheme.primary,
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
    final theme = Theme.of(context);
    
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: variant?.style(context) ??
          buttonStyle(
            context,
            color: theme.colorScheme.onPrimary,
            backgroundColor: theme.colorScheme.primary,
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isLoading
              ? const CircularProgressIndicatorUI()
              : const SizedBox.shrink(),
          isLoading ? const SizedBox(width: 10.0) : const SizedBox.shrink(),
          child,
        ],
      ),
    );
  }
}
