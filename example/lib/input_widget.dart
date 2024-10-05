import 'package:alpha_ui/alpha_ui.dart';
import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Input UI',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        const Input(hintText: 'Email'),
        const SizedBox(height: 10.0),
        const Input(hintText: 'Email', disabled: true),
        const SizedBox(height: 10.0),
        const Input(
          label: 'Username',
          hintText: 'alpha_ui',
        ),
        const SizedBox(height: 10.0),
        Row(
          children: [
            const Flexible(
              child: Input(
                hintText: 'Email',
              ),
            ),
            const SizedBox(width: 4.0),
            Button(
              child: const Text('Subscribe'),
              onPressed: () {},
            )
          ],
        ),
        const SizedBox(height: 10.0),
        Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Input(
                label: 'Username',
                hintText: 'alpha_ui',
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
