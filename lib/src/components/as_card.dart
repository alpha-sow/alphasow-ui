import 'package:alphasow_ui/utils/platform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A platform-adaptive card widget that automatically uses Material [Card]
/// on Material platforms and a custom container with iOS styling on Cupertino platforms.
///
/// This widget provides a unified API that works across platforms while
/// maintaining native look and feel. Material cards have elevation and shadows,
/// while Cupertino cards have rounded corners with subtle borders.
///
/// Example usage:
/// ```dart
/// AsCard(
///   header: AsCardHeader(
///     title: 'John Doe',
///     subtitle: 'Software Developer',
///   ),
///   content: Text('Card content goes here'),
///   footer: AsCardFooter(
///     actions: [
///       TextButton(onPressed: () {}, child: Text('Cancel')),
///       ElevatedButton(onPressed: () {}, child: Text('Save')),
///     ],
///   ),
/// )
/// ```
class AsCard extends StatelessWidget {
  /// Creates a platform-adaptive card.
  const AsCard({
    super.key,
    this.child,
    this.header,
    this.content,
    this.footer,
    this.title,
    this.description,
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
    this.elevation,
    this.shape,
    this.clipBehavior,
    this.margin,
    this.semanticContainer = true,
    this.borderOnForeground = true,
    this.padding,
  });

  /// The widget below this widget in the tree.
  /// If provided, takes precedence over [header], [content], and [footer].
  final Widget? child;

  /// The header widget for the card.
  final AsCardHeader? header;

  /// The main content widget for the card.
  final AsCardContent? content;

  /// The footer widget for the card.
  final AsCardFooter? footer;

  /// Quick title text for the card. Creates a simple header if [header] is null.
  final String? title;

  /// Quick description text for the card. Displayed below title in header.
  final String? description;

  /// The card's background color.
  final Color? color;

  /// The color to paint the shadow below the card (Material only).
  final Color? shadowColor;

  /// The color used as an overlay on [color] to indicate elevation (Material only).
  final Color? surfaceTintColor;

  /// The z-coordinate at which to place this card (Material only).
  final double? elevation;

  /// The shape of the card's outline.
  final ShapeBorder? shape;

  /// The content will be clipped (or not) according to this option.
  final Clip? clipBehavior;

  /// The empty space that surrounds the card.
  final EdgeInsetsGeometry? margin;

  /// Whether this widget represents a single semantic container.
  final bool semanticContainer;

  /// Whether to paint the [shape] border in front of the [child] (Material only).
  final bool borderOnForeground;

  /// The amount of space by which to inset the card content.
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final effectivePlatformType = PlatformType.of(context);

    var cardChild = child;

    // Build card structure if child is not provided
    if (cardChild == null) {
      final parts = <Widget>[];

      // Add header or title/description
      if (header != null) {
        parts.add(header!);
      } else if (title != null || description != null) {
        parts.add(AsCardHeader(
          title: title,
          subtitle: description,
        ));
      }

      // Add content
      if (content != null) {
        parts.add(content!);
      }

      // Add footer
      if (footer != null) {
        parts.add(footer!);
      }

      if (parts.isNotEmpty) {
        cardChild = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: parts,
        );
      }
    }

    switch (effectivePlatformType) {
      case PlatformType.cupertino:
        return _buildCupertinoCard(context, cardChild);
      case PlatformType.material:
        return _buildMaterialCard(context, cardChild);
    }
  }

  Widget _buildMaterialCard(BuildContext context, Widget? cardChild) {
    return Card(
      color: color,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      elevation: elevation ?? 0,
      shape: shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
      clipBehavior: clipBehavior,
      margin: margin,
      semanticContainer: semanticContainer,
      borderOnForeground: borderOnForeground,
      child: padding != null && cardChild != null
          ? Padding(
              padding: padding!,
              child: cardChild,
            )
          : cardChild,
    );
  }

  Widget _buildCupertinoCard(BuildContext context, Widget? cardChild) {
    final effectiveColor = color ?? Colors.transparent;

    final effectiveShape = shape ??
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        );

    final borderRadius = effectiveShape is RoundedRectangleBorder
        ? effectiveShape.borderRadius
        : BorderRadius.circular(12);

    return Container(
      margin: margin ?? const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: effectiveColor,
        borderRadius: borderRadius,
        border: Border.all(
          color: CupertinoColors.separator.resolveFrom(context),
        ),
      ),
      child: padding != null && cardChild != null
          ? Padding(
              padding: padding!,
              child: cardChild,
            )
          : cardChild,
    );
  }
}

/// A header widget designed for use within [AsCard].
class AsCardHeader extends StatelessWidget {
  /// Creates a card header.
  const AsCardHeader({
    super.key,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.padding,
  });

  /// The primary title text.
  final String? title;

  /// The secondary subtitle text.
  final String? subtitle;

  /// A widget to display before the title.
  final Widget? leading;

  /// A widget to display after the title and subtitle.
  final Widget? trailing;

  /// The padding around the header content.
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final effectivePlatformType = PlatformType.of(context);
    final effectivePadding = padding ?? const EdgeInsets.all(16);

    return Padding(
      padding: effectivePadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (leading != null) ...[
            leading!,
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null)
                  Text(
                    title!,
                    style: _getTitleStyle(context, effectivePlatformType),
                  ),
                if (subtitle != null && title != null)
                  const SizedBox(height: 4),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: _getSubtitleStyle(context, effectivePlatformType),
                  ),
              ],
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: 12),
            trailing!,
          ],
        ],
      ),
    );
  }

  TextStyle _getTitleStyle(BuildContext context, PlatformType platformType) {
    switch (platformType) {
      case PlatformType.material:
        return Theme.of(context).textTheme.titleLarge ??
            const TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
      case PlatformType.cupertino:
        return CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            );
    }
  }

  TextStyle _getSubtitleStyle(BuildContext context, PlatformType platformType) {
    switch (platformType) {
      case PlatformType.material:
        return Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ) ??
            TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            );
      case PlatformType.cupertino:
        return CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontSize: 14,
              color: CupertinoColors.secondaryLabel.resolveFrom(context),
            );
    }
  }
}

/// A footer widget designed for use within [AsCard].
class AsCardFooter extends StatelessWidget {
  /// Creates a card footer.
  const AsCardFooter({
    super.key,
    this.actions,
    this.child,
    this.padding,
    this.alignment = MainAxisAlignment.end,
  });

  /// A list of action widgets, typically buttons.
  final List<Widget>? actions;

  /// A custom child widget. Takes precedence over [actions].
  final Widget? child;

  /// The padding around the footer content.
  final EdgeInsetsGeometry? padding;

  /// How the actions should be aligned horizontally.
  final MainAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    final effectivePadding = padding ?? const EdgeInsets.all(16);

    final content = child ??
        (actions != null
            ? Row(
                mainAxisAlignment: alignment,
                children: actions!
                    .expand((widget) => [
                          widget,
                          if (widget != actions!.last) const SizedBox(width: 8),
                        ])
                    .toList(),
              )
            : const SizedBox.shrink());

    return Padding(
      padding: effectivePadding,
      child: content,
    );
  }
}

/// A content widget designed for use within [AsCard].
class AsCardContent extends StatelessWidget {
  /// Creates card content.
  const AsCardContent({
    required this.child,
    super.key,
    this.padding,
  });

  /// The content widget.
  final Widget child;

  /// The padding around the content.
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final effectivePadding = padding ?? const EdgeInsets.all(16);

    return Padding(
      padding: effectivePadding,
      child: child,
    );
  }
}
