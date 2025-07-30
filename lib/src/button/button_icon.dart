import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  const ButtonIcon({
    super.key,
    this.onPressed,
    required this.icon,
    this.label,
    this.isLoading = false,
    this.variant,
  });
  final void Function()? onPressed;
  final Icon icon;
  final Text? label;
  final bool isLoading;
  final Variant? variant;

  @override
  Widget build(BuildContext context) {
    return Button(
      variant: variant,
      onPressed: () {},
      isLoading: isLoading,
      child: IntrinsicWidth(
        child: Row(
          children: [
            isLoading ? const SizedBox.shrink() : icon,
            isLoading ? const SizedBox.shrink() : const SizedBox(width: 10.0),
            if (label != null) label!,
          ],
        ),
      ),
    );
  }
}
