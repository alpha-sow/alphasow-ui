import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

/// Defines how the menu should be triggered.
enum MenuTriggerMode {
  /// Menu appears only on tap
  tap,

  /// Menu appears only on long press
  longPress,

  /// Menu appears on both tap and long press
  both,
}

/// Defines where the menu should appear relative to the trigger widget.
enum MenuPosition {
  /// Menu appears below the trigger widget (default)
  bottom,

  /// Menu appears above the trigger widget
  top,

  /// Menu appears to the left of the trigger widget
  left,

  /// Menu appears to the right of the trigger widget
  right,

  /// Menu appears at the bottom-left corner of the trigger widget
  bottomLeft,

  /// Menu appears at the bottom-right corner of the trigger widget
  bottomRight,

  /// Menu appears at the top-left corner of the trigger widget
  topLeft,

  /// Menu appears at the top-right corner of the trigger widget
  topRight,
}

/// A customizable popup menu widget that appears on click.
///
/// The AsMenuDown provides a clean popup menu interface with rounded corners
/// and support for custom menu items with icons, text, and dividers.
class AsMenuDown extends StatefulWidget {
  /// Creates a popup menu.
  ///
  /// [child] The widget that triggers the menu when clicked
  /// [items] The list of menu items to display
  /// [borderRadius] Custom border radius (defaults to 8.0)
  /// [offset] Custom offset for menu position
  /// [triggerMode] How the menu should be triggered (tap, longPress, or both)
  /// [position] Where the menu should appear relative to the trigger widget
  const AsMenuDown({
    required this.child,
    required this.items,
    super.key,
    this.borderRadius = 8.0,
    this.offset = const Offset(0, 4),
    this.triggerMode = MenuTriggerMode.tap,
    this.position = MenuPosition.bottom,
  });

  /// Creates a popup menu with an AsButton trigger containing text.
  ///
  /// [text] The button text
  /// [items] The list of menu items to display
  /// [variant] The button variant (defaults to primary)
  /// [borderRadius] Custom border radius (defaults to 8.0)
  /// [offset] Custom offset for menu position
  /// [triggerMode] How the menu should be triggered (tap, longPress, or both)
  /// [position] Where the menu should appear relative to the trigger widget
  AsMenuDown.buttonText({
    required String text,
    required this.items,
    super.key,
    Variant variant = Variant.primary,
    this.borderRadius = 8.0,
    this.offset = const Offset(0, 4),
    this.triggerMode = MenuTriggerMode.tap,
    this.position = MenuPosition.bottom,
  }) : child = _ButtonChild(text: text, variant: variant);

  /// Creates a popup menu with an AsButton trigger containing an icon.
  ///
  /// [icon] The button icon
  /// [items] The list of menu items to display
  /// [variant] The button variant (defaults to primary)
  /// [borderRadius] Custom border radius (defaults to 8.0)
  /// [offset] Custom offset for menu position
  /// [triggerMode] How the menu should be triggered (tap, longPress, or both)
  /// [position] Where the menu should appear relative to the trigger widget
  AsMenuDown.buttonIcon({
    required IconData icon,
    required this.items,
    super.key,
    Variant variant = Variant.primary,
    this.borderRadius = 8.0,
    this.offset = const Offset(0, 4),
    this.triggerMode = MenuTriggerMode.tap,
    this.position = MenuPosition.bottom,
  }) : child = _ButtonChild(icon: icon, variant: variant);

  /// Creates a popup menu with an AsButton trigger containing both icon and text.
  ///
  /// [text] The button text
  /// [icon] The button icon
  /// [items] The list of menu items to display
  /// [variant] The button variant (defaults to primary)
  /// [borderRadius] Custom border radius (defaults to 8.0)
  /// [offset] Custom offset for menu position
  /// [triggerMode] How the menu should be triggered (tap, longPress, or both)
  /// [position] Where the menu should appear relative to the trigger widget
  AsMenuDown.buttonIconText({
    required String text,
    required IconData icon,
    required this.items,
    super.key,
    Variant variant = Variant.primary,
    this.borderRadius = 8.0,
    this.offset = const Offset(0, 4),
    this.triggerMode = MenuTriggerMode.tap,
    this.position = MenuPosition.bottom,
  }) : child = _ButtonChild(text: text, icon: icon, variant: variant);

  /// The widget that triggers the menu when clicked
  final Widget child;

  /// The list of menu items to display
  final List<AsMenuDownItem> items;

  /// Border radius for the popup menu
  final double borderRadius;

  /// Offset for menu position relative to the trigger widget
  final Offset offset;

  /// How the menu should be triggered
  final MenuTriggerMode triggerMode;

  /// Where the menu should appear relative to the trigger widget
  final MenuPosition position;

  @override
  State<AsMenuDown> createState() => _AsMenuDownState();
}

class _ButtonChild extends StatelessWidget {
  const _ButtonChild({
    required this.variant,
    this.text,
    this.icon,
  });

  final Variant variant;
  final String? text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    // This widget is just a placeholder - the actual button is built in _AsMenuDownState
    return const SizedBox.shrink();
  }
}

class _AsMenuDownState extends State<AsMenuDown> {
  final GlobalKey _key = GlobalKey();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;

  Widget _createButton({
    required Variant variant,
    required VoidCallback onPressed,
    String? text,
    IconData? icon,
  }) {
    // For icon-only buttons, use AsIconButton
    if (text == null && icon != null) {
      switch (variant) {
        case Variant.primary:
          return AsIconButton(icon: icon, onPressed: onPressed);
        case Variant.secondary:
          return AsIconButton.secondary(icon: icon, onPressed: onPressed);
        case Variant.destructive:
          return AsIconButton.destructive(icon: icon, onPressed: onPressed);
        case Variant.outline:
          return AsIconButton.outlined(icon: icon, onPressed: onPressed);
        case Variant.ghost:
          return AsIconButton.ghost(icon: icon, onPressed: onPressed);
      }
    }

    // For text or text+icon buttons, use AsButton
    Widget child;

    if (text != null && icon != null) {
      child = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16),
          const SizedBox(width: 8),
          Text(text),
        ],
      );
    } else if (text != null) {
      child = Text(text);
    } else {
      child = const Icon(Icons.more_vert, size: 16);
    }

    switch (variant) {
      case Variant.primary:
        return AsButton(onPressed: onPressed, child: child);
      case Variant.secondary:
        return AsButton.secondary(onPressed: onPressed, child: child);
      case Variant.destructive:
        return AsButton.destructive(onPressed: onPressed, child: child);
      case Variant.outline:
        return AsButton.outlined(onPressed: onPressed, child: child);
      case Variant.ghost:
        return AsButton.ghost(onPressed: onPressed, child: child);
    }
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  void _toggleMenu() {
    if (_isOpen) {
      _closeMenu();
    } else {
      _openMenu();
    }
  }

  void _openMenu() {
    final renderBox = _key.currentContext!.findRenderObject()! as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);
    final screenSize = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;

    // Calculate menu position based on MenuPosition with screen boundary checks
    double? left;
    double? top;
    double? right;
    double? bottom;

    switch (widget.position) {
      case MenuPosition.bottom:
        left = offset.dx + widget.offset.dx;
        top = offset.dy + size.height + widget.offset.dy;
        // Ensure menu doesn't go off right edge (accounting for safe area)
        if (left > screenSize.width - 200 - padding.right) {
          left = screenSize.width - 200 - padding.right;
        }
        // Ensure menu doesn't go off left edge (accounting for safe area)
        if (left < padding.left) {
          left = padding.left;
        }
      case MenuPosition.top:
        left = offset.dx + widget.offset.dx;
        bottom = screenSize.height - offset.dy + widget.offset.dy;
        // Ensure menu doesn't go off right edge (accounting for safe area)
        if (left > screenSize.width - 200 - padding.right) {
          left = screenSize.width - 200 - padding.right;
        }
        // Ensure menu doesn't go off left edge (accounting for safe area)
        if (left < padding.left) {
          left = padding.left;
        }
        // Ensure bottom respects safe area
        if (bottom < padding.bottom) {
          bottom = padding.bottom;
        }
      case MenuPosition.left:
        right = screenSize.width - offset.dx + widget.offset.dx;
        top = offset.dy + widget.offset.dy;
        // Ensure menu doesn't go off top edge (accounting for safe area)
        if (top < padding.top) {
          top = padding.top;
        }
        // Ensure menu doesn't go off bottom edge (accounting for safe area)
        if (top > screenSize.height - 200 - padding.bottom) {
          top = screenSize.height - 200 - padding.bottom;
        }
        // Ensure right respects safe area
        if (right < padding.right) {
          right = padding.right;
        }
      case MenuPosition.right:
        left = offset.dx + size.width + widget.offset.dx;
        top = offset.dy + widget.offset.dy;
        // Check if menu would go off right edge (accounting for safe area)
        if (left + 200 > screenSize.width - padding.right) {
          left = offset.dx - 200 + widget.offset.dx;
          // If still off screen, clamp to right edge with safe area
          if (left < padding.left) {
            left = screenSize.width - 200 - padding.right;
          }
        }
        // Ensure menu doesn't go off top edge (accounting for safe area)
        if (top < padding.top) {
          top = padding.top;
        }
        // Ensure menu doesn't go off bottom edge (accounting for safe area)
        if (top > screenSize.height - 200 - padding.bottom) {
          top = screenSize.height - 200 - padding.bottom;
        }
      case MenuPosition.bottomLeft:
        left = offset.dx + widget.offset.dx;
        // Ensure left doesn't go into left safe area
        if (left < padding.left) {
          left = padding.left;
        }
        top = offset.dy + size.height + widget.offset.dy;
      case MenuPosition.bottomRight:
        right = screenSize.width - (offset.dx + size.width) + widget.offset.dx;
        // Ensure right doesn't go into right safe area
        if (right < padding.right) {
          right = padding.right;
        }
        top = offset.dy + size.height + widget.offset.dy;
      case MenuPosition.topLeft:
        left = offset.dx + widget.offset.dx;
        // Ensure left doesn't go into left safe area
        if (left < padding.left) {
          left = padding.left;
        }
        bottom = screenSize.height - offset.dy + widget.offset.dy;
        // Ensure bottom doesn't go into bottom safe area
        if (bottom < padding.bottom) {
          bottom = padding.bottom;
        }
      case MenuPosition.topRight:
        right = screenSize.width - (offset.dx + size.width) + widget.offset.dx;
        // Ensure right doesn't go into right safe area
        if (right < padding.right) {
          right = padding.right;
        }
        bottom = screenSize.height - offset.dy + widget.offset.dy;
        // Ensure bottom doesn't go into bottom safe area
        if (bottom < padding.bottom) {
          bottom = padding.bottom;
        }
    }

    _overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: _closeMenu,
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            Positioned(
              left: left,
              top: top,
              right: right,
              bottom: bottom,
              child: _PopupMenu(
                items: widget.items,
                onItemSelected: _closeMenu,
                borderRadius: widget.borderRadius,
              ),
            ),
          ],
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    setState(() => _isOpen = true);
  }

  void _closeMenu() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() => _isOpen = false);
  }

  @override
  Widget build(BuildContext context) {
    final onTapHandler = (widget.triggerMode == MenuTriggerMode.tap ||
            widget.triggerMode == MenuTriggerMode.both)
        ? _toggleMenu
        : null;
    final onLongPressHandler =
        (widget.triggerMode == MenuTriggerMode.longPress ||
                widget.triggerMode == MenuTriggerMode.both)
            ? _toggleMenu
            : null;

    // If the child is a _ButtonChild, create the actual button with onPressed
    if (widget.child is _ButtonChild) {
      final buttonChild = widget.child as _ButtonChild;
      final actualButton = _createButton(
        variant: buttonChild.variant,
        onPressed: _toggleMenu,
        text: buttonChild.text,
        icon: buttonChild.icon,
      );

      return Container(
        key: _key,
        child: actualButton,
      );
    }

    // If the child is an AsButton or AsIconButton, we need to wrap it to override its onPressed
    if (widget.child is AsButton || widget.child is AsIconButton) {
      return GestureDetector(
        key: _key,
        onTap: onTapHandler,
        onLongPress: onLongPressHandler,
        child: AbsorbPointer(
          child: widget.child,
        ),
      );
    }

    return GestureDetector(
      key: _key,
      onTap: onTapHandler,
      onLongPress: onLongPressHandler,
      child: widget.child,
    );
  }
}

/// A menu item for the AsMenuDown popup.
class AsMenuDownItem {
  /// Creates a popup menu item.
  ///
  /// [child] The widget to display for this item
  /// [onTap] Callback when item is tapped
  /// [enabled] Whether the item is enabled (defaults to true)
  const AsMenuDownItem({
    required this.child,
    this.onTap,
    this.enabled = true,
  });

  /// Creates a popup menu item with icon and text.
  ///
  /// [icon] The icon to display
  /// [text] The text to display
  /// [onTap] Callback when item is tapped
  /// [enabled] Whether the item is enabled (defaults to true)
  AsMenuDownItem.withIcon({
    required IconData icon,
    required String text,
    this.onTap,
    this.enabled = true,
  }) : child = _IconTextMenuItem(icon: icon, text: text);

  /// Creates a button menu item using AsButton variants.
  ///
  /// [text] The button text
  /// [onTap] Callback when button is tapped
  /// [variant] The button variant (primary, secondary, destructive, outlined, ghost, link)
  /// [enabled] Whether the item is enabled (defaults to true)
  AsMenuDownItem.button({
    required String text,
    this.onTap,
    Variant variant = Variant.primary,
    this.enabled = true,
  }) : child = _ButtonMenuItem(text: text, variant: variant);

  /// Creates a button menu item with icon and text using AsButton variants.
  ///
  /// [text] The button text
  /// [icon] The icon to display
  /// [onTap] Callback when button is tapped
  /// [variant] The button variant (primary, secondary, destructive, outlined, ghost, link)
  /// [enabled] Whether the item is enabled (defaults to true)
  AsMenuDownItem.buttonWithIcon({
    required String text,
    required IconData icon,
    this.onTap,
    Variant variant = Variant.primary,
    this.enabled = true,
  }) : child = _ButtonMenuItem(text: text, icon: icon, variant: variant);

  /// Creates a divider item.
  const AsMenuDownItem.divider()
      : child = const AsDivider(thickness: 0.5),
        onTap = null,
        enabled = false;

  /// The widget to display for this item
  final Widget child;

  /// Callback executed when the item is tapped
  final VoidCallback? onTap;

  /// Whether the item is enabled
  final bool enabled;
}

class _IconTextMenuItem extends StatelessWidget {
  const _IconTextMenuItem({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 16,
          color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class _ButtonMenuItem extends StatelessWidget {
  const _ButtonMenuItem({
    required this.text,
    this.icon,
    this.variant = Variant.primary,
  });

  final String text;
  final IconData? icon;
  final Variant variant;

  Widget _buildButtonChild() {
    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16),
          const SizedBox(width: 8),
          Text(text),
        ],
      );
    }
    return Text(text);
  }

  @override
  Widget build(BuildContext context) {
    final child = _buildButtonChild();

    switch (variant) {
      case Variant.primary:
        return AsButton(
          onPressed: () {},
          child: child,
        );
      case Variant.secondary:
        return AsButton.secondary(
          onPressed: () {},
          child: child,
        );
      case Variant.destructive:
        return AsButton.destructive(
          onPressed: () {},
          child: child,
        );
      case Variant.outline:
        return AsButton.outlined(
          onPressed: () {},
          child: child,
        );
      case Variant.ghost:
        return AsButton.ghost(
          onPressed: () {},
          child: child,
        );
    }
  }
}

class _ButtonMenuItemWrapper extends StatelessWidget {
  const _ButtonMenuItemWrapper({
    required this.item,
    required this.onTap,
  });

  final AsMenuDownItem item;
  final VoidCallback onTap;

  Widget _buildButtonChild(_ButtonMenuItem buttonChild) {
    if (buttonChild.icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(buttonChild.icon, size: 16),
          const SizedBox(width: 8),
          Text(buttonChild.text),
        ],
      );
    }
    return Text(buttonChild.text);
  }

  @override
  Widget build(BuildContext context) {
    final buttonChild = item.child as _ButtonMenuItem;
    final child = _buildButtonChild(buttonChild);

    Widget button;
    switch (buttonChild.variant) {
      case Variant.primary:
        button = AsButton(
          onPressed: item.enabled ? onTap : null,
          child: child,
        );
      case Variant.secondary:
        button = AsButton.secondary(
          onPressed: item.enabled ? onTap : null,
          child: child,
        );
      case Variant.destructive:
        button = AsButton.destructive(
          onPressed: item.enabled ? onTap : null,
          child: child,
        );
      case Variant.outline:
        button = AsButton.outlined(
          onPressed: item.enabled ? onTap : null,
          child: child,
        );
      case Variant.ghost:
        button = AsButton.ghost(
          onPressed: item.enabled ? onTap : null,
          child: child,
        );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: button,
    );
  }
}

class _PopupMenu extends StatelessWidget {
  const _PopupMenu({
    required this.items,
    required this.onItemSelected,
    required this.borderRadius,
  });

  final List<AsMenuDownItem> items;
  final VoidCallback onItemSelected;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final item in items)
                item.child is AsDivider
                    ? item.child
                    : item.child is _ButtonMenuItem
                        ? _ButtonMenuItemWrapper(
                            item: item,
                            onTap: () {
                              item.onTap?.call();
                              onItemSelected();
                            },
                          )
                        : _PopupMenuItem(
                            item: item,
                            onTap: () {
                              item.onTap?.call();
                              onItemSelected();
                            },
                          ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PopupMenuItem extends StatefulWidget {
  const _PopupMenuItem({
    required this.item,
    required this.onTap,
  });

  final AsMenuDownItem item;
  final VoidCallback onTap;

  @override
  State<_PopupMenuItem> createState() => _PopupMenuItemState();
}

class _PopupMenuItemState extends State<_PopupMenuItem> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Enhanced interactive effects that work well in both light and dark modes
    Color getInteractiveColor() {
      if (!widget.item.enabled) {
        return Colors.transparent;
      }

      // Use theme-adaptive intensity based on state
      final isLightMode = theme.brightness == Brightness.light;
      double intensity;

      if (_isPressed) {
        // Stronger effect when pressed
        intensity = isLightMode ? 0.16 : 0.20;
      } else if (_isHovered) {
        // Subtle effect when hovered
        intensity = isLightMode ? 0.08 : 0.12;
      } else {
        return Colors.transparent;
      }

      final overlayColor = isLightMode
          ? Colors.black.withValues(alpha: intensity)
          : Colors.white.withValues(alpha: intensity);

      return Color.alphaBlend(overlayColor, theme.colorScheme.surface);
    }

    return MouseRegion(
      onEnter:
          widget.item.enabled ? (_) => setState(() => _isHovered = true) : null,
      onExit: widget.item.enabled
          ? (_) => setState(() => _isHovered = false)
          : null,
      cursor: widget.item.enabled
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: GestureDetector(
        onTapDown: widget.item.enabled
            ? (_) => setState(() => _isPressed = true)
            : null,
        onTapUp: widget.item.enabled
            ? (_) => setState(() => _isPressed = false)
            : null,
        onTapCancel: widget.item.enabled
            ? () => setState(() => _isPressed = false)
            : null,
        onTap: widget.item.enabled ? widget.onTap : null,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          color: getInteractiveColor(),
          child: DefaultTextStyle(
            style: TextStyle(
              color: widget.item.enabled
                  ? theme.colorScheme.onSurface
                  : theme.colorScheme.onSurface.withValues(alpha: 0.38),
            ),
            child: widget.item.child,
          ),
        ),
      ),
    );
  }
}
