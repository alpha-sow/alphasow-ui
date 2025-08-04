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
            const SizedBox(height: 20),
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
                type: AlertType.info,
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
                type: AlertType.info,
              ),
            ),
            const SizedBox(height: 10),
            AsLinkButton.ghost(
              text: 'Ghost Link',
              onPressed: () => context.showBanner(
                message: 'Ghost link clicked!',
                type: AlertType.info,
              ),
            ),
            const SizedBox(height: 10),
            const AsLinkButton(
              text: 'Loading Link',
              onPressed: null,
              isLoading: true,
            ),
          ],
        ),
      ],
    );
  }
}
