import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A customizable list tile widget for displaying structured content.
///
/// ListTileUI provides a flexible way to display information in a list format
/// with support for leading icons, titles, subtitles, trailing widgets, and tap actions.
class AsListTile extends StatefulWidget {
  /// Creates a list tile.
  ///
  /// [title] The primary content of the list item
  /// [onTap] Callback executed when the tile is tapped
  /// [subtitle] Optional secondary content displayed below the title
  /// [leading] Optional widget displayed before the title (typically an icon)
  /// [trailing] Optional widget displayed after the title (typically an icon or button)
  /// [enabled] Whether the tile is interactive (defaults to true)
  /// [dense] Whether to use a more compact layout (defaults to false)
  const AsListTile({
    required this.title,
    super.key,
    this.onTap,
    this.subtitle,
    this.leading,
    this.trailing,
    this.enabled = true,
    this.dense = false,
  });

  /// The primary content of the list item
  final Widget title;

  /// Optional secondary content displayed below the title
  final Widget? subtitle;

  /// Optional widget displayed before the title (typically an icon)
  final Widget? leading;

  /// Optional widget displayed after the title (typically an icon or button)
  final Widget? trailing;

  /// Callback executed when the tile is tapped
  final VoidCallback? onTap;

  /// Whether the tile is interactive
  final bool enabled;

  /// Whether to use a more compact layout
  final bool dense;

  /// Creates an iterable of widgets that contains the given [tiles] with dividers
  /// inserted between them.
  ///
  /// This is a convenience method that mimics Flutter's [ListTile.divideTiles].
  /// It takes an iterable of widgets (typically [AsListTile] widgets) and returns
  /// an iterable with [AsDivider] widgets inserted between each tile.
  ///
  /// The dividers can be customized by providing optional parameters:
  /// - [height]: The height of the divider (defaults to 1.0)
  /// - [thickness]: The thickness of the divider line (defaults to 1.0)
  /// - [indent]: The amount of empty space to the left of the divider
  /// - [endIndent]: The amount of empty space to the right of the divider
  /// - [color]: The color to use when painting the divider line
  ///
  /// Example usage:
  /// ```dart
  /// Column(
  ///   children: ListTileUI.divideTiles(
  ///     tiles: [
  ///       ListTileUI(title: Text('Item 1')),
  ///       ListTileUI(title: Text('Item 2')),
  ///       ListTileUI(title: Text('Item 3')),
  ///     ],
  ///   ).toList(),
  /// )
  /// ```
  static Iterable<Widget> divideTiles({
    required Iterable<Widget> tiles,
    double height = 1.0,
    double thickness = 1.0,
    double? indent,
    double? endIndent,
    Color? color,
  }) sync* {
    final iterator = tiles.iterator;
    final isNotEmpty = iterator.moveNext();

    if (isNotEmpty) {
      yield iterator.current;
      while (iterator.moveNext()) {
        yield AsDivider(
          height: height,
          thickness: thickness,
          indent: indent,
          endIndent: endIndent,
          color: color,
        );
        yield iterator.current;
      }
    }
  }

  @override
  State<AsListTile> createState() => _AsListTileState();
}

class _AsListTileState extends State<AsListTile> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isInteractive = widget.enabled && widget.onTap != null;
    final verticalPadding = widget.dense ? 8.0 : 12.0;
    const horizontalPadding = 16.0;

    final backgroundColor = _isPressed
        ? theme.colorScheme.onSurface.withValues(alpha: 0.08)
        : Colors.transparent;

    final titleStyle = TextStyle(
      fontSize: widget.dense ? 14 : 16,
      fontWeight: FontWeight.w500,
      color: widget.enabled
          ? theme.colorScheme.onSurface
          : theme.colorScheme.onSurface.withValues(alpha: 0.38),
    );

    final subtitleStyle = TextStyle(
      fontSize: widget.dense ? 12 : 14,
      fontWeight: FontWeight.w400,
      color: widget.enabled
          ? theme.colorScheme.onSurfaceVariant
          : theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.38),
    );

    return GestureDetector(
      onTapDown:
          !isInteractive ? null : (_) => setState(() => _isPressed = true),
      onTapUp:
          !isInteractive ? null : (_) => setState(() => _isPressed = false),
      onTapCancel:
          !isInteractive ? null : () => setState(() => _isPressed = false),
      onTap: !isInteractive ? null : widget.onTap?.call,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Row(
          children: [
            if (widget.leading != null) ...[
              IconTheme(
                data: IconThemeData(
                  color: widget.enabled
                      ? theme.colorScheme.onSurfaceVariant
                      : theme.colorScheme.onSurfaceVariant
                          .withValues(alpha: 0.38),
                  size: widget.dense ? 20 : 24,
                ),
                child: widget.leading!,
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  DefaultTextStyle(
                    style: titleStyle,
                    child: widget.title,
                  ),
                  if (widget.subtitle != null) ...[
                    const SizedBox(height: 2),
                    DefaultTextStyle(
                      style: subtitleStyle,
                      child: widget.subtitle!,
                    ),
                  ],
                ],
              ),
            ),
            if (widget.trailing != null) ...[
              const SizedBox(width: 12),
              IconTheme(
                data: IconThemeData(
                  color: widget.enabled
                      ? theme.colorScheme.onSurfaceVariant
                      : theme.colorScheme.onSurfaceVariant
                          .withValues(alpha: 0.38),
                  size: widget.dense ? 16 : 20,
                ),
                child: widget.trailing!,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
