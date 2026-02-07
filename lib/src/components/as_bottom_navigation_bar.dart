import 'package:alphasow_ui/utils/platform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Represents an item in the bottom navigation bar.
///
/// This class defines the structure for bottom navigation bar items,
/// including the icon, optional selected icon, and label.
class AsBottomNavigationBarItem {
  /// Creates a bottom navigation bar item.
  ///
  /// The [icon] parameter is required and can be either an IconData or a Widget.
  /// The [label] parameter is required for accessibility and display purposes.
  const AsBottomNavigationBarItem({
    required this.icon,
    required this.label,
    this.selectedIcon,
    this.backgroundColor,
    this.tooltip,
  });

  /// The icon to display for this item. Can be IconData or Widget.
  final dynamic icon;

  /// The icon to display when this item is selected.
  /// If null, uses [icon].
  final Widget? selectedIcon;

  /// The text label for this item.
  final String label;

  /// Background color for this specific item.
  final Color? backgroundColor;

  /// Tooltip text for this item.
  final String? tooltip;

  /// Helper method to get the icon widget.
  Widget _getIconWidget(bool isSelected) {
    if (isSelected && selectedIcon != null) {
      return selectedIcon!;
    }

    if (icon is IconData) {
      return Icon(icon as IconData);
    } else if (icon is Widget) {
      return icon as Widget;
    } else {
      throw ArgumentError('Icon must be either IconData or Widget');
    }
  }

  /// Converts to Material BottomNavigationBarItem.
  BottomNavigationBarItem toMaterialItem() {
    return BottomNavigationBarItem(
      icon: _getIconWidget(false),
      activeIcon: selectedIcon,
      label: label,
      backgroundColor: backgroundColor,
      tooltip: tooltip,
    );
  }

  /// Converts to Cupertino BottomNavigationBarItem.
  BottomNavigationBarItem toCupertinoItem() {
    return BottomNavigationBarItem(
      icon: _getIconWidget(false),
      activeIcon: selectedIcon,
      label: label,
      tooltip: tooltip,
    );
  }
}

/// Bottom navigation bar types for different display styles.
enum AsBottomNavigationBarType {
  /// Fixed type - all items have equal width
  fixed,

  /// Shifting type - selected item is wider
  shifting,
}

/// A platform-adaptive bottom navigation bar widget that automatically returns
/// [CupertinoTabBar] on iOS/macOS platforms and [BottomNavigationBar] on other platforms.
///
/// This widget provides a unified API that works across platforms while
/// maintaining native look and feel. When on Cupertino platforms (iOS/macOS),
/// it returns a native [CupertinoTabBar]. On Material platforms (Android, etc.),
/// it returns a native [BottomNavigationBar].
///
/// Example usage:
/// ```dart
/// AsBottomNavigationBar(
///   currentIndex: _selectedIndex,
///   onTap: (index) => setState(() => _selectedIndex = index),
///   items: [
///     AsBottomNavigationBarItem(
///       icon: Icons.home,
///       label: 'Home',
///     ),
///     AsBottomNavigationBarItem(
///       icon: Icons.search,
///       label: 'Search',
///     ),
///   ],
/// )
/// ```
class AsBottomNavigationBar extends StatelessWidget {
  /// Creates a platform-adaptive bottom navigation bar.
  ///
  /// [items] The list of navigation items
  /// [currentIndex] The index of the currently selected item (defaults to 0)
  /// [onTap] Callback when an item is tapped
  /// [type] The type of bottom navigation bar (defaults to fixed) - Material only
  /// [backgroundColor] The background color of the navigation bar
  /// [elevation] The elevation of the navigation bar (defaults to 8.0) - Material only
  /// [selectedItemColor] Color for the selected item
  /// [unselectedItemColor] Color for unselected items
  /// [selectedFontSize] Font size for selected item label (defaults to 14.0) - Material only
  /// [unselectedFontSize] Font size for unselected item labels (defaults to 12.0) - Material only
  /// [iconSize] Size of the icons (defaults to 24.0) - Material only
  /// [enableFeedback] Whether to enable haptic feedback (defaults to true) - Material only
  /// [showSelectedLabels] Whether to show labels for selected items (defaults to true) - Material only
  /// [showUnselectedLabels] Whether to show labels for unselected items (defaults to true) - Material only
  const AsBottomNavigationBar({
    required this.items,
    this.currentIndex = 0,
    this.onTap,
    this.type = AsBottomNavigationBarType.fixed,
    this.backgroundColor,
    this.elevation = 8.0,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.selectedFontSize = 14.0,
    this.unselectedFontSize = 12.0,
    this.iconSize = 24.0,
    this.enableFeedback = true,
    this.showSelectedLabels = true,
    this.showUnselectedLabels = true,
    this.mouseCursor,
    this.useLegacyColorScheme = false,
    super.key,
  })  : assert(items.length >= 2,
            'Bottom navigation bar must have at least 2 items'),
        assert(currentIndex >= 0, 'Current index cannot be negative');

  /// The list of navigation items
  final List<AsBottomNavigationBarItem> items;

  /// The index of the currently selected item
  final int currentIndex;

  /// Callback executed when an item is tapped
  final ValueChanged<int>? onTap;

  /// The type of bottom navigation bar (Material only)
  final AsBottomNavigationBarType type;

  /// The background color of the navigation bar
  final Color? backgroundColor;

  /// The elevation of the navigation bar (Material only)
  final double elevation;

  /// Color for the selected item
  final Color? selectedItemColor;

  /// Color for unselected items
  final Color? unselectedItemColor;

  /// Font size for selected item label (Material only)
  final double selectedFontSize;

  /// Font size for unselected item labels (Material only)
  final double unselectedFontSize;

  /// Size of the icons (Material only)
  final double iconSize;

  /// Whether to enable haptic feedback (Material only)
  final bool enableFeedback;

  /// Whether to show labels for selected items (Material only)
  final bool showSelectedLabels;

  /// Whether to show labels for unselected items (Material only)
  final bool showUnselectedLabels;

  /// Mouse cursor for desktop platforms (Material only)
  final MouseCursor? mouseCursor;

  /// Whether to use legacy color scheme (Material only)
  final bool useLegacyColorScheme;

  @override
  Widget build(BuildContext context) {
    switch (PlatformType.of(context)) {
      case PlatformType.cupertino:
        return _buildCupertinoTabBar(context);
      case PlatformType.material:
        return _buildMaterialBottomNav(context);
    }
  }

  /// Gets the platform-specific navigation bar widget.
  /// Returns [CupertinoTabBar] on Cupertino platforms and [BottomNavigationBar] on Material platforms.
  Widget getPlatformWidget(BuildContext context) {
    switch (PlatformType.of(context)) {
      case PlatformType.cupertino:
        return _buildCupertinoTabBar(context);
      case PlatformType.material:
        return _buildMaterialBottomNav(context);
    }
  }

  /// Builds the Cupertino tab bar for iOS/macOS platforms.
  CupertinoTabBar _buildCupertinoTabBar(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    return CupertinoTabBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: backgroundColor,
      activeColor: selectedItemColor ?? theme.primaryColor,
      inactiveColor: unselectedItemColor ?? CupertinoColors.inactiveGray,
      items: items.map((item) => item.toCupertinoItem()).toList(),
    );
  }

  /// Builds the Material bottom navigation bar for Android and other platforms.
  BottomNavigationBar _buildMaterialBottomNav(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Determine colors based on theme and legacy settings
    Color defaultSelectedColor;
    Color defaultUnselectedColor;
    Color defaultBackgroundColor;

    if (useLegacyColorScheme) {
      defaultSelectedColor = theme.primaryColor;
      defaultUnselectedColor = theme.unselectedWidgetColor;
      defaultBackgroundColor = theme.canvasColor;
    } else {
      defaultSelectedColor = colorScheme.primary;
      defaultUnselectedColor = colorScheme.onSurfaceVariant;
      defaultBackgroundColor = colorScheme.surface;
    }

    final effectiveSelectedColor = selectedItemColor ?? defaultSelectedColor;
    final effectiveUnselectedColor =
        unselectedItemColor ?? defaultUnselectedColor;
    final effectiveBackgroundColor = backgroundColor ?? defaultBackgroundColor;

    // Convert AsBottomNavigationBarType to BottomNavigationBarType
    final materialType = type == AsBottomNavigationBarType.fixed
        ? BottomNavigationBarType.fixed
        : BottomNavigationBarType.shifting;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: materialType,
      backgroundColor: effectiveBackgroundColor,
      elevation: elevation,
      selectedItemColor: effectiveSelectedColor,
      unselectedItemColor: effectiveUnselectedColor,
      selectedFontSize: selectedFontSize,
      unselectedFontSize: unselectedFontSize,
      iconSize: iconSize,
      enableFeedback: enableFeedback,
      showSelectedLabels: showSelectedLabels,
      showUnselectedLabels: showUnselectedLabels,
      mouseCursor: mouseCursor,
      useLegacyColorScheme: useLegacyColorScheme,
      items: items.map((item) => item.toMaterialItem()).toList(),
    );
  }
}
