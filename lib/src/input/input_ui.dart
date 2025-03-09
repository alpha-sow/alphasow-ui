import 'package:alpha_ui/alpha_ui.dart';
import 'package:flutter/material.dart';

enum Type { email, password }

extension TypeExtension on Type {
  TextInputType get keyboardType {
    switch (this) {
      case Type.email:
        return TextInputType.emailAddress;
      case Type.password:
        return TextInputType.emailAddress;
    }
  }
}

class Input extends StatelessWidget {
  const Input({
    super.key,
    this.type,
    this.controller,
    this.label,
    this.hintText,
    this.description,
    this.disabled,
  });

  final Type? type;
  final String? label;
  final String? hintText;
  final String? description;
  final TextEditingController? controller;
  final bool? disabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  label!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            : const SizedBox.shrink(),
        SizedBox(
          height: 42.0,
          child: TextFormField(
            controller: controller,
            keyboardType: type?.keyboardType ?? TextInputType.text,
            obscureText: type == Type.password,
            cursorHeight: 14.0,
            enabled: disabled != null ? !disabled! : null,
            style: const TextStyle(fontSize: 14.0),
            decoration: inputStyle(hintText: hintText),
          ),
        ),
        description != null
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(description!),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
