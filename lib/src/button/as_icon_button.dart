import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

/// Holds the color configuration for button styling.
class _ButtonColors {
  /// Creates a button color configuration.
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
extension _VariantExtension on Variant {
  /// Returns the color configuration for this variant.
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

/// A customizable icon button widget with multiple visual variants.
///
/// The AsIconButton widget extends AsButton to provide icon-specific functionality
/// while maintaining all the styling variants (primary, secondary, destructive, etc.).
class AsIconButton extends StatefulWidget {
  /// Creates a primary icon button (default variant).
  ///
  /// [icon] The icon to display in the button
  /// [onPressed] Callback executed when button is tapped (null disables button)
  /// [isLoading] Whether to show loading indicator (defaults to false)
  /// [size] The size of the icon (defaults to 20)
  const AsIconButton({
    required this.icon,
    required this.onPressed,
    super.key,
    this.isLoading = false,
    this.size = 20,
  }) : _variant = null;

  /// Creates a secondary icon button with muted styling.
  const AsIconButton.secondary({
    required this.icon,
    required this.onPressed,
    super.key,
    this.isLoading = false,
    this.size = 20,
  }) : _variant = Variant.secondary;

  /// Creates a destructive icon button with error/danger styling.
  const AsIconButton.destructive({
    required this.icon,
    required this.onPressed,
    super.key,
    this.isLoading = false,
    this.size = 20,
  }) : _variant = Variant.destructive;

  /// Creates an outline icon button with transparent background and border.
  const AsIconButton.outlined({
    required this.icon,
    required this.onPressed,
    super.key,
    this.isLoading = false,
    this.size = 20,
  }) : _variant = Variant.outline;

  /// Creates a ghost icon button with transparent background and no border.
  const AsIconButton.ghost({
    required this.icon,
    required this.onPressed,
    super.key,
    this.isLoading = false,
    this.size = 20,
  }) : _variant = Variant.ghost;


  /// The icon to display in the button
  final IconData icon;

  /// Callback executed when the button is tapped (null disables the button)
  final void Function()? onPressed;

  /// Whether to show a loading indicator instead of the icon
  final bool isLoading;

  /// The size of the icon
  final double size;

  /// The internal variant determining the button's visual style
  final Variant? _variant;

  @override
  State<AsIconButton> createState() => _AsIconButtonState();
}

class _AsIconButtonState extends State<AsIconButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDisabled = widget.isLoading || widget.onPressed == null;

    // Get the button colors for the current variant
    final colors = widget._variant?.getColors(context) ??
        _ButtonColors(
          textColor: theme.colorScheme.onPrimary,
          backgroundColor: theme.colorScheme.primary,
        );

    // Calculate interactive effects for icon color
    Color getInteractiveIconColor(Color baseColor) {
      if (isDisabled) return baseColor;

      if (_isPressed) {
        // Use inverse of icon color for pressed state
        return Color.fromARGB(
          (baseColor.a * 255.0).round() & 0xff,
          255 - ((baseColor.r * 255.0).round() & 0xff),
          255 - ((baseColor.g * 255.0).round() & 0xff),
          255 - ((baseColor.b * 255.0).round() & 0xff),
        );
      } else if (_isHovered) {
        // Use inverse of icon color for hovered state with reduced alpha
        return Color.fromARGB(
          (baseColor.a * 0.6 * 255.0).round() & 0xff,
          255 - ((baseColor.r * 255.0).round() & 0xff),
          255 - ((baseColor.g * 255.0).round() & 0xff),
          255 - ((baseColor.b * 255.0).round() & 0xff),
        );
      }

      return baseColor;
    }

    final iconColor = getInteractiveIconColor(colors.textColor);

    Widget buildButtonWithVariant() {
      final iconWidget = IconTheme(
        data: IconThemeData(color: iconColor, size: widget.size),
        child: Icon(widget.icon, size: widget.size, color: iconColor),
      );

      if (widget._variant == null) {
        return AsButton(
          onPressed: widget.onPressed,
          isLoading: widget.isLoading,
          disableHover: true,
          disablePress: true,
          child: iconWidget,
        );
      }

      switch (widget._variant!) {
        case Variant.primary:
          return AsButton(
            onPressed: widget.onPressed,
            isLoading: widget.isLoading,
            disableHover: true,
            disablePress: true,
            child: iconWidget,
          );
        case Variant.secondary:
          return AsButton.secondary(
            onPressed: widget.onPressed,
            isLoading: widget.isLoading,
            disableHover: true,
            disablePress: true,
            child: iconWidget,
          );
        case Variant.destructive:
          return AsButton.destructive(
            onPressed: widget.onPressed,
            isLoading: widget.isLoading,
            disableHover: true,
            disablePress: true,
            child: iconWidget,
          );
        case Variant.outline:
          return AsButton.outlined(
            onPressed: widget.onPressed,
            isLoading: widget.isLoading,
            disableHover: true,
            disablePress: true,
            child: iconWidget,
          );
        case Variant.ghost:
          return AsButton.ghost(
            onPressed: widget.onPressed,
            isLoading: widget.isLoading,
            disableHover: true,
            disablePress: true,
            padding: EdgeInsets.zero,
            child: iconWidget,
          );
      }
    }

    return GestureDetector(
      onTapDown: isDisabled ? null : (_) => setState(() => _isPressed = true),
      onTapUp: isDisabled ? null : (_) => setState(() => _isPressed = false),
      onTapCancel: isDisabled ? null : () => setState(() => _isPressed = false),
      child: MouseRegion(
        onEnter: isDisabled ? null : (_) => setState(() => _isHovered = true),
        onExit: isDisabled ? null : (_) => setState(() => _isHovered = false),
        child: buildButtonWithVariant(),
      ),
    );
  }
}
