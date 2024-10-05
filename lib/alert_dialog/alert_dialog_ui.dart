import 'package:alpha_ui/theme/theme.dart';
import 'package:flutter/material.dart';

alertDialogUI({
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(theme.radius),
          ),
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
