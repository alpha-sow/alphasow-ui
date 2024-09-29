import 'package:alpha_ui/button/index.dart';
import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  const ButtonIcon({
    super.key,
    this.onPressed,
    this.icon,
    required this.text,
  });
  final void Function()? onPressed;
  final IconData? icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: () {},
      child: IntrinsicWidth(
        child: Row(
          children: [
            Icon(icon, size: 18.0),
            const SizedBox(width: 10.0),
            Text(text),
          ],
        ),
      ),
    );
  }
}
