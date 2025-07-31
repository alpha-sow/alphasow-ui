import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Button UI',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        Column(
          children: [
            Button(
              onPressed: () => context.showBanner(
                message: 'Button clicked successfully!',
                type: AlertType.success,
              ),
              child: const Text('Button'),
            ),
            const SizedBox(height: 10.0),
            Button.secondary(
              onPressed: () => context.showBanner(
                message: 'Button clicked successfully!',
                type: AlertType.warning,
              ),
              child: const Text('Secondary'),
            ),
            const SizedBox(height: 10.0),
            Button.destructive(
              onPressed: () => context.showBanner(
                message: 'Button clicked successfully!',
                type: AlertType.error,
              ),
              child: const Text('Destructive'),
            ),
            const SizedBox(height: 10.0),
            Button.outline(
              onPressed: () {},
              child: const Text('Outline'),
            ),
            const SizedBox(height: 10.0),
            Button.ghost(
              onPressed: () {},
              child: const Text('Ghost'),
            ),
            const SizedBox(height: 10.0),
            Button.link(
              onPressed: () {},
              child: const Text('Link'),
            ),
            const SizedBox(height: 10.0),
            Button.outline(
              onPressed: () {},
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 10.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Button.ghost(
              onPressed: () {},
              child: const Icon(Icons.mail_outline),
            ),
            const SizedBox(height: 10.0),
            Button(
              onPressed: () {},
              isLoading: true,
              child: const Text('Please wait'),
            ),
          ],
        ),
      ],
    );
  }
}
