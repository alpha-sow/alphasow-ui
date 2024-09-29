import 'package:alpha_ui/checkbox_ui/checkbox_ui.dart';
import 'package:flutter/material.dart';

class Label extends StatefulWidget {
  const Label({
    super.key,
    required this.title,
    this.value,
    required this.onChanged,
  });
  final String title;
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
      children: [
        CheckboxUI(
          value: checkboxValue,
          onChanged: onChanged,
        ),
        GestureDetector(
          child: Text(widget.title),
          onTap: () => onChanged(!checkboxValue),
        ),
      ],
    );
  }
}
