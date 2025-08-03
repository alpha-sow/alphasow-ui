import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
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
            AsButton(
              onPressed: () => context.showBanner(
                message: 'Button clicked successfully!',
                type: AlertType.success,
              ),
              child: const Text('Button'),
            ),
            const SizedBox(height: 10),
            AsButton.secondary(
              onPressed: () => context.showBanner(
                message: 'Button clicked successfully!',
                type: AlertType.warning,
              ),
              child: const Text('Secondary'),
            ),
            const SizedBox(height: 10),
            AsButton.destructive(
              onPressed: () => context.showBanner(
                message: 'Button clicked successfully!',
                type: AlertType.error,
              ),
              child: const Text('Destructive'),
            ),
            const SizedBox(height: 10),
            AsButton.outlined(
              onPressed: () {},
              child: const Text('Outline'),
            ),
            const SizedBox(height: 10),
            AsButton.ghost(
              onPressed: () {},
              child: const Text('Ghost'),
            ),
            const SizedBox(height: 10),
            AsIconButton(
              onPressed: () {},
              icon: Icons.favorite,
            ),
            const SizedBox(height: 10),
            AsIconButton.secondary(
              onPressed: () {},
              icon: Icons.settings,
            ),
            const SizedBox(height: 10),
            AsIconButton.destructive(
              onPressed: () {},
              icon: Icons.delete,
            ),
            const SizedBox(height: 10),
            AsIconButton.outlined(
              onPressed: () {},
              icon: Icons.person,
            ),
            const SizedBox(height: 10),
            AsIconButton.ghost(
              onPressed: () {},
              icon: Icons.mail_outline,
            ),
            const SizedBox(height: 10),
            AsButton(
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
