import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:example/utils/utils.dart';
import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

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
                'Avatar',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            AsAvatar(
              backgroundImage: NetworkImage(faker.image.loremPicsum()),
              onTap: () {},
            ),
            AsAvatar.text(
              initials: 'AB',
              radius: 30,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 20,
              onTap: () {},
            ),
            AsAvatar.icon(
              icon: Icons.person,
              radius: 40,
              backgroundColor: Colors.green,
              iconColor: Colors.white,
              iconSize: 34,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
