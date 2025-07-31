import 'package:flutter/material.dart';

Future<T?> alertDialogUI<T>({
  required BuildContext context,
  Widget? title,
  Widget? content,
  List<Widget>? actions,
}) {
  return showDialog(
    context: context,
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
