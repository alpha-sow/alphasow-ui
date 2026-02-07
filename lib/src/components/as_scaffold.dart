import 'package:alphasow_ui/src/src.dart';
import 'package:alphasow_ui/utils/platform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// A platform-adaptive scaffold that automatically uses [CupertinoPageScaffold]
/// on iOS/macOS platforms and [Scaffold] on other platforms.
///
/// This widget provides a unified API that works across platforms while
/// maintaining native look and feel. When on Cupertino platforms (iOS/macOS),
/// it renders a [CupertinoPageScaffold] with [CupertinoNavigationBar].
/// On Material platforms (Android, etc.), it renders a standard [Scaffold].
///
/// Example usage:
/// ```dart
/// ASScaffold(
///   appBar: AppBar(title: Text('My App')),
///   body: Center(child: Text('Hello World')),
///   floatingActionButton: FloatingActionButton(
///     onPressed: () {},
///     child: Icon(Icons.add),
///   ),
/// )
/// ```
class AsScaffold extends StatelessWidget {
  /// Creates a platform-adaptive scaffold.
  const AsScaffold({
    super.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.restorationId,
    this.navigationBar,
  });

  /// The app bar to display at the top of the scaffold.
  ///
  /// On Cupertino platforms, this is converted to a [CupertinoNavigationBar]
  /// with the title extracted from [AppBar.title] if applicable.
  final AsAppBar? appBar;

  /// The primary content of the scaffold.
  final Widget? body;

  /// A floating action button to display.
  ///
  /// Only supported on Material platforms. Ignored on Cupertino platforms.
  final Widget? floatingActionButton;

  /// Determines where to place the [floatingActionButton].
  ///
  /// Only supported on Material platforms. Ignored on Cupertino platforms.
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Animator to move the [floatingActionButton] to a new location.
  ///
  /// Only supported on Material platforms. Ignored on Cupertino platforms.
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  /// A set of buttons that are displayed at the bottom of the scaffold.
  ///
  /// Only supported on Material platforms. Ignored on Cupertino platforms.
  final List<Widget>? persistentFooterButtons;

  /// The alignment of the [persistentFooterButtons].
  ///
  /// Only supported on Material platforms. Ignored on Cupertino platforms.
  final AlignmentDirectional persistentFooterAlignment;

  /// A panel displayed to the side of the body.
  ///
  /// Only supported on Material platforms. Ignored on Cupertino platforms.
  final Widget? drawer;

  /// Called when the [Scaffold.drawer] is opened or closed.
  ///
  /// Only supported on Material platforms. Ignored on Cupertino platforms.
  final DrawerCallback? onDrawerChanged;

  /// A panel displayed to the side of the body, on the end side.
  ///
  /// Only supported on Material platforms. Ignored on Cupertino platforms.
  final Widget? endDrawer;

  /// Called when the [Scaffold.endDrawer] is opened or closed.
  ///
  /// Only supported on Material platforms. Ignored on Cupertino platforms.
  final DrawerCallback? onEndDrawerChanged;

  /// A bottom navigation bar to display at the bottom of the scaffold.
  ///
  /// Supports both Material and Cupertino platforms. On Cupertino platforms,
  /// the navigation bar is positioned at the bottom of the content area.
  final AsBottomNavigationBar? bottomNavigationBar;

  /// A persistent bottom sheet to show below the scaffold's body.
  ///
  /// Only supported on Material platforms. Ignored on Cupertino platforms.
  final Widget? bottomSheet;

  /// The color to use for the scaffold's background.
  final Color? backgroundColor;

  /// Whether the body should size itself to avoid the on-screen keyboard.
  /// Whether this scaffold is being displayed at the top of the screen.
  ///
  /// Only supported on Material platforms. Ignored on Cupertino platforms.
  final bool primary;

  /// Determines the way that drag start behavior is handled.
  ///
  /// Only supported on Material platforms. Ignored on Cupertino platforms.
  final DragStartBehavior drawerDragStartBehavior;

  /// Whether the body should extend to the bottom of the Scaffold.
  ///
  /// Only supported on Material platforms. Ignored on Cupertino platforms.
  final bool extendBody;

  /// Whether the body should extend behind the app bar.
  ///
  /// Only supported on Material platforms. Ignored on Cupertino platforms.
  final bool extendBodyBehindAppBar;

  /// The color to use for the scrim that obscures primary content while a drawer is open.
  ///
  /// Only supported on Material platforms. Ignored on Cupertino platforms.
  final Color? drawerScrimColor;

  /// The width of the area within which a horizontal swipe will open the drawer.
  ///
  /// Only supported on Material platforms. Ignored on Cupertino platforms.
  final double? drawerEdgeDragWidth;

  /// Determines if the [Scaffold.drawer] can be opened with a drag gesture.
  ///
  /// Only supported on Material platforms. Ignored on Cupertino platforms.
  final bool drawerEnableOpenDragGesture;

  /// Determines if the [Scaffold.endDrawer] can be opened with a drag gesture.
  ///
  /// Only supported on Material platforms. Ignored on Cupertino platforms.
  final bool endDrawerEnableOpenDragGesture;

  /// Restoration ID to save and restore the state of the Scaffold.
  ///
  /// Only supported on Material platforms. Ignored on Cupertino platforms.
  final String? restorationId;

  /// An optional bottom navigation bar for Cupertino platforms.
  ///
  /// Only supported on Cupertino platforms. Ignored on Material platforms.
  final CupertinoTabBar? navigationBar;

  /// Whether to resize the body when the keyboard appears.
  final bool? resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    switch (PlatformType.of(context)) {
      case PlatformType.cupertino:
        if (bottomNavigationBar != null) {
          final cupertinoTabBar = bottomNavigationBar!
              .getPlatformWidget(context) as CupertinoTabBar;
          return CupertinoTabScaffold(
            tabBar: cupertinoTabBar,
            tabBuilder: (context, index) {
              return CupertinoPageScaffold(
                navigationBar:
                    appBar?.adaptiveOf(context) as ObstructingPreferredSizeWidget?,
                backgroundColor: backgroundColor,
                resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
                child: body ?? const SizedBox.shrink(),
              );
            },
          );
        }
        return CupertinoPageScaffold(
          navigationBar: appBar?.adaptiveOf(context) as ObstructingPreferredSizeWidget?,
          backgroundColor: backgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
          child: Column(
            children: [
              Expanded(child: body ?? const SizedBox.shrink()),
              if (bottomNavigationBar != null) bottomNavigationBar!,
            ],
          ),
        );
      case PlatformType.material:
        return Scaffold(
          appBar: appBar?.adaptiveOf(context),
          body: body,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          floatingActionButtonAnimator: floatingActionButtonAnimator,
          persistentFooterButtons: persistentFooterButtons,
          persistentFooterAlignment: persistentFooterAlignment,
          drawer: drawer,
          onDrawerChanged: onDrawerChanged,
          endDrawer: endDrawer,
          onEndDrawerChanged: onEndDrawerChanged,
          bottomNavigationBar: bottomNavigationBar,
          bottomSheet: bottomSheet,
          backgroundColor: backgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          primary: primary,
          drawerDragStartBehavior: drawerDragStartBehavior,
          extendBody: extendBody,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          drawerScrimColor: drawerScrimColor,
          drawerEdgeDragWidth: drawerEdgeDragWidth,
          drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
          endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
          restorationId: restorationId,
        );
    }
  }
}
