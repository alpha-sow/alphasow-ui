import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
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
              icon: const Icon(Icons.favorite),
            ),
            const SizedBox(height: 10),
            AsIconButton.secondary(
              shape: AsButtonShape.rounded,
              onPressed: () {},
              icon: const Icon(Icons.settings),
            ),
            const SizedBox(height: 10),
            AsIconButton.destructive(
              onPressed: () {},
              icon: const Icon(Icons.delete),
            ),
            const SizedBox(height: 10),
            AsIconButton.outlined(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
            const SizedBox(height: 10),
            const AsIconButton.ghost(
              onPressed: null,
              icon: Icon(Icons.mail_outline),
            ),
            const SizedBox(height: 10),
            AsLinkButton(
              text: 'Link Button',
              onPressed: () => context.showBanner(
                message: 'Link button clicked!',
              ),
            ),
            const SizedBox(height: 10),
            AsLinkButton.secondary(
              text: 'Secondary Link',
              onPressed: () => context.showBanner(
                message: 'Secondary link clicked!',
              ),
            ),
            const SizedBox(height: 10),
            AsLinkButton.destructive(
              text: 'Destructive Link',
              onPressed: () => context.showBanner(
                message: 'Destructive link clicked!',
                type: AlertType.error,
              ),
            ),
            const SizedBox(height: 10),
            AsLinkButton.outlined(
              text: 'Outlined Link',
              onPressed: () => context.showBanner(
                message: 'Outlined link clicked!',
              ),
            ),
            const SizedBox(height: 10),
            AsLinkButton.ghost(
              text: 'Ghost Link',
              onPressed: () => context.showBanner(
                message: 'Ghost link clicked!',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
