import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LabelPage extends StatelessWidget {
  const LabelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Label',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        AsLabel(
          title: 'Accept terms and conditions',
          onChanged: (value) {},
        ),
        const SizedBox(height: 10),
        AsLabel(
          title: 'Accept terms and conditions',
          onChanged: (value) {},
          description: 'You agree to our Terms of Service and Privacy Policy.',
        ),
      ],
    );
  }
}
