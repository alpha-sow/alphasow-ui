import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/widgets.dart';

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
  final Widget icon;
  final Widget? label;
  final bool isLoading;
  final Variant? variant;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed,
      isLoading: isLoading,
      variant: variant,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isLoading) ...[
            icon,
            if (label != null) const SizedBox(width: 8.0),
          ],
          if (label != null) label!,
        ],
      ),
    );
  }
}
