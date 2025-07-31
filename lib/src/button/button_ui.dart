import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Defines the visual variants available for buttons.
/// 
/// Each variant provides different styling to match various UI contexts.
enum Variant {
  /// Secondary button with muted colors
  secondary,
  
  /// Destructive button with error/danger colors
  destructive,
  
  /// Outline button with transparent background and border
  outline,
  
  /// Ghost button with transparent background and no border
  ghost,
  
  /// Link-style button with underlined text
  link
}

/// Holds the color configuration for button styling.
/// 
/// This class encapsulates all visual properties needed to style
/// a button according to its variant.
class ButtonColors {
  /// Creates a button color configuration.
  /// 
  /// [textColor] The color of text and icons in the button
  /// [backgroundColor] The background color of the button
  /// [outline] Whether the button should have a border outline
  /// [underline] Whether the text should be underlined
  const ButtonColors({
    required this.textColor,
    required this.backgroundColor,
    this.outline = false,
    this.underline = false,
  });
  
  /// The color used for text and icons
  final Color textColor;
  
  /// The background color of the button
  final Color backgroundColor;
  
  /// Whether to display an outline border
  final bool outline;
  
  /// Whether to underline the button text
  final bool underline;
}

/// Extension providing color configuration for each button variant.
/// 
/// This private extension maps each variant to its appropriate colors
/// based on the current theme.
extension _VariantExtension on Variant {
  /// Returns the color configuration for this variant.
  /// 
  /// [context] The build context for accessing theme colors
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

/// A customizable button widget with multiple visual variants.
/// 
/// The Button widget provides a consistent interface for various button styles
/// including primary, secondary, destructive, outline, ghost, and link variants.
/// It supports loading states and haptic feedback.
class Button extends StatefulWidget {
  /// Creates a primary button (default variant).
  /// 
  /// [child] The widget to display inside the button
  /// [onPressed] Callback executed when button is tapped (null disables button)
  /// [isLoading] Whether to show loading indicator (defaults to false)
  const Button({
    required this.child, required this.onPressed, super.key,
    this.isLoading = false,
  }) : _variant = null;

  /// Creates a secondary button with muted styling.
  /// 
  /// [child] The widget to display inside the button
  /// [onPressed] Callback executed when button is tapped (null disables button)
  /// [isLoading] Whether to show loading indicator (defaults to false)
  const Button.secondary({
    required this.child, required this.onPressed, super.key,
    this.isLoading = false,
  }) : _variant = Variant.secondary;

  /// Creates a destructive button with error/danger styling.
  /// 
  /// [child] The widget to display inside the button
  /// [onPressed] Callback executed when button is tapped (null disables button)
  /// [isLoading] Whether to show loading indicator (defaults to false)
  const Button.destructive({
    required this.child, required this.onPressed, super.key,
    this.isLoading = false,
  }) : _variant = Variant.destructive;

  /// Creates an outline button with transparent background and border.
  /// 
  /// [child] The widget to display inside the button
  /// [onPressed] Callback executed when button is tapped (null disables button)
  /// [isLoading] Whether to show loading indicator (defaults to false)
  const Button.outline({
    required this.child, required this.onPressed, super.key,
    this.isLoading = false,
  }) : _variant = Variant.outline;

  /// Creates a ghost button with transparent background and no border.
  /// 
  /// [child] The widget to display inside the button
  /// [onPressed] Callback executed when button is tapped (null disables button)
  /// [isLoading] Whether to show loading indicator (defaults to false)
  const Button.ghost({
    required this.child, required this.onPressed, super.key,
    this.isLoading = false,
  }) : _variant = Variant.ghost;

  /// Creates a link-style button with underlined text.
  /// 
  /// [child] The widget to display inside the button
  /// [onPressed] Callback executed when button is tapped (null disables button)
  /// [isLoading] Whether to show loading indicator (defaults to false)
  const Button.link({
    required this.child, required this.onPressed, super.key,
    this.isLoading = false,
  }) : _variant = Variant.link;

  /// The widget to display inside the button (typically Text or Icon)
  final Widget child;
  
  /// Callback executed when the button is tapped (null disables the button)
  final void Function()? onPressed;
  
  /// Whether to show a loading indicator instead of the child widget
  final bool isLoading;
  
  /// The internal variant determining the button's visual style
  final Variant? _variant;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = widget._variant?.getColors(context) ??
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: finalBackgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: colors.outline
              ? Border.all(
                  color: theme.colorScheme.outline,
                )
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.isLoading) ...[
              LoadingCircular(color: finalTextColor),
              const SizedBox(width: 8),
            ],
            DefaultTextStyle(
              style: TextStyle(
                color: finalTextColor,
                fontSize: 14,
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
