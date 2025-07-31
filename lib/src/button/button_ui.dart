import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum Variant { secondary, destructive, outline, ghost, link }

class ButtonColors {
  final Color textColor;
  final Color backgroundColor;
  final bool outline;
  final bool underline;

  const ButtonColors({
    required this.textColor,
    required this.backgroundColor,
    this.outline = false,
    this.underline = false,
  });
}

extension VariantExtension on Variant {
  ButtonColors getColors(BuildContext context) {
    final theme = Theme.of(context);

    switch (this) {
      case Variant.secondary:
        return ButtonColors(
          textColor: theme.colorScheme.onSecondary,
          backgroundColor: theme.colorScheme.secondary,
        );
      case Variant.destructive:
        return ButtonColors(
          textColor: theme.colorScheme.onError,
          backgroundColor: theme.colorScheme.error,
        );
      case Variant.outline:
        return ButtonColors(
          textColor: theme.colorScheme.onSurface,
          backgroundColor: Colors.transparent,
          outline: true,
        );
      case Variant.ghost:
        return ButtonColors(
          textColor: theme.colorScheme.onSurface,
          backgroundColor: Colors.transparent,
        );
      case Variant.link:
        return ButtonColors(
          textColor: theme.colorScheme.primary,
          backgroundColor: Colors.transparent,
          underline: true,
        );
    }
  }
}

class Button extends StatefulWidget {
  const Button({
    super.key,
    required this.child,
    required this.onPressed,
    this.isLoading = false,
    this.variant,
  });
  final Widget child;
  final void Function()? onPressed;
  final bool isLoading;
  final Variant? variant;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = widget.variant?.getColors(context) ??
        ButtonColors(
          textColor: theme.colorScheme.onPrimary,
          backgroundColor: theme.colorScheme.primary,
        );

    final isDisabled = widget.isLoading || widget.onPressed == null;
    final finalBackgroundColor = isDisabled
        ? theme.colorScheme.onSurface.withValues(alpha: 0.12)
        : _isPressed
            ? Color.lerp(
                colors.backgroundColor, theme.colorScheme.onSurface, 0.08)!
            : colors.backgroundColor;

    final finalTextColor = isDisabled
        ? theme.colorScheme.onSurface.withValues(alpha: 0.38)
        : colors.textColor;

    return GestureDetector(
      onTapDown: isDisabled ? null : (_) => setState(() => _isPressed = true),
      onTapUp: isDisabled ? null : (_) => setState(() => _isPressed = false),
      onTapCancel: isDisabled ? null : () => setState(() => _isPressed = false),
      onTap: isDisabled
          ? null
          : () {
              HapticFeedback.lightImpact();
              widget.onPressed?.call();
            },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: finalBackgroundColor,
          borderRadius: BorderRadius.circular(8.0),
          border: colors.outline
              ? Border.all(
                  color: theme.colorScheme.outline,
                  width: 1.0,
                )
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.isLoading) ...[
              LoadingSpinner(color: finalTextColor),
              const SizedBox(width: 8.0),
            ],
            DefaultTextStyle(
              style: TextStyle(
                color: finalTextColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                decoration: colors.underline ? TextDecoration.underline : null,
              ),
              child: widget.child,
            ),
          ],
        ),
      ),
    );
  }
}
