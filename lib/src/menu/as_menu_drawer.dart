import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Extension methods for BuildContext to work with AsMenuDrawer
extension AsMenuDrawerContext on BuildContext {
  /// Opens an AsMenuDrawer as an overlay.
  ///
  /// [items] The list of menu items to display
  /// [width] The width of the drawer (defaults to 280.0)
  /// [header] Optional header widget to display at the top
  /// [footer] Optional footer widget to display at the bottom
  /// [barrierDismissible] Whether tapping outside closes the drawer (defaults to true)
  /// [barrierColor] Color of the barrier behind the drawer (defaults to semi-transparent black)
  void showAsMenuDrawer({
    required List<AsMenuDrawerItem> items,
    double width = 280.0,
    Widget? header,
    Widget? footer,
    bool barrierDismissible = true,
    Color? barrierColor,
  }) {
    final overlay = Overlay.of(this);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => _DrawerOverlay(
        drawer: AsMenuDrawer(
          items: items,
          width: width,
          header: header,
          footer: footer,
          isOverlay: true,
          onDismiss: () => overlayEntry.remove(),
        ),
        onDismiss: () => overlayEntry.remove(),
        barrierDismissible: barrierDismissible,
        barrierColor: barrierColor,
      ),
    );

    overlay.insert(overlayEntry);
  }
}

class _DrawerOverlay extends StatefulWidget {
  const _DrawerOverlay({
    required this.drawer,
    required this.onDismiss,
    required this.barrierDismissible,
    this.barrierColor,
  });

  final AsMenuDrawer drawer;
  final VoidCallback onDismiss;
  final bool barrierDismissible;
  final Color? barrierColor;

  @override
  State<_DrawerOverlay> createState() => _DrawerOverlayState();
}

class _DrawerOverlayState extends State<_DrawerOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _dismiss() async {
    await _animationController.reverse();
    widget.onDismiss();
  }

  @override
  Widget build(BuildContext context) {
    final platformType = PlatformType.currentPlatform();
    final isCupertino = platformType == PlatformType.cupertino;

    return GestureDetector(
      onTap: widget.barrierDismissible ? _dismiss : null,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Stack(
            children: [
              // Barrier
              FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  color: widget.barrierColor ??
                      (isCupertino
                          ? CupertinoColors.black.withValues(alpha: 0.3)
                          : Colors.black.withValues(alpha: 0.5)),
                ),
              ),
              // Drawer
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                width: widget.drawer.width,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: GestureDetector(
                    onTap: () {}, // Prevent taps from going through to barrier
                    child: widget.drawer,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// A platform-adaptive navigation drawer that provides consistent navigation
/// across Material and Cupertino platforms.
///
/// The AsMenuDrawer automatically adapts its styling based on the current platform,
/// using Material Design on Android/Web and Cupertino styling on iOS/macOS.
class AsMenuDrawer extends StatelessWidget {
  /// Creates a navigation drawer.
  ///
  /// [items] The list of menu items to display
  /// [width] The width of the drawer (defaults to 280.0)
  /// [header] Optional header widget to display at the top
  /// [footer] Optional footer widget to display at the bottom
  /// [isOverlay] Whether this drawer is used in an overlay (defaults to false)
  const AsMenuDrawer({
    required this.items,
    super.key,
    this.width = 280.0,
    this.header,
    this.footer,
    this.isOverlay = false,
    this.onDismiss,
  });

  /// The list of menu items to display
  final List<AsMenuDrawerItem> items;

  /// The width of the drawer
  final double width;

  /// Optional header widget displayed at the top
  final Widget? header;

  /// Optional footer widget displayed at the bottom
  final Widget? footer;

  /// Whether this drawer is used in an overlay
  final bool isOverlay;

  /// Callback to dismiss the drawer (used for overlay mode)
  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    final platformType = PlatformType.currentPlatform();
    final isCupertino = platformType == PlatformType.cupertino;

    final drawerContent = Container(
      width: width,
      decoration: BoxDecoration(
        color: isCupertino
            ? CupertinoTheme.of(context).scaffoldBackgroundColor
            : Theme.of(context).colorScheme.surface,
        border: Border(
          right: BorderSide(
            color: isCupertino
                ? CupertinoColors.separator
                : Theme.of(context).colorScheme.outlineVariant,
            width: 0.5,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(2, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (header != null) header!,
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                for (final item in items) 
                  _DrawerItemWidget(
                    item: item, 
                    onDismiss: onDismiss,
                  ),
              ],
            ),
          ),
          if (footer != null) footer!,
        ],
      ),
    );

    if (isOverlay || isCupertino) {
      return drawerContent;
    } else {
      return Drawer(
        width: width,
        child: drawerContent,
      );
    }
  }
}

/// A menu item for the AsMenuDrawer.
class AsMenuDrawerItem {
  /// Creates a drawer menu item.
  ///
  /// [child] The widget to display for this item
  /// [onTap] Callback when item is tapped
  /// [enabled] Whether the item is enabled (defaults to true)
  const AsMenuDrawerItem({
    required this.child,
    this.onTap,
    this.enabled = true,
  });

  /// Creates a drawer menu item with icon and text.
  ///
  /// [icon] The icon to display
  /// [text] The text to display
  /// [onTap] Callback when item is tapped
  /// [enabled] Whether the item is enabled (defaults to true)
  /// [selected] Whether the item is currently selected (defaults to false)
  AsMenuDrawerItem.withIcon({
    required BuildContext context,
    required IconData icon,
    required String text,
    this.onTap,
    this.enabled = true,
    bool selected = false,
  }) : child = Row(
          children: [
            Icon(icon,
                color: selected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface),
            const SizedBox(width: 8),
            Text(text,
                style: TextStyle(
                  color: selected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurface,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                )),
          ],
        );

  /// Creates a drawer menu item with only text.
  ///
  /// [text] The text to display
  /// [onTap] Callback when item is tapped
  /// [enabled] Whether the item is enabled (defaults to true)
  /// [selected] Whether the item is currently selected (defaults to false)
  AsMenuDrawerItem.text({
    required BuildContext context,
    required String text,
    this.onTap,
    this.enabled = true,
    bool selected = false,
  }) : child = Text(text,
            style: TextStyle(
              color: selected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
            ));

  /// Creates a divider item.
  const AsMenuDrawerItem.divider()
      : child = const AsDivider(),
        onTap = null,
        enabled = false;

  /// Creates a header item with custom styling.
  ///
  /// [text] The header text
  /// [subtitle] Optional subtitle text
  AsMenuDrawerItem.header({
    required String text,
    String? subtitle,
  })  : child = _HeaderDrawerItem(text: text, subtitle: subtitle),
        onTap = null,
        enabled = false;

  /// The widget to display for this item
  final Widget child;

  /// Callback executed when the item is tapped
  final VoidCallback? onTap;

  /// Whether the item is enabled
  final bool enabled;
}

class _HeaderDrawerItem extends StatelessWidget {
  const _HeaderDrawerItem({
    required this.text,
    this.subtitle,
  });

  final String text;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final platformType = PlatformType.currentPlatform();
    final isCupertino = platformType == PlatformType.cupertino;
    final theme = Theme.of(context);

    Color textColor;
    Color? subtitleColor;

    if (isCupertino) {
      textColor = CupertinoColors.label.resolveFrom(context);
      subtitleColor = CupertinoColors.secondaryLabel.resolveFrom(context);
    } else {
      textColor = theme.colorScheme.onSurface;
      subtitleColor = theme.colorScheme.onSurface.withValues(alpha: 0.7);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 4),
          Text(
            subtitle!,
            style: TextStyle(
              color: subtitleColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ],
    );
  }
}

class _DrawerItemWidget extends StatefulWidget {
  const _DrawerItemWidget({
    required this.item,
    this.onDismiss,
  });

  final AsMenuDrawerItem item;
  final VoidCallback? onDismiss;

  @override
  State<_DrawerItemWidget> createState() => _DrawerItemWidgetState();
}

class _DrawerItemWidgetState extends State<_DrawerItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: AsButton.ghost(
        onPressed: () {
          widget.item.onTap?.call();
          widget.onDismiss?.call();
        },
        child: widget.item.child,
      ),
    );
  }
}
