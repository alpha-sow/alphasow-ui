import 'package:alpha_ui/alpha_ui.dart';
import 'package:flutter/material.dart';

class Label extends StatefulWidget {
  const Label({
    super.key,
    required this.title,
    this.description,
    this.value,
    required this.onChanged,
  });
  final String title;
  final String? description;
  final bool? value;
  final void Function(bool?)? onChanged;

  @override
  State<Label> createState() => _LabelState();
}

class _LabelState extends State<Label> {
  late bool checkboxValue;

  @override
  void initState() {
    checkboxValue = widget.value ?? false;
    super.initState();
  }

  void onChanged(bool? value) {
    if (value != null) {
      setState(() {
        checkboxValue = value;
      });
      widget.onChanged!(checkboxValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckboxUI(
          value: checkboxValue,
          onChanged: onChanged,
        ),
        const SizedBox(width: 4.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              onTap: () => onChanged(!checkboxValue),
            ),
            widget.description != null
                ? Text(
                    widget.description!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w100,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}
