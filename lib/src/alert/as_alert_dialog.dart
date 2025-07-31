import 'package:flutter/material.dart';

/// Extension on BuildContext to provide convenient alert dialog methods.
///
/// This extension allows any widget to easily show alert dialogs by calling
/// `context.showAlertDialog()` directly.
extension AlertDialogUi on BuildContext {
  /// Shows a customizable alert dialog with optional title, content, and actions.
  ///
  /// [title] Optional widget to display as the dialog title
  /// [content] Optional widget to display as the main dialog content
  /// [actions] Optional list of action widgets (typically buttons)
  ///
  /// Returns a Future that completes when the dialog is dismissed,
  /// optionally with a value of type [T].
  Future<T?> showASAlertDialog<T>({
    Widget? title,
    Widget? content,
    List<Widget>? actions,
  }) =>
      showDialog(
        context: this,
        builder: (BuildContext context) {
          return ColoredBox(
            color: Colors.black54,
            child: AlertDialog(
              elevation: 0,
              title: title,
              content: Container(
                constraints: const BoxConstraints(maxWidth: 500),
                child: content,
              ),
              actions: actions,
            ),
          );
        },
      );
}
