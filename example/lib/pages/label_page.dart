import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

class LabelPage extends StatelessWidget {
  const LabelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Label',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        ASLabel(
          title: 'Accept terms and conditions',
          onChanged: (value) {},
        ),
        const SizedBox(height: 10),
        ASLabel(
          title: 'Accept terms and conditions',
          onChanged: (value) {},
          description: 'You agree to our Terms of Service and Privacy Policy.',
        )
      ],
    );
  }
}
