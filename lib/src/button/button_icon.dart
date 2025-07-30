import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  const ButtonIcon({
    super.key,
    this.onPressed,
    required this.icon,
    required this.label,
    this.isLoading = false,
  });
  final void Function()? onPressed;
  final Icon icon;
  final Text label;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: () {},
      isLoading: isLoading,
      child: IntrinsicWidth(
        child: Row(
          children: [
            isLoading ? const SizedBox.shrink() : icon,
            isLoading ? const SizedBox.shrink() : const SizedBox(width: 10.0),
            label,
          ],
        ),
      ),
    );
  }
}
