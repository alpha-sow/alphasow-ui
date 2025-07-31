import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Text(
          'Loader',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const LoadingCircular(),
        const LoadingSpinner(
          size: 25,
        ),
      ],
    );
  }
}
