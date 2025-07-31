import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

class ShowAlertDialog extends StatelessWidget {
  const ShowAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Alert Dialog',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        Button.outline(
          onPressed: () => context.showAlertDialog(
            title: const Text(
              'Are you absolutely sure?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: const Text(
                'This action cannot be undone. This will permanently delete your account and remove your data from our servers.'),
            actions: <Widget>[
              Button.outline(
                child: const Text('Cancel'),
                onPressed: () => Navigator.pop(context),
              ),
              Button(
                child: const Text('Continue'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          child: const Text('Show Dialog'),
        ),
      ],
    );
  }
}
