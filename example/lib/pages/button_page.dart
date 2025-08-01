import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Button UI',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        Column(
          children: [
            ASButton(
              onPressed: () => context.showBanner(
                message: 'Button clicked successfully!',
                type: AlertType.success,
              ),
              child: const Text('Button'),
            ),
            const SizedBox(height: 10),
            ASButton.secondary(
              onPressed: () => context.showBanner(
                message: 'Button clicked successfully!',
                type: AlertType.warning,
              ),
              child: const Text('Secondary'),
            ),
            const SizedBox(height: 10),
            ASButton.destructive(
              onPressed: () => context.showBanner(
                message: 'Button clicked successfully!',
                type: AlertType.error,
              ),
              child: const Text('Destructive'),
            ),
            const SizedBox(height: 10),
            ASButton.outline(
              onPressed: () {},
              child: const Text('Outline'),
            ),
            const SizedBox(height: 10),
            ASButton.ghost(
              onPressed: () {},
              child: const Text('Ghost'),
            ),
            const SizedBox(height: 10),
            ASButton.link(
              onPressed: () {},
              child: const Text('Link'),
            ),
            const SizedBox(height: 10),
            ASButton.outline(
              onPressed: () {},
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 10,
              ),
            ),
            const SizedBox(height: 10),
            ASButton.ghost(
              onPressed: () {},
              child: const Icon(Icons.mail_outline),
            ),
            const SizedBox(height: 10),
            ASButton(
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
