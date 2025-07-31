import 'package:flutter/material.dart';

/// A divider widget specifically designed to separate ListTileUI components.
///
/// DividerUI provides consistent spacing and visual separation
/// between list tile items, following Material Design guidelines.
/// Supports both horizontal and vertical orientations.
class ASDivider extends StatelessWidget {
  /// Creates a list tile divider.
  ///
  /// [height] The height of the divider including padding (defaults to 1.0)
  /// [thickness] The thickness of the divider line (defaults to 1.0)
  /// [indent] The amount of empty space to the left of the divider (horizontal) or top (vertical)
  /// [endIndent] The amount of empty space to the right of the divider (horizontal) or bottom (vertical)
  /// [color] The color to use when painting the divider line
  /// [orientation] The orientation of the divider (horizontal or vertical, defaults to horizontal)
  const ASDivider({
    super.key,
    this.height = 1.0,
    this.thickness = 1.0,
    this.indent,
    this.endIndent,
    this.color,
    this.orientation = Axis.horizontal,
  });

  /// The height of the divider including padding
  final double height;

  /// The thickness of the divider line
  final double thickness;

  /// The amount of empty space to the left of the divider (horizontal) or top (vertical)
  final double? indent;

  /// The amount of empty space to the right of the divider (horizontal) or bottom (vertical)
  final double? endIndent;

  /// The color to use when painting the divider line
  final Color? color;

  /// The orientation of the divider (horizontal or vertical)
  final Axis orientation;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dividerColor =
        color ?? theme.colorScheme.outline.withValues(alpha: 0.12);

    if (orientation == Axis.vertical) {
      return Container(
        width: height,
        margin: EdgeInsets.only(
          top: indent ?? 16.0,
          bottom: endIndent ?? 16.0,
        ),
        child: VerticalDivider(
          width: height,
          thickness: thickness,
          color: dividerColor,
        ),
      );
    }

    return Container(
      height: height,
      margin: EdgeInsets.only(
        left: indent ?? 16.0,
        right: endIndent ?? 16.0,
      ),
      child: Divider(
        height: height,
        thickness: thickness,
        color: dividerColor,
      ),
    );
  }
}
