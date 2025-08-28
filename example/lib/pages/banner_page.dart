import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BannerPage extends StatelessWidget {
  const BannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Banner',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        const ASAlertBanner(
          message: 'Banner',
        ),
        const SizedBox(height: 10),
        const ASAlertBanner(
          type: AlertType.success,
          message: 'Success',
        ),
        const SizedBox(height: 10),
        const ASAlertBanner(
          type: AlertType.warning,
          message: 'Warning',
        ),
        const SizedBox(height: 10),
        const ASAlertBanner(
          type: AlertType.error,
          message: 'Error',
        ),
      ],
    );
  }
}
