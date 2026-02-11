import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

class _ButtonColors {
  const _ButtonColors({
    required this.iconColor,
    required this.backgroundColor,
    this.outline = false,
  });

  final Color iconColor;

  final Color backgroundColor;

  final bool outline;
}

extension _VariantExtension on Variant {
  _ButtonColors getColors(BuildContext context) {
    final theme = Theme.of(context);

    switch (this) {
      case Variant.primary:
        return _ButtonColors(
          iconColor: theme.colorScheme.onPrimary,
          backgroundColor: theme.colorScheme.primary,
        );
      case Variant.secondary:
        return _ButtonColors(
          iconColor: theme.colorScheme.onSecondary,
          backgroundColor: theme.colorScheme.secondary,
        );
      case Variant.destructive:
        return _ButtonColors(
          iconColor: theme.colorScheme.onError,
          backgroundColor: theme.colorScheme.error,
        );
      case Variant.outline:
        return _ButtonColors(
          iconColor: theme.colorScheme.primary,
          backgroundColor: Colors.transparent,
          outline: true,
        );
      case Variant.ghost:
        return _ButtonColors(
          iconColor: theme.colorScheme.primary,
          backgroundColor: Colors.transparent,
        );
    }
  }
}

/// An icon button widget that supports various variants and interactive states.
///
/// This widget provides hover and press visual feedback with adaptive colors
/// based on the current theme brightness (dark/light mode).
class AsIconButton extends StatefulWidget {
  /// Creates a primary icon button.
  const AsIconButton({
    required this.icon,
    required this.onPressed,
    super.key,
    this.isLoading = false,
    this.size = 18,
    this.iconColor,
    this.shape = AsButtonShape.rectangle,
  }) : _variant = null;

  /// Creates a secondary variant icon button.
  const AsIconButton.secondary({
    required this.icon,
    required this.onPressed,
    super.key,
    this.isLoading = false,
    this.size = 18,
    this.iconColor,
    this.shape = AsButtonShape.rectangle,
  }) : _variant = Variant.secondary;

  /// Creates a destructive variant icon button.
  const AsIconButton.destructive({
    required this.icon,
    required this.onPressed,
    super.key,
    this.isLoading = false,
    this.size = 18,
    this.iconColor,
    this.shape = AsButtonShape.rectangle,
  }) : _variant = Variant.destructive;

  /// Creates an outlined variant icon button.
  const AsIconButton.outlined({
    required this.icon,
    required this.onPressed,
    super.key,
    this.isLoading = false,
    this.size = 18,
    this.iconColor,
    this.shape = AsButtonShape.rectangle,
  }) : _variant = Variant.outline;

  /// Creates a ghost variant icon button.
  const AsIconButton.ghost({
    required this.icon,
    required this.onPressed,
    super.key,
    this.isLoading = false,
    this.size = 18,
    this.iconColor,
    this.shape = AsButtonShape.rectangle,
  }) : _variant = Variant.ghost;

  /// The icon widget to display in the button.
  final Icon icon;

  /// Callback function called when the button is pressed.
  final void Function()? onPressed;

  /// Whether the button should show a loading state.
  final bool isLoading;

  /// The size of the icon in logical pixels.
  final double size;

  /// The color of the icon. If null, uses the variant's default color.
  final Color? iconColor;

  /// The shape of the button.
  final AsButtonShape shape;

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

    final colors = widget._variant?.getColors(context) ??
        _ButtonColors(
          iconColor: theme.colorScheme.onPrimary,
          backgroundColor: theme.colorScheme.primary,
        );

    /// Returns the base icon color without changes for hover/press states.
    Color getInteractiveIconColor(Color baseColor) {
      return baseColor;
    }

    final iconColor =
        getInteractiveIconColor(widget.iconColor ?? colors.iconColor);

    Widget buildButtonWithVariant() {
      final isGhostDisabled = widget._variant == Variant.ghost && isDisabled;
      final effectiveIconColor = isGhostDisabled
          ? theme.colorScheme.onSurface.withValues(alpha: 0.38)
          : iconColor;

      final iconSize = widget.icon.size ?? widget.size;

      Widget iconWidget = IconTheme(
        data: IconThemeData(color: effectiveIconColor, size: iconSize),
        child: widget.icon,
      );

      // Add white or black overlay when hovered or pressed
      if (_isHovered || _isPressed) {
        const overlayAlpha = 0.4;
        final isWhiteIcon = iconColor == Colors.white;
        final overlayColor = isWhiteIcon
            ? Colors.black.withValues(alpha: overlayAlpha)
            : Colors.white.withValues(alpha: overlayAlpha);

        iconWidget = Stack(
          alignment: Alignment.center,
          children: [
            iconWidget,
            Icon(
              widget.icon.icon,
              size: iconSize,
              color: overlayColor,
            ),
          ],
        );
      }

      if (widget._variant == null) {
        return AsButton(
          onPressed: widget.onPressed,
          isLoading: widget.isLoading,
          disableHover: true,
          disablePress: true,
          shape: widget.shape,
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
            shape: widget.shape,
            child: iconWidget,
          );
        case Variant.secondary:
          return AsButton.secondary(
            onPressed: widget.onPressed,
            isLoading: widget.isLoading,
            disableHover: true,
            disablePress: true,
            shape: widget.shape,
            child: iconWidget,
          );
        case Variant.destructive:
          return AsButton.destructive(
            onPressed: widget.onPressed,
            isLoading: widget.isLoading,
            disableHover: true,
            disablePress: true,
            shape: widget.shape,
            child: iconWidget,
          );
        case Variant.outline:
          return AsButton.outlined(
            onPressed: widget.onPressed,
            isLoading: widget.isLoading,
            disableHover: true,
            disablePress: true,
            shape: widget.shape,
            child: iconWidget,
          );
        case Variant.ghost:
          if (isGhostDisabled) {
            return iconWidget;
          }
          return AsButton.ghost(
            onPressed: widget.onPressed,
            isLoading: widget.isLoading,
            disablePress: true,
            padding: EdgeInsets.zero,
            shape: widget.shape,
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
