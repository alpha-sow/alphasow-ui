import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Represents a destination in the navigation rail.
///
/// This class defines the structure for navigation rail destinations,
/// including the icon, optional selected icon, label, and padding.
class AsNavigationRailDestination {
  /// Creates a navigation rail destination.
  ///
  /// The [icon] parameter is required and represents the icon to display
  /// for this destination. Other parameters are optional and provide
  /// additional customization options.
  const AsNavigationRailDestination({
    required this.icon,
    this.selectedIcon,
    this.label,
    this.padding,
  });

  /// The icon to display for this destination.
  final Widget icon;

  /// The icon to display when this destination is selected.
  /// If null, uses [icon].
  final Widget? selectedIcon;

  /// The text label for this destination.
  final String? label;

  /// Custom padding for this destination.
  final EdgeInsetsGeometry? padding;
}

/// Label display types for navigation rail destinations.
enum AsNavigationRailLabelType {
  /// No labels are shown.
  none,

  /// Labels are shown for the selected destination only.
  selected,

  /// Labels are shown for all destinations.
  all,
}

/// A customizable navigation rail widget built from scratch.
///
/// The AsNavigationRail widget provides a vertical navigation component
/// with full customization without relying on Flutter's NavigationRail.
class AsNavigationRail extends StatefulWidget {
  /// Creates a custom navigation rail.
  ///
  /// [destinations] The list of navigation destinations
  /// [selectedIndex] The index of the currently selected destination
  /// [onDestinationSelected] Callback when a destination is selected
  /// [extended] Whether the rail should be in extended mode (defaults to false)
  /// [labelType] How to display the labels (defaults to selected)
  /// [backgroundColor] The background color of the rail
  /// [elevation] The elevation of the rail (defaults to 0)
  /// [leading] Optional widget to display at the top of the rail
  /// [trailing] Optional widget to display at the bottom of the rail
  /// [groupAlignment] Alignment of the destination group (defaults to 0.0 - top)
  /// [minWidth] Minimum width of the rail (defaults to 72)
  /// [minExtendedWidth] Minimum width when extended (defaults to 256)
  /// [useIndicator] Whether to show selection indicator (defaults to true)
  /// [indicatorColor] Color of the selection indicator
  /// [indicatorShape] Shape of the selection indicator
  const AsNavigationRail({
    required this.destinations,
    this.selectedIndex,
    this.onDestinationSelected,
    this.labelType = AsNavigationRailLabelType.selected,
    this.extended = false,
    this.backgroundColor,
    this.elevation = 0,
    this.leading,
    this.trailing,
    this.groupAlignment = 0.0,
    this.minWidth = 72,
    this.minExtendedWidth = 256,
    this.useIndicator = true,
    this.indicatorColor,
    this.indicatorShape,
    super.key,
  });

  /// The list of navigation destinations
  final List<AsNavigationRailDestination> destinations;

  /// The index of the currently selected destination
  final int? selectedIndex;

  /// Callback executed when a destination is selected
  final ValueChanged<int>? onDestinationSelected;

  /// Whether the rail should be in extended mode
  final bool extended;

  /// How to display the labels
  final AsNavigationRailLabelType labelType;

  /// The background color of the rail
  final Color? backgroundColor;

  /// The elevation of the rail
  final double elevation;

  /// Optional widget to display at the top of the rail
  final Widget? leading;

  /// Optional widget to display at the bottom of the rail
  final Widget? trailing;

  /// Alignment of the destination group within the rail (-1.0 to 1.0)
  final double groupAlignment;

  /// Minimum width of the rail
  final double minWidth;

  /// Minimum width when extended
  final double minExtendedWidth;

  /// Whether to show selection indicator
  final bool useIndicator;

  /// Color of the selection indicator
  final Color? indicatorColor;

  /// Shape of the selection indicator
  final ShapeBorder? indicatorShape;

  @override
  State<AsNavigationRail> createState() => _AsNavigationRailState();
}

class _AsNavigationRailState extends State<AsNavigationRail> {
  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final width = widget.extended ? widget.minExtendedWidth : widget.minWidth;
    final backgroundColor = widget.backgroundColor ?? colorScheme.surface;

    return Material(
      color: backgroundColor,
      elevation: widget.elevation,
      child: SizedBox(
        width: width,
        child: Column(
          children: [
            if (widget.leading != null) ...[
              Padding(
                padding: const EdgeInsets.all(8),
                child: widget.leading,
              ),
              const SizedBox(height: 8),
            ],
            Expanded(
              child: SingleChildScrollView(
                child: Align(
                  alignment: Alignment(0, widget.groupAlignment),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < widget.destinations.length; i++)
                        _buildDestination(context, i, widget.destinations[i]),
                    ],
                  ),
                ),
              ),
            ),
            if (widget.trailing != null) ...[
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(8),
                child: widget.trailing,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDestination(BuildContext context, int index,
      AsNavigationRailDestination destination) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isSelected = widget.selectedIndex == index;
    final isHovered = _hoveredIndex == index;

    final showLabel = widget.extended ||
        widget.labelType == AsNavigationRailLabelType.all ||
        (widget.labelType == AsNavigationRailLabelType.selected && isSelected);

    final iconColor = isSelected
        ? colorScheme.onSecondaryContainer
        : colorScheme.onSurfaceVariant;

    final textColor =
        isSelected ? colorScheme.onSurface : colorScheme.onSurfaceVariant;

    final backgroundColor = isSelected && widget.useIndicator
        ? widget.indicatorColor ?? colorScheme.secondaryContainer
        : isHovered
            ? colorScheme.onSurface.withValues(alpha: 0.08)
            : Colors.transparent;

    final Widget content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: widget.extended ? null : 56,
          height: widget.extended ? null : 32,
          padding: widget.extended
              ? const EdgeInsets.symmetric(horizontal: 12, vertical: 8)
              : EdgeInsets.zero,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: widget.indicatorShape != null
                ? null
                : BorderRadius.circular(16),
            shape: widget.indicatorShape != null
                ? BoxShape.rectangle
                : BoxShape.rectangle,
          ),
          child: widget.extended
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconTheme(
                      data: IconThemeData(color: iconColor, size: 24),
                      child: isSelected && destination.selectedIcon != null
                          ? destination.selectedIcon!
                          : destination.icon,
                    ),
                    if (destination.label != null) ...[
                      const SizedBox(width: 12),
                      Flexible(
                        child: Text(
                          destination.label!,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ],
                )
              : Center(
                  child: IconTheme(
                    data: IconThemeData(color: iconColor, size: 24),
                    child: isSelected && destination.selectedIcon != null
                        ? destination.selectedIcon!
                        : destination.icon,
                  ),
                ),
        ),
        if (!widget.extended && showLabel && destination.label != null) ...[
          const SizedBox(height: 4),
          Text(
            destination.label!,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );

    return Padding(
      padding: destination.padding ??
          const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: MouseRegion(
        onEnter: (_) => setState(() => _hoveredIndex = index),
        onExit: (_) => setState(() => _hoveredIndex = null),
        child: GestureDetector(
          onTap: () {
            HapticFeedback.lightImpact();
            widget.onDestinationSelected?.call(index);
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: content,
          ),
        ),
      ),
    );
  }
}
