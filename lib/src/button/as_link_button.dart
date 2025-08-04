import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

class _ButtonColors {
  const _ButtonColors({
    required this.textColor,
    required this.backgroundColor,
    this.outline = false,
  });

  final Color textColor;

  final Color backgroundColor;

  final bool outline;
}

extension _VariantExtension on Variant {
  _ButtonColors getColors(BuildContext context) {
    final theme = Theme.of(context);

    switch (this) {
      case Variant.primary:
        return _ButtonColors(
          textColor: theme.colorScheme.primary,
          backgroundColor: Colors.transparent,
        );
      case Variant.secondary:
        return _ButtonColors(
          textColor: theme.colorScheme.secondary,
          backgroundColor: Colors.transparent,
        );
      case Variant.destructive:
        return _ButtonColors(
          textColor: theme.colorScheme.error,
          backgroundColor: Colors.transparent,
        );
      case Variant.outline:
        return _ButtonColors(
          textColor: theme.colorScheme.onSurface,
          backgroundColor: Colors.transparent,
          outline: true,
        );
      case Variant.ghost:
        return _ButtonColors(
          textColor: theme.colorScheme.onSurface,
          backgroundColor: Colors.transparent,
        );
    }
  }
}

/// A link button widget that supports various variants and interactive states.
///
/// This widget provides hover and press visual feedback with adaptive colors
/// based on the current theme brightness (dark/light mode).
class AsLinkButton extends StatefulWidget {
  /// Creates a primary link button.
  const AsLinkButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.isLoading = false,
  }) : _variant = null;

  /// Creates a secondary variant link button.
  const AsLinkButton.secondary({
    required this.text,
    required this.onPressed,
    super.key,
    this.isLoading = false,
  }) : _variant = Variant.secondary;

  /// Creates a destructive variant link button.
  const AsLinkButton.destructive({
    required this.text,
    required this.onPressed,
    super.key,
    this.isLoading = false,
  }) : _variant = Variant.destructive;

  /// Creates an outlined variant link button.
  const AsLinkButton.outlined({
    required this.text,
    required this.onPressed,
    super.key,
    this.isLoading = false,
  }) : _variant = Variant.outline;

  /// Creates a ghost variant link button.
  const AsLinkButton.ghost({
    required this.text,
    required this.onPressed,
    super.key,
    this.isLoading = false,
  }) : _variant = Variant.ghost;

  /// The text to display in the button.
  final String text;

  /// Callback function called when the button is pressed.
  final void Function()? onPressed;

  /// Whether the button should show a loading state.
  final bool isLoading;

  final Variant? _variant;

  @override
  State<AsLinkButton> createState() => _AsLinkButtonState();
}

class _AsLinkButtonState extends State<AsLinkButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDisabled = widget.isLoading || widget.onPressed == null;

    final colors = widget._variant?.getColors(context) ??
        _ButtonColors(
          textColor: theme.colorScheme.primary,
          backgroundColor: Colors.transparent,
        );

    final textColor =
        isDisabled ? colors.textColor.withValues(alpha: 0.5) : colors.textColor;

    return GestureDetector(
      onTap: isDisabled ? null : widget.onPressed,
      child: MouseRegion(
        cursor: isDisabled
            ? SystemMouseCursors.forbidden
            : SystemMouseCursors.click,
        onEnter: isDisabled ? null : (_) => setState(() => _isHovered = true),
        onExit: isDisabled ? null : (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          decoration: ((_isHovered && !isDisabled && widget._variant != Variant.ghost) || 
                      widget._variant == Variant.outline)
              ? BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: textColor,
                    ),
                  ),
                )
              : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: widget.isLoading
                ? SizedBox(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(textColor),
                    ),
                  )
                : Text(
                    widget.text,
                    style: TextStyle(
                      color: textColor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
