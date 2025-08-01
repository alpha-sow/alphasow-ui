import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
        const ASTextField(hintText: 'Email'),
        const SizedBox(height: 10),
        const ASTextField(hintText: 'Email', disabled: true),
        const SizedBox(height: 10),
        const ASTextField(
          label: 'Username',
          hintText: 'alphasow_ui',
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Flexible(
              child: ASTextField(
                controller: _textInputControl,
                hintText: 'Email',
                onSubmitted: (_) =>
                    context.showBanner(message: _textInputControl.text),
              ),
            ),
            const SizedBox(width: 4),
            ASButton(
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
              const ASTextField(
                label: 'Username',
                hintText: 'alphasow_ui',
                description: 'This is your public display name.',
              ),
              ASButton(
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
