import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

/// A customizable dropdown menu widget without Material design dependencies.
///
/// The AsMenuDropdown provides a clean dropdown interface with rounded corners
/// and support for custom menu items with dividers.
class AsMenuDropdown<T> extends StatefulWidget {
  /// Creates a dropdown menu.
  ///
  /// [items] The list of menu items to display
  /// [onChanged] Callback when an item is selected
  /// [value] The currently selected value
  /// [hint] Placeholder text when no item is selected
  /// [borderRadius] Custom border radius (defaults to 8.0)
  const AsMenuDropdown({
    required this.items,
    required this.onChanged,
    super.key,
    this.value,
    this.hint,
    this.borderRadius = 8.0,
  });

  /// The list of menu items to display
  final List<AsMenuDropdownItem<T>> items;

  /// Callback executed when an item is selected
  final ValueChanged<T?>? onChanged;

  /// The currently selected value
  final T? value;

  /// Placeholder text when no item is selected
  final String? hint;

  /// Border radius for the dropdown
  final double borderRadius;

  @override
  State<AsMenuDropdown<T>> createState() => _AsMenuDropdownState<T>();
}

class _AsMenuDropdownState<T> extends State<AsMenuDropdown<T>> {
  final GlobalKey _key = GlobalKey();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  void _toggleDropdown() {
    if (_isOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    final renderBox = _key.currentContext!.findRenderObject()! as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height + 4,
        width: size.width,
        child: _DropdownMenu(
          items: widget.items,
          onItemSelected: (value) {
            widget.onChanged?.call(value);
            _closeDropdown();
          },
          borderRadius: widget.borderRadius,
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    setState(() => _isOpen = true);
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() => _isOpen = false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selectedItem =
        widget.items.where((item) => item.value == widget.value).firstOrNull;

    return GestureDetector(
      key: _key,
      onTap: _toggleDropdown,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: selectedItem?.child ??
                  Text(
                    widget.hint ?? 'Select an option',
                    style: TextStyle(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
            ),
            Icon(
              _isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ],
        ),
      ),
    );
  }
}

/// A menu item for the AsMenuDropdown.
class AsMenuDropdownItem<T> {
  /// Creates a dropdown menu item.
  ///
  /// [child] The widget to display for this item
  /// [value] The value associated with this item
  const AsMenuDropdownItem({
    required this.child,
    required this.value,
  });

  /// The widget to display for this item
  final Widget child;

  /// The value associated with this item
  final T value;
}

class _DropdownMenu<T> extends StatelessWidget {
  const _DropdownMenu({
    required this.items,
    required this.onItemSelected,
    required this.borderRadius,
  });

  final List<AsMenuDropdownItem<T>> items;
  final ValueChanged<T> onItemSelected;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: Container(
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < items.length; i++) ...[
                _DropdownMenuItem(
                  item: items[i],
                  onTap: () => onItemSelected(items[i].value),
                ),
                if (i < items.length - 1) const AsDivider(thickness: 0.5),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _DropdownMenuItem<T> extends StatefulWidget {
  const _DropdownMenuItem({
    required this.item,
    required this.onTap,
  });

  final AsMenuDropdownItem<T> item;
  final VoidCallback onTap;

  @override
  State<_DropdownMenuItem<T>> createState() => _DropdownMenuItemState<T>();
}

class _DropdownMenuItemState<T> extends State<_DropdownMenuItem<T>> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Enhanced interactive effects that work well in both light and dark modes
    Color getInteractiveColor() {
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
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          color: getInteractiveColor(),
          child: widget.item.child,
        ),
      ),
    );
  }
}
