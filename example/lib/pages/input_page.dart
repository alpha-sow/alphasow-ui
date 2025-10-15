import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController _textInputControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Input',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        const AsTextField(hintText: 'Email'),
        const SizedBox(height: 10),
        const AsTextField(hintText: 'Email', disabled: true),
        const SizedBox(height: 10),
        const AsTextField(
          label: 'Username',
          hintText: 'alphasow_ui',
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Flexible(
              child: AsTextField(
                controller: _textInputControl,
                hintText: 'Email',
                onSubmitted: (_) =>
                    context.showBanner(message: _textInputControl.text),
              ),
            ),
            const SizedBox(width: 4),
            AsButton(
              child: const Text('Subscribe'),
              onPressed: () {
                context.showBanner(message: _textInputControl.text);
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AsTextField(
                label: 'Username',
                hintText: 'alphasow_ui',
                description: 'This is your public display name.',
              ),
              AsButton(
                child: const Text('Submit'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
