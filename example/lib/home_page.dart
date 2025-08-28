import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:example/main.dart';
import 'package:example/router.gr.dart';
import 'package:example/theme.dart';
import 'package:flutter/material.dart' hide DialogRoute;

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final routes = const <PageRouteInfo>[
    ButtonRoute(),
    AvatarRoute(),
    BannerRoute(),
    DialogRoute(),
    InputRoute(),
    LabelRoute(),
    ListTileRoute(),
    LoaderRoute(),
    MenuRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    return AsScaffold(
      appBar: AsAppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Alphasow UI Example'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: AsMenuDown.buttonIcon(
              variant: Variant.ghost,
              position: MenuPosition.bottomRight,
              items: [
                AsMenuDownItem.withIcon(
                  text: 'Light Theme',
                  icon: Icons.light_mode,
                  onTap: () {
                    final themeNotifier = ThemeNotifier.of(context);
                    themeNotifier?.changeTheme(ThemeMode.light);
                  },
                ),
                AsMenuDownItem.withIcon(
                  text: 'Dark Theme',
                  icon: Icons.dark_mode,
                  onTap: () {
                    final themeNotifier = ThemeNotifier.of(context);
                    themeNotifier?.changeTheme(ThemeMode.dark);
                  },
                ),
                AsMenuDownItem.withIcon(
                  text: 'System Theme',
                  icon: Icons.brightness_auto,
                  onTap: () {
                    final themeNotifier = ThemeNotifier.of(context);
                    themeNotifier?.changeTheme(ThemeMode.system);
                  },
                ),
                const AsMenuDownItem.divider(),
                AsMenuDownItem(
                  onTap: () {
                    final themeNotifier = ThemeNotifier.of(context);
                    themeNotifier?.changeColor(ThemeColor.red);
                  },
                  child: ColoredBox(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: ThemeNotifier.of(context)?.currentThemeColor ==
                              ThemeColor.red
                          ? const Icon(Icons.check, color: Colors.white)
                          : const SizedBox.shrink(),
                    ),
                  ),
                ),
                AsMenuDownItem(
                  onTap: () {
                    final themeNotifier = ThemeNotifier.of(context);
                    themeNotifier?.changeColor(ThemeColor.orange);
                  },
                  child: ColoredBox(
                    color: Colors.orange,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: ThemeNotifier.of(context)?.currentThemeColor ==
                              ThemeColor.orange
                          ? const Icon(Icons.check, color: Colors.white)
                          : const SizedBox.shrink(),
                    ),
                  ),
                ),
                AsMenuDownItem(
                  onTap: () {
                    final themeNotifier = ThemeNotifier.of(context);
                    themeNotifier?.changeColor(ThemeColor.green);
                  },
                  child: ColoredBox(
                    color: Colors.green,
                    child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: ThemeNotifier.of(context)?.currentThemeColor ==
                                ThemeColor.green
                            ? const Icon(Icons.check, color: Colors.white)
                            : const SizedBox.shrink()),
                  ),
                ),
                AsMenuDownItem(
                  onTap: () {
                    final themeNotifier = ThemeNotifier.of(context);
                    themeNotifier?.changeColor(ThemeColor.blue);
                  },
                  child: ColoredBox(
                    color: Colors.blue,
                    child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: ThemeNotifier.of(context)?.currentThemeColor ==
                                ThemeColor.blue
                            ? const Icon(Icons.check, color: Colors.white)
                            : const SizedBox.shrink()),
                  ),
                ),
              ],
              icon: Icons.color_lens,
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          Container(
            width: 200,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerLow,
              border: Border(
                right: BorderSide(
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
              ),
            ),
            child: Column(
              children: [
                SideBarItem(
                  title: 'Button',
                  icon: Icons.smart_button_outlined,
                  index: 0,
                  selectedIndex: _selectedIndex,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                    context.router.navigate(routes[0]);
                  },
                ),
                SideBarItem(
                  title: 'Avatar',
                  icon: Icons.account_circle_outlined,
                  index: 1,
                  selectedIndex: _selectedIndex,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                    context.router.navigate(routes[1]);
                  },
                ),
                SideBarItem(
                  title: 'Banner',
                  icon: Icons.campaign_outlined,
                  index: 2,
                  selectedIndex: _selectedIndex,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                    context.router.navigate(routes[2]);
                  },
                ),
                SideBarItem(
                  title: 'Dialog',
                  icon: Icons.chat_bubble_outline,
                  index: 3,
                  selectedIndex: _selectedIndex,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                    context.router.navigate(routes[3]);
                  },
                ),
                SideBarItem(
                  title: 'Input',
                  icon: Icons.input_outlined,
                  index: 4,
                  selectedIndex: _selectedIndex,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 4;
                    });
                    context.router.navigate(routes[4]);
                  },
                ),
                SideBarItem(
                  title: 'Label',
                  icon: Icons.label_outline,
                  index: 5,
                  selectedIndex: _selectedIndex,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 5;
                    });
                    context.router.navigate(routes[5]);
                  },
                ),
                SideBarItem(
                  title: 'ListTile',
                  icon: Icons.view_list_outlined,
                  index: 6,
                  selectedIndex: _selectedIndex,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 6;
                    });
                    context.router.navigate(routes[6]);
                  },
                ),
                SideBarItem(
                  title: 'Loader',
                  icon: Icons.hourglass_empty,
                  index: 7,
                  selectedIndex: _selectedIndex,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 7;
                    });
                    context.router.navigate(routes[7]);
                  },
                ),
                SideBarItem(
                  title: 'Menu',
                  icon: Icons.menu_outlined,
                  index: 8,
                  selectedIndex: _selectedIndex,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 8;
                    });
                    context.router.navigate(routes[8]);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: AutoTabsScaffold(
              routes: routes,
            ),
          ),
        ],
      ),
    );
  }
}

class SideBarItem extends StatelessWidget {
  const SideBarItem({
    required this.title,
    required this.icon,
    required this.index,
    required this.selectedIndex,
    this.onTap,
    super.key,
  });

  final String title;
  final IconData icon;
  final int index;
  final int selectedIndex;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = index == selectedIndex;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.secondaryContainer
                : Colors.transparent,
            borderRadius:
                const BorderRadius.horizontal(right: Radius.circular(24)),
          ),
          margin: const EdgeInsets.only(right: 8),
          child: InkWell(
            borderRadius:
                const BorderRadius.horizontal(right: Radius.circular(24)),
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.normal,
                        color: isSelected
                            ? Theme.of(context).colorScheme.onSecondaryContainer
                            : Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  Icon(
                    icon,
                    color: isSelected
                        ? Theme.of(context).colorScheme.onSecondaryContainer
                        : Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
