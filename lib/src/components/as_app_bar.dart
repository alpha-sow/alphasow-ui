import 'package:alphasow_ui/utils/platform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A platform-adaptive app bar that automatically uses [CupertinoNavigationBar]
/// on iOS/macOS platforms and [AppBar] on other platforms.
///
/// This widget provides a unified API that works across platforms while
/// maintaining native look and feel. When on Cupertino platforms (iOS/macOS),
/// it renders a [CupertinoNavigationBar]. On Material platforms (Android, etc.),
/// it renders a standard [AppBar].
///
/// Example usage:
/// ```dart
/// ASAppBar(
///   title: Text('My App'),
///   leading: Icon(Icons.menu),
///   actions: [
///     IconButton(
///       icon: Icon(Icons.search),
///       onPressed: () {},
///     ),
///   ],
/// )
/// ```
class AsAppBar {
  /// Creates a platform-adaptive app bar.
  const AsAppBar({
    this.title,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.automaticallyImplyLeading = true,
    this.elevation,
    this.centerTitle,
    this.titleSpacing,
    this.toolbarHeight,
    this.leadingWidth,
    this.foregroundColor,
    this.shadowColor,
    this.surfaceTintColor,
    this.iconTheme,
    this.actionsIconTheme,
    this.primary = true,
    this.excludeHeaderSemantics = false,
    this.titleTextStyle,
    this.toolbarTextStyle,
    this.shape,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    this.scrolledUnderElevation,
    this.clipBehavior,
    this.forceMaterialTransparency = false,
    this.systemOverlayStyle,
    this.bottom,
    this.flexibleSpace,
    this.previousPageTitle,
    this.middle,
    this.trailing,
    this.border,
    this.automaticallyImplyMiddle = true,
    this.padding,
  });

  /// The primary widget displayed in the app bar.
  ///
  /// On Material platforms, this becomes [AppBar.title].
  /// On Cupertino platforms, this becomes [CupertinoNavigationBar.middle].
  final Widget? title;

  /// A widget to display before the [title].
  ///
  /// On Material platforms, this becomes [AppBar.leading].
  /// On Cupertino platforms, this becomes [CupertinoNavigationBar.leading].
  final Widget? leading;

  /// A list of Widgets to display in a row after the [title] widget.
  ///
  /// On Material platforms, this becomes [AppBar.actions].
  /// On Cupertino platforms, this becomes [CupertinoNavigationBar.trailing].
  final List<Widget>? actions;

  /// The fill color to use for an app bar's [Material].
  final Color? backgroundColor;

  /// Controls whether we should try to imply the leading widget if null.
  final bool automaticallyImplyLeading;

  /// The z-coordinate at which to place this app bar relative to its parent.
  ///
  /// Only used on Material platforms.
  final double? elevation;

  /// Whether the title should be centered.
  ///
  /// On Material platforms, defaults to false.
  /// On Cupertino platforms, the title is always centered.
  final bool? centerTitle;

  /// The spacing around [title] content on the horizontal axis.
  ///
  /// Only used on Material platforms.
  final double? titleSpacing;

  /// Defines the height of the toolbar component of an [AppBar].
  ///
  /// Only used on Material platforms.
  final double? toolbarHeight;

  /// Defines the width of [leading] widget.
  ///
  /// Only used on Material platforms.
  final double? leadingWidth;

  /// The default color for [Text] and [Icon]s within the app bar.
  ///
  /// Only used on Material platforms.
  final Color? foregroundColor;

  /// The color of the shadow below the app bar.
  ///
  /// Only used on Material platforms.
  final Color? shadowColor;

  /// The color of the surface tint overlay applied to the app bar's background color.
  ///
  /// Only used on Material platforms.
  final Color? surfaceTintColor;

  /// The color, opacity, and size to use for app bar icons.
  ///
  /// Only used on Material platforms.
  final IconThemeData? iconTheme;

  /// The color, opacity, and size to use for the icons that appear in the app bar's [actions].
  ///
  /// Only used on Material platforms.
  final IconThemeData? actionsIconTheme;

  /// Whether this app bar is being displayed at the top of the screen.
  ///
  /// Only used on Material platforms.
  final bool primary;

  /// Whether the title should be wrapped with header Semantics.
  ///
  /// Only used on Material platforms.
  final bool excludeHeaderSemantics;

  /// The default text style for the AppBar's [title] widget.
  ///
  /// Only used on Material platforms.
  final TextStyle? titleTextStyle;

  /// The default text style for the AppBar's [leading], and [actions] widgets.
  ///
  /// Only used on Material platforms.
  final TextStyle? toolbarTextStyle;

  /// The material's shape as well its shadow.
  ///
  /// Only used on Material platforms.
  final ShapeBorder? shape;

  /// A check that specifies which [ScrollNotification]s should be handled by this app bar.
  ///
  /// Only used on Material platforms.
  final ScrollNotificationPredicate notificationPredicate;

  /// The elevation that will be used if this app bar has something scrolled underneath it.
  ///
  /// Only used on Material platforms.
  final double? scrolledUnderElevation;

  /// The content will be clipped (or not) according to this option.
  ///
  /// Only used on Material platforms.
  final Clip? clipBehavior;

  /// If true, then the scaffold's floating app bar functionality is disabled.
  ///
  /// Only used on Material platforms.
  final bool forceMaterialTransparency;

  /// Specifies the style to use for the system overlays.
  ///
  /// Only used on Material platforms.
  final SystemUiOverlayStyle? systemOverlayStyle;

  /// This widget appears across the bottom of the app bar.
  ///
  /// Only used on Material platforms.
  final PreferredSizeWidget? bottom;

  /// This widget is stacked behind the toolbar and the tab bar.
  ///
  /// Only used on Material platforms.
  final Widget? flexibleSpace;

  /// Manually specify the previous route's title when the back button is present.
  ///
  /// Only used on Cupertino platforms.
  final String? previousPageTitle;

  /// The middle widget. This parameter takes precedence over [title].
  ///
  /// Only used on Cupertino platforms.
  final Widget? middle;

  /// The trailing widget. This parameter takes precedence over [actions].
  ///
  /// Only used on Cupertino platforms.
  final Widget? trailing;

  /// The border of the navigation bar.
  ///
  /// Only used on Cupertino platforms.
  final Border? border;

  /// Controls whether we should try to imply the middle widget if null.
  ///
  /// Only used on Cupertino platforms.
  final bool automaticallyImplyMiddle;

  /// Padding for the contents of the navigation bar.
  ///
  /// Only used on Cupertino platforms.
  final EdgeInsetsDirectional? padding;

  /// App bar that adapts to the current platform.
  PreferredSizeWidget get adaptive {
    switch (PlatformType.currentPlatform()) {
      case PlatformType.cupertino:
        return CupertinoNavigationBar(
          middle: middle ?? title,
          leading: leading,
          trailing: trailing ?? actions?.firstOrNull,
          backgroundColor: backgroundColor,
          automaticallyImplyLeading: automaticallyImplyLeading,
          previousPageTitle: previousPageTitle,
          border: border,
          automaticallyImplyMiddle: automaticallyImplyMiddle,
          padding: padding,
        );
      case PlatformType.material:
        return AppBar(
          title: title,
          leading: leading,
          actions: actions,
          backgroundColor: backgroundColor,
          automaticallyImplyLeading: automaticallyImplyLeading,
          elevation: elevation,
          centerTitle: centerTitle,
          titleSpacing: titleSpacing,
          toolbarHeight: toolbarHeight,
          leadingWidth: leadingWidth,
          foregroundColor: foregroundColor,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          iconTheme: iconTheme,
          actionsIconTheme: actionsIconTheme,
          primary: primary,
          excludeHeaderSemantics: excludeHeaderSemantics,
          titleTextStyle: titleTextStyle,
          toolbarTextStyle: toolbarTextStyle,
          shape: shape,
          notificationPredicate: notificationPredicate,
          scrolledUnderElevation: scrolledUnderElevation,
          clipBehavior: clipBehavior,
          forceMaterialTransparency: forceMaterialTransparency,
          systemOverlayStyle: systemOverlayStyle,
          bottom: bottom,
          flexibleSpace: flexibleSpace,
        );
    }
  }
}
