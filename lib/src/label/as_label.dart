import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

/// A labeled checkbox widget combining text and checkbox functionality.
///
/// This widget creates a checkbox with an associated title and optional
/// description. The entire label area is tappable to toggle the checkbox.
class ASLabel extends StatefulWidget {
  /// Creates a labeled checkbox.
  ///
  /// [title] The main label text displayed next to the checkbox
  /// [onChanged] Callback executed when the checkbox state changes
  /// [description] Optional description text displayed below the title
  /// [value] The initial state of the checkbox
  const ASLabel({
    required this.title,
    required this.onChanged,
    super.key,
    this.description,
    this.value,
  });

  /// The main label text displayed next to the checkbox
  final String title;

  /// Optional description text displayed below the title
  final String? description;

  /// The current state of the checkbox
  final bool? value;

  /// Callback executed when the checkbox state changes
  final ValueChanged<bool?>? onChanged;

  @override
  State<ASLabel> createState() => _ASLabelState();
}

class _ASLabelState extends State<ASLabel> {
  late bool checkboxValue;

  @override
  void initState() {
    checkboxValue = widget.value ?? false;
    super.initState();
  }

  /// Handles checkbox state changes and notifies the parent widget.
  ///
  /// [value] The new checkbox state
  void onChanged({bool? value}) {
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
        ASCheckbox(
          value: checkboxValue,
          onChanged: (value) => onChanged(value: value),
        ),
        const SizedBox(width: 4),
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
              onTap: () => onChanged(value: !checkboxValue),
            ),
            if (widget.description != null)
              Text(
                widget.description!,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w100,
                ),
              )
            else
              const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}
