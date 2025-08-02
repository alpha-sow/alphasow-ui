import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

class DialogPage extends StatelessWidget {
  const DialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Column(
          spacing: 10,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Dialog',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            AsButton.outlined(
              onPressed: () => context.showASAlertDialog<void>(
                title: const Text(
                  'Are you absolutely sure?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: const Text(
                    'This action cannot be undone. This will permanently delete'
                    ' your account and remove your data from our servers.'),
                actions: <AsDialogAction>[
                  AsDialogAction(
                    onPressed: () => Navigator.pop(context),
                    isDestructiveAction: true,
                    child: const Text('Cancel'),
                  ),
                  AsDialogAction(
                    child: const Text('Continue'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              child: const Text('Show Dialog'),
            ),
            AsButton.outlined(
              onPressed: () => context.showBanner(
                message: 'Button clicked successfully!',
                type: AlertType.success,
              ),
              child: const Text('Show Banner'),
            ),
            AsButton.outlined(
              onPressed: () => context.showAsActionBottomSheet<void>(
                title: const Text('Bottom Sheet Title'),
                message: const Text('This is the content of the bottom sheet.'),
                actions: <AsDialogAction>[
                  AsDialogAction(
                    isDestructiveAction: true,
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Close'),
                  ),
                ],
                cancelAction: AsDialogAction(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
              ),
              child: const Text('Show Bottom Sheet'),
            ),
          ],
        ),
      ],
    );
  }
}
