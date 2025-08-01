import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

class ShowAlertDialogPage extends StatelessWidget {
  const ShowAlertDialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Alert Dialog',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        ASButton.outline(
          onPressed: () => context.showASAlertDialog<void>(
            title: const Text(
              'Are you absolutely sure?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: const Text(
                'This action cannot be undone. This will permanently delete '
                'your account and remove your data from our servers.'),
            actions: <Widget>[
              ASButton.outline(
                child: const Text('Cancel'),
                onPressed: () => Navigator.pop(context),
              ),
              ASButton(
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
