import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Extension on BuildContext to provide convenient alert dialog methods.
///
/// This extension allows any widget to easily show alert dialogs by calling
/// `context.showAlertDialog()` directly.
extension AsAlertDialog on BuildContext {
  /// Shows a customizable alert dialog with optional title, content, and actions.
  ///
  /// [title] Optional widget to display as the dialog title
  /// [content] Optional widget to display as the main dialog content
  /// [actions] Optional list of action widgets (typically buttons)
  ///
  /// Returns a Future that completes when the dialog is dismissed,
  /// optionally with a value of type [T].
  Future<T?> showAsAlertDialog<T>({
    Widget? title,
    Widget? content,
    List<AsDialogAction>? actions,
  }) =>
      showDialog(
        context: this,
        builder: (BuildContext context) {
          return ColoredBox(
            color: Colors.black54,
            child: switch (PlatformType.currentPlatform()) {
              PlatformType.cupertino => CupertinoAlertDialog(
                  title: title,
                  content: Container(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: content,
                  ),
                  actions: actions ?? [],
                ),
              PlatformType.material => AlertDialog(
                  elevation: 0,
                  title: title,
                  content: Container(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: content,
                  ),
                  actions: actions,
                ),
            },
          );
        },
      );
}

/// An adaptive dialog action button that automatically uses the appropriate
/// platform-specific action button.
///
/// Uses [CupertinoDialogAction] on iOS/macOS platforms and [AsButton] on other platforms.
class AsDialogAction extends StatelessWidget {
  /// Creates an adaptive dialog action button.
  ///
  /// [onPressed] Callback function when the button is pressed
  /// [child] The widget to display inside the button
  /// [isDefaultAction] Whether this is the default action (Cupertino only)
  /// [isDestructiveAction] Whether this is a destructive action (Cupertino only)
  const AsDialogAction({
    required this.onPressed,
    required this.child,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
    super.key,
  });

  /// Callback function when the button is pressed
  final VoidCallback? onPressed;

  /// The widget to display inside the button
  final Widget child;

  /// Whether this is the default action (Cupertino only)
  final bool isDefaultAction;

  /// Whether this is a destructive action (Cupertino only)
  final bool isDestructiveAction;

  @override
  Widget build(BuildContext context) {
    return switch (PlatformType.currentPlatform()) {
      PlatformType.cupertino => CupertinoDialogAction(
          onPressed: onPressed,
          isDefaultAction: isDefaultAction,
          isDestructiveAction: isDestructiveAction,
          child: child,
        ),
      PlatformType.material => isDestructiveAction
          ? AsButton.destructive(
              onPressed: onPressed,
              child: child,
            )
          : AsButton(
              onPressed: onPressed,
              child: child,
            ),
    };
  }
}
