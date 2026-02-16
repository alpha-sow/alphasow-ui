import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

/// A customizable avatar widget for displaying user profile images or initials.
///
/// ASAvatar provides a flexible way to display user avatars with support for
/// images, text initials, icons, and various styling options following Material Design guidelines.
class AsAvatar extends StatelessWidget {
  /// Creates an avatar widget.
  ///
  /// [radius] The radius of the avatar (defaults to 20.0)
  /// [backgroundImage] The image to display as the avatar background
  /// [backgroundColor] The background color when no image is provided
  /// [foregroundColor] The color of text or icons in the avatar
  /// [child] The widget to display inside the avatar (typically Text or Icon)
  /// [onTap] Callback executed when the avatar is tapped
  const AsAvatar({
    super.key,
    this.radius = 20.0,
    this.backgroundImage,
    this.backgroundColor,
    this.foregroundColor,
    this.child,
    this.onTap,
    this.showBorder = false,
    this.borderColor,
    this.elevation,
  });

  /// Creates an avatar with text initials.
  ///
  /// [initials] The text to display (typically user initials)
  /// [radius] The radius of the avatar (defaults to 20.0)
  /// [backgroundColor] The background color when no image is provided
  /// [textColor] The color of the text
  /// [fontSize] The font size of the text
  /// [onTap] Callback executed when the avatar is tapped
  AsAvatar.text({
    required String initials,
    super.key,
    this.radius = 20.0,
    this.backgroundColor,
    Color? textColor,
    double? fontSize,
    this.onTap,
    this.showBorder = false,
    this.borderColor,
    this.elevation,
  })  : backgroundImage = null,
        foregroundColor = textColor,
        child = Text(
          initials,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize ?? radius * 0.8,
            fontWeight: FontWeight.w500,
          ),
        );

  /// Creates an avatar with an icon.
  ///
  /// [icon] The icon to display
  /// [radius] The radius of the avatar (defaults to 20.0)
  /// [backgroundColor] The background color when no image is provided
  /// [iconColor] The color of the icon
  /// [iconSize] The size of the icon
  /// [onTap] Callback executed when the avatar is tapped
  AsAvatar.icon({
    required IconData icon,
    super.key,
    this.radius = 20.0,
    this.backgroundColor,
    Color? iconColor,
    double? iconSize,
    this.onTap,
    this.showBorder = false,
    this.borderColor,
    this.elevation,
  })  : backgroundImage = null,
        foregroundColor = iconColor,
        child = Icon(
          icon,
          color: iconColor,
          size: iconSize ?? radius * 1.2,
        );

  /// The radius of the avatar
  final double radius;

  /// The background image to display
  final ImageProvider? backgroundImage;

  /// The background color when no image is provided
  final Color? backgroundColor;

  /// The color of text or icons in the avatar
  final Color? foregroundColor;

  /// The widget to display inside the avatar
  final Widget? child;

  /// Callback executed when the avatar is tapped
  final VoidCallback? onTap;

  /// show border around
  final bool showBorder;

  /// Border color
  final Color? borderColor;

  /// Avatar elevation
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveBackgroundColor =
        backgroundColor ?? theme.colorScheme.primary.withValues(alpha: 0.12);
    final effectiveForegroundColor =
        foregroundColor ?? theme.colorScheme.onSurfaceVariant;

    final avatar = AsCard(
      elevation: elevation,
      padding: showBorder ? const EdgeInsets.all(2) : null,
      color: borderColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: backgroundImage,
        backgroundColor:
            backgroundImage == null ? effectiveBackgroundColor : null,
        foregroundColor: effectiveForegroundColor,
        child: child,
      ),
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: Material(
          type: MaterialType.circle,
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(radius),
            onTap: onTap,
            child: avatar,
          ),
        ),
      );
    }

    return avatar;
  }
}
