import 'package:flutter/material.dart';

extension AlertDialogUi on BuildContext {
  Future<T?> showAlertDialog<T>({
    Widget? title,
    Widget? content,
    List<Widget>? actions,
  }) =>
      showDialog(
        context: this,
        builder: (BuildContext context) {
          return Container(
            color: Colors.black54,
            child: AlertDialog(
              elevation: 0.0,
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
