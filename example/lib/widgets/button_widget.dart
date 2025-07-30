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
              onPressed: () {},
              child: const Text('Button'),
            ),
            const SizedBox(height: 10.0),
            Button(
              onPressed: () {},
              variant: Variant.secondary,
              child: const Text('Secondary'),
            ),
            const SizedBox(height: 10.0),
            Button(
              onPressed: () {},
              variant: Variant.destructive,
              child: const Text('Destructive'),
            ),
            const SizedBox(height: 10.0),
            Button(
              onPressed: () {},
              variant: Variant.outline,
              child: const Text('Outline'),
            ),
            const SizedBox(height: 10.0),
            Button(
              onPressed: () {},
              variant: Variant.ghost,
              child: const Text('Ghost'),
            ),
            const SizedBox(height: 10.0),
            Button(
              onPressed: () {},
              variant: Variant.link,
              child: const Text('Link'),
            ),
            const SizedBox(height: 10.0),
            Button(
              onPressed: () {},
              variant: Variant.outline,
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 10.0,
              ),
            ),
            const SizedBox(height: 10.0),
            ButtonIcon(
              onPressed: () {},
              label: const Text('Login with Email'),
              icon: const Icon(Icons.mail_outline),
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
