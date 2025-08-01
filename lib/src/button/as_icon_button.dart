import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

/// A customizable icon button widget with multiple visual variants.
///
/// The AsIconButton widget extends AsButton to provide icon-specific functionality
/// while maintaining all the styling variants (primary, secondary, destructive, etc.).
class AsIconButton extends StatelessWidget {
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

  /// Creates a link-style icon button.
  const AsIconButton.link({
    required this.icon,
    required this.onPressed,
    super.key,
    this.isLoading = false,
    this.size = 20,
  }) : _variant = Variant.link;

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
  Widget build(BuildContext context) {
    if (_variant == null) {
      return AsButton(
        onPressed: onPressed,
        isLoading: isLoading,
        child: Icon(icon, size: size),
      );
    }

    switch (_variant) {
      case Variant.secondary:
        return AsButton.secondary(
          onPressed: onPressed,
          isLoading: isLoading,
          child: Icon(icon, size: size),
        );
      case Variant.destructive:
        return AsButton.destructive(
          onPressed: onPressed,
          isLoading: isLoading,
          child: Icon(icon, size: size),
        );
      case Variant.outline:
        return AsButton.outlined(
          onPressed: onPressed,
          isLoading: isLoading,
          child: Icon(icon, size: size),
        );
      case Variant.ghost:
        return AsButton.ghost(
          onPressed: onPressed,
          isLoading: isLoading,
          child: Icon(icon, size: size),
        );
      case Variant.link:
        return AsButton.link(
          onPressed: onPressed,
          isLoading: isLoading,
          child: Icon(icon, size: size),
        );
    }
  }
}
