import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({super.key});

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final TextEditingController _textInputControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Input UI',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        const Input(hintText: 'Email'),
        const SizedBox(height: 10),
        const Input(hintText: 'Email', disabled: true),
        const SizedBox(height: 10),
        const Input(
          label: 'Username',
          hintText: 'alphasow_ui',
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Flexible(
              child: Input(
                controller: _textInputControl,
                hintText: 'Email',
                onSubmitted: (_) =>
                    context.showBanner(message: _textInputControl.text),
              ),
            ),
            const SizedBox(width: 4),
            Button(
              child: const Text('Subscribe'),
              onPressed: () {
                context.showBanner(message: _textInputControl.text);
              },
            )
          ],
        ),
        const SizedBox(height: 10),
        Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Input(
                label: 'Username',
                hintText: 'alphasow_ui',
                description: 'This is your public display name.',
              ),
              Button(
                child: const Text('Submit'),
                onPressed: () {},
              )
            ],
          ),
        ),
      ],
    );
  }
}
