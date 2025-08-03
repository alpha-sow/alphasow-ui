import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String? value;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Menu',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            AsMenuDown(
              triggerMode: MenuTriggerMode.longPress,
              items: [
                AsMenuDownItem.withIcon(icon: Icons.person, text: 'Profile'),
                AsMenuDownItem.withIcon(icon: Icons.settings, text: 'Settings'),
                const AsMenuDownItem.divider(),
                AsMenuDownItem.withIcon(icon: Icons.logout, text: 'Logout'),
              ],
              position: MenuPosition.right,
              child: ASListTile(
                title: const Text('Long Press Me'),
                leading: const Icon(Icons.menu),
                onTap: () {},
              ),
            ),
            AsMenuDown.buttonText(
              items: [
                AsMenuDownItem.withIcon(
                  icon: Icons.edit,
                  text: 'Edit',
                  onTap: () {},
                ),
                AsMenuDownItem.withIcon(
                  icon: Icons.share,
                  text: 'Share',
                  onTap: () {},
                ),
                const AsMenuDownItem.divider(),
                AsMenuDownItem.withIcon(
                  icon: Icons.delete,
                  text: 'Delete',
                  onTap: () {},
                ),
              ],
              variant: Variant.secondary,
              text: 'Actions',
            ),
            AsMenuDropdown<String>(
              hint: 'Select an option',
              value: value,
              items: const [
                AsMenuDropdownItem(child: Text('Option 1'), value: 'option1'),
                AsMenuDropdownItem(child: Text('Option 2'), value: 'option2'),
                AsMenuDropdownItem(child: Text('Option 3'), value: 'option3'),
              ],
              onChanged: (value) {
                setState(() {
                  this.value = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
