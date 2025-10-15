import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ListTilePage extends StatelessWidget {
  const ListTilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'List Tile',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        Column(
          children: AsListTile.divideTiles(
            tiles: [
              AsListTile(
                title: const Text('Basic List Tile'),
                onTap: () => context.showBanner(
                  message: 'Basic list tile tapped!',
                ),
              ),
              AsListTile(
                title: const Text('With Leading Icon'),
                leading: const Icon(Icons.person),
                onTap: () => context.showBanner(
                  message: 'List tile with leading icon tapped!',
                  type: AlertType.success,
                ),
              ),
              AsListTile(
                title: const Text('With Subtitle'),
                subtitle: const Text(
                  'This is a subtitle with additional information',
                ),
                leading: const Icon(Icons.mail),
                onTap: () => context.showBanner(
                  message: 'List tile with subtitle tapped!',
                  type: AlertType.warning,
                ),
              ),
              AsListTile(
                title: const Text('With Trailing'),
                subtitle: const Text('Swipe right for more actions'),
                leading: const Icon(Icons.settings),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () => context.showBanner(
                  message: 'List tile with trailing tapped!',
                  type: AlertType.error,
                ),
              ),
              AsListTile(
                title: const Text('Dense Layout'),
                subtitle: const Text('Compact spacing'),
                leading: const Icon(Icons.compress),
                trailing: const Icon(Icons.more_vert),
                dense: true,
                onTap: () => context.showBanner(
                  message: 'Dense list tile tapped!',
                ),
              ),
              const AsListTile(
                title: Text('Disabled Tile'),
                subtitle: Text('This tile is disabled'),
                leading: Icon(Icons.block),
                trailing: Icon(Icons.info_outline),
                enabled: false,
              ),
              const AsListTile(
                title: Text('Non-interactive'),
                subtitle: Text('No tap action defined'),
                leading: Icon(Icons.info),
                trailing: Icon(Icons.help_outline),
              ),
            ],
          ).toList(),
        ),
      ],
    );
  }
}
