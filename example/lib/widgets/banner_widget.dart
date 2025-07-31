import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Text(
          'Banner',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const AlertBanner(
          message: 'Banner',
        ),
        const AlertBanner(
          type: AlertType.success,
          message: 'Success',
        ),
        const AlertBanner(
          type: AlertType.warning,
          message: 'Warning',
        ),
        const AlertBanner(
          type: AlertType.error,
          message: 'Error',
        ),
      ],
    );
  }
}
