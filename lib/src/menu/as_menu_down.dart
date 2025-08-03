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
  const AsMenuDown({
    required this.child,
    required this.items,
    super.key,
    this.borderRadius = 8.0,
    this.offset = const Offset(0, 4),
    this.triggerMode = MenuTriggerMode.tap,
  });

  /// Creates a popup menu with an AsButton trigger containing text.
  ///
  /// [text] The button text
  /// [items] The list of menu items to display
  /// [variant] The button variant (defaults to primary)
  /// [borderRadius] Custom border radius (defaults to 8.0)
  /// [offset] Custom offset for menu position
  /// [triggerMode] How the menu should be triggered (tap, longPress, or both)
  AsMenuDown.buttonText({
    required String text,
    required this.items,
    super.key,
    Variant variant = Variant.primary,
    this.borderRadius = 8.0,
    this.offset = const Offset(0, 4),
    this.triggerMode = MenuTriggerMode.tap,
  }) : child = _createButton(text: text, variant: variant);

  /// Creates a popup menu with an AsButton trigger containing an icon.
  ///
  /// [icon] The button icon
  /// [items] The list of menu items to display
  /// [variant] The button variant (defaults to primary)
  /// [borderRadius] Custom border radius (defaults to 8.0)
  /// [offset] Custom offset for menu position
  /// [triggerMode] How the menu should be triggered (tap, longPress, or both)
  AsMenuDown.buttonIcon({
    required IconData icon,
    required this.items,
    super.key,
    Variant variant = Variant.primary,
    this.borderRadius = 8.0,
    this.offset = const Offset(0, 4),
    this.triggerMode = MenuTriggerMode.tap,
  }) : child = _createButton(icon: icon, variant: variant);

  /// Creates a popup menu with an AsButton trigger containing both icon and text.
  ///
  /// [text] The button text
  /// [icon] The button icon
  /// [items] The list of menu items to display
  /// [variant] The button variant (defaults to primary)
  /// [borderRadius] Custom border radius (defaults to 8.0)
  /// [offset] Custom offset for menu position
  /// [triggerMode] How the menu should be triggered (tap, longPress, or both)
  AsMenuDown.buttonIconText({
    required String text,
    required IconData icon,
    required this.items,
    super.key,
    Variant variant = Variant.primary,
    this.borderRadius = 8.0,
    this.offset = const Offset(0, 4),
    this.triggerMode = MenuTriggerMode.tap,
  }) : child = _createButton(text: text, icon: icon, variant: variant);

  static Widget _createButton({
    required Variant variant,
    String? text,
    IconData? icon,
  }) {
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
    } else if (icon != null) {
      child = Icon(icon, size: 16);
    } else if (text != null) {
      child = Text(text);
    } else {
      child = const Icon(Icons.more_vert, size: 16);
    }

    switch (variant) {
      case Variant.primary:
        return AsButton(onPressed: () {}, child: child);
      case Variant.secondary:
        return AsButton.secondary(onPressed: () {}, child: child);
      case Variant.destructive:
        return AsButton.destructive(onPressed: () {}, child: child);
      case Variant.outline:
        return AsButton.outlined(onPressed: () {}, child: child);
      case Variant.ghost:
        return AsButton.ghost(onPressed: () {}, child: child);
      case Variant.link:
        return AsButton.link(onPressed: () {}, child: child);
    }
  }

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

  @override
  State<AsMenuDown> createState() => _AsMenuDownState();
}

class _AsMenuDownState extends State<AsMenuDown> {
  final GlobalKey _key = GlobalKey();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;

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

    _overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: _closeMenu,
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            Positioned(
              left: offset.dx + widget.offset.dx,
              top: offset.dy + size.height + widget.offset.dy,
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

    // If the child is an AsButton, we need to wrap it to override its onPressed
    if (widget.child is AsButton) {
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
      case Variant.link:
        return AsButton.link(
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
      case Variant.link:
        button = AsButton.link(
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter:
          widget.item.enabled ? (_) => setState(() => _isHovered = true) : null,
      onExit: widget.item.enabled
          ? (_) => setState(() => _isHovered = false)
          : null,
      child: GestureDetector(
        onTap: widget.item.enabled ? widget.onTap : null,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          color: widget.item.enabled && _isHovered
              ? theme.colorScheme.onSurface.withValues(alpha: 0.08)
              : Colors.transparent,
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
