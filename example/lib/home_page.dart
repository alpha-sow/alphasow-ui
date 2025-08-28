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

  void _navigateToIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
    context.router.navigate(routes[index]);
  }

  List<AsMenuDrawerItem> get drawerItems => [
        AsMenuDrawerItem.withIcon(
          icon: Icons.smart_button_outlined,
          text: 'Button',
          selected: _selectedIndex == 0,
          onTap: () => _navigateToIndex(0),
        ),
        AsMenuDrawerItem.withIcon(
          icon: Icons.account_circle_outlined,
          text: 'Avatar',
          selected: _selectedIndex == 1,
          onTap: () => _navigateToIndex(1),
        ),
        AsMenuDrawerItem.withIcon(
          icon: Icons.campaign_outlined,
          text: 'Banner',
          selected: _selectedIndex == 2,
          onTap: () => _navigateToIndex(2),
        ),
        AsMenuDrawerItem.withIcon(
          icon: Icons.chat_bubble_outline,
          text: 'Dialog',
          selected: _selectedIndex == 3,
          onTap: () => _navigateToIndex(3),
        ),
        AsMenuDrawerItem.withIcon(
          icon: Icons.input_outlined,
          text: 'Input',
          selected: _selectedIndex == 4,
          onTap: () => _navigateToIndex(4),
        ),
        AsMenuDrawerItem.withIcon(
          icon: Icons.label_outline,
          text: 'Label',
          selected: _selectedIndex == 5,
          onTap: () => _navigateToIndex(5),
        ),
        AsMenuDrawerItem.withIcon(
          icon: Icons.view_list_outlined,
          text: 'ListTile',
          selected: _selectedIndex == 6,
          onTap: () => _navigateToIndex(6),
        ),
        AsMenuDrawerItem.withIcon(
          icon: Icons.hourglass_empty,
          text: 'Loader',
          selected: _selectedIndex == 7,
          onTap: () => _navigateToIndex(7),
        ),
        AsMenuDrawerItem.withIcon(
          icon: Icons.menu_outlined,
          text: 'Menu',
          selected: _selectedIndex == 8,
          onTap: () => _navigateToIndex(8),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth >= 768;

    return AsScaffold(
      appBar: AsAppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Alphasow UI Example'),
        leading: isLargeScreen
            ? null
            : Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => context.showAsMenuDrawer(items: drawerItems),
                ),
              ),
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
          if (isLargeScreen)
            AsMenuDrawer(
              items: drawerItems,
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

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({
    required this.selectedIndex,
    required this.routes,
    required this.onItemTap,
    super.key,
  });

  final int selectedIndex;
  final List<PageRouteInfo> routes;
  final ValueChanged<int> onItemTap;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            selectedIndex: selectedIndex,
            onTap: () => onItemTap(0),
          ),
          SideBarItem(
            title: 'Avatar',
            icon: Icons.account_circle_outlined,
            index: 1,
            selectedIndex: selectedIndex,
            onTap: () => onItemTap(1),
          ),
          SideBarItem(
            title: 'Banner',
            icon: Icons.campaign_outlined,
            index: 2,
            selectedIndex: selectedIndex,
            onTap: () => onItemTap(2),
          ),
          SideBarItem(
            title: 'Dialog',
            icon: Icons.chat_bubble_outline,
            index: 3,
            selectedIndex: selectedIndex,
            onTap: () => onItemTap(3),
          ),
          SideBarItem(
            title: 'Input',
            icon: Icons.input_outlined,
            index: 4,
            selectedIndex: selectedIndex,
            onTap: () => onItemTap(4),
          ),
          SideBarItem(
            title: 'Label',
            icon: Icons.label_outline,
            index: 5,
            selectedIndex: selectedIndex,
            onTap: () => onItemTap(5),
          ),
          SideBarItem(
            title: 'ListTile',
            icon: Icons.view_list_outlined,
            index: 6,
            selectedIndex: selectedIndex,
            onTap: () => onItemTap(6),
          ),
          SideBarItem(
            title: 'Loader',
            icon: Icons.hourglass_empty,
            index: 7,
            selectedIndex: selectedIndex,
            onTap: () => onItemTap(7),
          ),
          SideBarItem(
            title: 'Menu',
            icon: Icons.menu_outlined,
            index: 8,
            selectedIndex: selectedIndex,
            onTap: () => onItemTap(8),
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
