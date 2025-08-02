import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Extension on BuildContext to provide convenient bottom sheet methods.
extension ShowAsBottomSheet on BuildContext {
  /// Shows an adaptive bottom sheet with optional title, message, and actions.
  ///
  /// Uses [CupertinoActionSheet] on iOS/macOS platforms and [showModalBottomSheet]
  /// with Material design on other platforms.
  ///
  /// [title] Optional widget to display as the sheet title
  /// [message] Optional widget to display as the sheet message/content
  /// [actions] Optional list of action widgets
  /// [cancelAction] Optional cancel action (Cupertino only)
  ///
  /// Returns a Future that completes when the sheet is dismissed,
  /// optionally with a value of type [T].
  Future<T?> showAsActionBottomSheet<T>({
    Widget? title,
    Widget? message,
    List<AsDialogAction>? actions,
    AsDialogAction? cancelAction,
  }) {
    return switch (PlatformType.currentPlatform()) {
      PlatformType.cupertino => showCupertinoModalPopup<T>(
          context: this,
          builder: (BuildContext context) => CupertinoActionSheet(
            title: title,
            message: message,
            actions: actions ?? [],
            cancelButton: cancelAction,
          ),
        ),
      PlatformType.material => showModalBottomSheet<T>(
          context: this,
          builder: (BuildContext context) => Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (title != null) ...[
                  DefaultTextStyle(
                    style: Theme.of(context).textTheme.titleLarge ??
                        const TextStyle(),
                    child: title,
                  ),
                  const SizedBox(height: 8),
                ],
                if (message != null) ...[
                  DefaultTextStyle(
                    style: Theme.of(context).textTheme.bodyMedium ??
                        const TextStyle(),
                    child: message,
                  ),
                  const SizedBox(height: 16),
                ],
                if (actions != null) ...[
                  ...actions.map((action) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: action,
                      )),
                ],
                if (cancelAction != null) ...[
                  const SizedBox(height: 8),
                  cancelAction,
                ],
              ],
            ),
          ),
        ),
    };
  }
}
