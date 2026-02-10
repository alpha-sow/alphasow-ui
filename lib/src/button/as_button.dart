import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Defines the shape of a button.
enum AsButtonShape {
  /// Rounded rectangle with default corner radius (8)
  rounded,

  /// Fully rounded ends (stadium/pill shape)
  pill,

  /// Sharp rectangle with no rounding
  rectangle,
}

/// Defines the visual variants available for buttons.
///
/// Each variant provides different styling to match various UI contexts.
enum Variant {
  /// Primary button with main brand colors
  primary,

  /// Secondary button with muted colors
  secondary,

  /// Destructive button with error/danger colors
  destructive,

  /// Outline button with transparent background and border
  outline,

  /// Ghost button with transparent background and no border
  ghost
}

/// Holds the color configuration for button styling.
///
/// This class encapsulates all visual properties needed to style
/// a button according to its variant.
class _ButtonColors {
  /// Creates a button color configuration.
  ///
  /// [textColor] The color of text and icons in the button
  /// [backgroundColor] The background color of the button
  /// [outline] Whether the button should have a border outline
  const _ButtonColors({
    required this.textColor,
    required this.backgroundColor,
    this.outline = false,
  });

  /// The color used for text and icons
  final Color textColor;

  /// The background color of the button
  final Color backgroundColor;

  /// Whether to display an outline border
  final bool outline;
}

/// Extension providing color configuration for each button variant.
///
/// This private extension maps each variant to its appropriate colors
/// based on the current theme.
extension _VariantExtension on Variant {
  /// Returns the color configuration for this variant.
  ///
  /// [context] The build context for accessing theme colors
  _ButtonColors getColors(BuildContext context) {
    final theme = Theme.of(context);

    switch (this) {
      case Variant.primary:
        return _ButtonColors(
          textColor: theme.colorScheme.onPrimary,
          backgroundColor: theme.colorScheme.primary,
        );
      case Variant.secondary:
        return _ButtonColors(
          textColor: theme.colorScheme.onSecondary,
          backgroundColor: theme.colorScheme.secondary,
        );
      case Variant.destructive:
        return _ButtonColors(
          textColor: theme.colorScheme.onError,
          backgroundColor: theme.colorScheme.error,
        );
      case Variant.outline:
        return _ButtonColors(
          textColor: theme.colorScheme.onSurface,
          backgroundColor: Colors.transparent,
          outline: true,
        );
      case Variant.ghost:
        return _ButtonColors(
          textColor: theme.colorScheme.onSurface,
          backgroundColor: Colors.transparent,
        );
    }
  }
}

/// A customizable button widget with multiple visual variants.
///
/// The Button widget provides a consistent interface for various button styles
/// including primary, secondary, destructive, outline, ghost, and link variants.
/// It supports loading states and haptic feedback.
class AsButton extends StatefulWidget {
  /// Creates a primary button (default variant).
  ///
  /// [child] The widget to display inside the button
  /// [onPressed] Callback executed when button is tapped (null disables button)
  /// [isLoading] Whether to show loading indicator (defaults to false)
  /// [disableHover] Whether to disable hover effects (defaults to false)
  /// [disablePress] Whether to disable press effects (defaults to false)
  /// [padding] Custom padding for the button (defaults to symmetric horizontal: 16, vertical: 8)
  const AsButton({
    required this.child,
    required this.onPressed,
    super.key,
    this.isLoading = false,
    this.disableHover = false,
    this.disablePress = false,
    this.padding,
    this.shape = AsButtonShape.rectangle,
  }) : _variant = null;

  /// Creates a secondary button with muted styling.
  ///
  /// [child] The widget to display inside the button
  /// [onPressed] Callback executed when button is tapped (null disables button)
  /// [isLoading] Whether to show loading indicator (defaults to false)
  /// [disableHover] Whether to disable hover effects (defaults to false)
  /// [disablePress] Whether to disable press effects (defaults to false)
  /// [padding] Custom padding for the button (defaults to symmetric horizontal: 16, vertical: 8)
  const AsButton.secondary({
    required this.child,
    required this.onPressed,
    super.key,
    this.isLoading = false,
    this.disableHover = false,
    this.disablePress = false,
    this.padding,
    this.shape = AsButtonShape.rectangle,
  }) : _variant = Variant.secondary;

  /// Creates a destructive button with error/danger styling.
  ///
  /// [child] The widget to display inside the button
  /// [onPressed] Callback executed when button is tapped (null disables button)
  /// [isLoading] Whether to show loading indicator (defaults to false)
  /// [disableHover] Whether to disable hover effects (defaults to false)
  /// [disablePress] Whether to disable press effects (defaults to false)
  /// [padding] Custom padding for the button (defaults to symmetric horizontal: 16, vertical: 8)
  const AsButton.destructive({
    required this.child,
    required this.onPressed,
    super.key,
    this.isLoading = false,
    this.disableHover = false,
    this.disablePress = false,
    this.padding,
    this.shape = AsButtonShape.rectangle,
  }) : _variant = Variant.destructive;

  /// Creates an outline button with transparent background and border.
  ///
  /// [child] The widget to display inside the button
  /// [onPressed] Callback executed when button is tapped (null disables button)
  /// [isLoading] Whether to show loading indicator (defaults to false)
  /// [disableHover] Whether to disable hover effects (defaults to false)
  /// [disablePress] Whether to disable press effects (defaults to false)
  /// [padding] Custom padding for the button (defaults to symmetric horizontal: 16, vertical: 8)
  const AsButton.outlined({
    required this.child,
    required this.onPressed,
    super.key,
    this.isLoading = false,
    this.disableHover = false,
    this.disablePress = false,
    this.padding,
    this.shape = AsButtonShape.rectangle,
  }) : _variant = Variant.outline;

  /// Creates a ghost button with transparent background and no border.
  ///
  /// [child] The widget to display inside the button
  /// [onPressed] Callback executed when button is tapped (null disables button)
  /// [isLoading] Whether to show loading indicator (defaults to false)
  /// [disableHover] Whether to disable hover effects (defaults to false)
  /// [disablePress] Whether to disable press effects (defaults to false)
  /// [padding] Custom padding for the button (defaults to symmetric horizontal: 16, vertical: 8)
  const AsButton.ghost({
    required this.child,
    required this.onPressed,
    super.key,
    this.isLoading = false,
    this.disableHover = false,
    this.disablePress = false,
    this.padding,
    this.shape = AsButtonShape.rectangle,
  }) : _variant = Variant.ghost;

  /// The widget to display inside the button (typically Text or Icon)
  final Widget child;

  /// Callback executed when the button is tapped (null disables the button)
  final void Function()? onPressed;

  /// Whether to show a loading indicator instead of the child widget
  final bool isLoading;

  /// Whether to disable hover effects
  final bool disableHover;

  /// Whether to disable press effects
  final bool disablePress;

  /// Custom padding for the button
  final EdgeInsetsGeometry? padding;

  /// The shape of the button
  final AsButtonShape shape;

  /// The internal variant determining the button's visual style
  final Variant? _variant;

  @override
  State<AsButton> createState() => _AsButtonState();
}

class _AsButtonState extends State<AsButton> {
  bool _isPressed = false;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = widget._variant?.getColors(context) ??
        _ButtonColors(
          textColor: theme.colorScheme.onPrimary,
          backgroundColor: theme.colorScheme.primary,
        );

    final isDisabled = widget.isLoading || widget.onPressed == null;

    // Calculate hover and press effects that work in both light and dark modes
    Color getInteractiveColor(Color baseColor, double intensity) {
      // For dark mode (low brightness), lighten the color
      // For light mode (high brightness), darken the color
      final isLightMode = theme.brightness == Brightness.light;
      final targetColor = isLightMode
          ? Colors.black.withValues(alpha: intensity)
          : Colors.white.withValues(alpha: intensity);

      return Color.alphaBlend(targetColor, baseColor);
    }

    final finalBackgroundColor = isDisabled
        ? theme.colorScheme.onSurface.withValues(alpha: 0.12)
        : (_isPressed && !widget.disablePress)
            ? getInteractiveColor(colors.backgroundColor,
                theme.brightness == Brightness.dark ? 0.30 : 0.20)
            : (_isHovered && !widget.disableHover)
                ? getInteractiveColor(colors.backgroundColor,
                    theme.brightness == Brightness.dark ? 0.25 : 0.15)
                : colors.backgroundColor;

    final finalTextColor = isDisabled
        ? theme.colorScheme.onSurface.withValues(alpha: 0.38)
        : colors.textColor;

    return MouseRegion(
      onEnter: (isDisabled || widget.disableHover)
          ? null
          : (_) => setState(() => _isHovered = true),
      onExit: (isDisabled || widget.disableHover)
          ? null
          : (_) => setState(() => _isHovered = false),
      cursor:
          isDisabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (isDisabled || widget.disablePress)
            ? null
            : (_) => setState(() => _isPressed = true),
        onTapUp: (isDisabled || widget.disablePress)
            ? null
            : (_) => setState(() => _isPressed = false),
        onTapCancel: (isDisabled || widget.disablePress)
            ? null
            : () => setState(() => _isPressed = false),
        onTap: isDisabled
            ? null
            : () {
                HapticFeedback.lightImpact();
                widget.onPressed?.call();
              },
        child: Container(
          padding: widget.padding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: finalBackgroundColor,
            borderRadius: switch (widget.shape) {
              AsButtonShape.rounded => BorderRadius.circular(100),
              AsButtonShape.pill => BorderRadius.circular(50),
              AsButtonShape.rectangle => BorderRadius.circular(8),
            },
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
                AsLoadingCircular(color: finalTextColor),
                const SizedBox(width: 8),
              ],
              DefaultTextStyle(
                style: TextStyle(
                  color: finalTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                child: widget.child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
