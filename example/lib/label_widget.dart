import 'package:alpha_ui/alpha_ui.dart';
import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Label',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        Label(
          title: 'Accept terms and conditions',
          onChanged: (value) {},
        ),
        const SizedBox(height: 10.0),
        Label(
          title: 'Accept terms and conditions',
          onChanged: (value) {},
          description: 'You agree to our Terms of Service and Privacy Policy.',
        )
      ],
    );
  }
}
