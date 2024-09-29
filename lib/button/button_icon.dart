import 'package:alpha_ui/button/index.dart';
import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  const ButtonIcon({
    super.key,
    this.onPressed,
    this.icon,
    required this.text,
    this.isLoading = false,
  });
  final void Function()? onPressed;
  final IconData? icon;
  final String text;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: () {},
      isLoading: isLoading,
      child: IntrinsicWidth(
        child: Row(
          children: [
            isLoading ? const SizedBox.shrink() : Icon(icon, size: 18.0),
            isLoading ? const SizedBox.shrink() : const SizedBox(width: 10.0),
            Text(text),
          ],
        ),
      ),
    );
  }
}
