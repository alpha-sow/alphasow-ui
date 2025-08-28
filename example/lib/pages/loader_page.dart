import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoaderPage extends StatelessWidget {
  const LoaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Loader',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        const Center(child: AsLoadingCircular()),
        const SizedBox(height: 20),
        const AsLoadingSpinner(
          size: 25,
        ),
      ],
    );
  }
}
