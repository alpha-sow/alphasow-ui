import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

class LoaderPage extends StatelessWidget {
  const LoaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Text(
          'Loader',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const ASLoadingCircular(),
        const ASLoadingSpinner(
          size: 25,
        ),
      ],
    );
  }
}
