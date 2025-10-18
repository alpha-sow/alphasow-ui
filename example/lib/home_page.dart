import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:example/router.gr.dart';
import 'package:example/theme/theme.dart';
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
    BottomNavigationRoute(),
    DialogRoute(),
    InputRoute(),
    LabelRoute(),
    ListTileRoute(),
    LoaderRoute(),
    MenuRoute(),
    CardRoute(),
  ];

  Future<void> _navigateToIndex(int index) async {
    setState(() {
      _selectedIndex = index;
    });
    await context.router.navigate(routes[index]);
  }

  List<AsMenuDrawerItem> get drawerItems => [
        AsMenuDrawerItem.withIcon(
          context: context,
          icon: Icons.smart_button_outlined,
          text: 'Button',
          selected: _selectedIndex == 0,
          onTap: () => _navigateToIndex(0),
        ),
        AsMenuDrawerItem.withIcon(
          context: context,
          icon: Icons.account_circle_outlined,
          text: 'Avatar',
          selected: _selectedIndex == 1,
          onTap: () => _navigateToIndex(1),
        ),
        AsMenuDrawerItem.withIcon(
          context: context,
          icon: Icons.campaign_outlined,
          text: 'Banner',
          selected: _selectedIndex == 2,
          onTap: () => _navigateToIndex(2),
        ),
        AsMenuDrawerItem.withIcon(
          context: context,
          icon: Icons.navigation_outlined,
          text: 'Bottom Navigation',
          selected: _selectedIndex == 3,
          onTap: () => _navigateToIndex(3),
        ),
        AsMenuDrawerItem.withIcon(
          context: context,
          icon: Icons.chat_bubble_outline,
          text: 'Dialog',
          selected: _selectedIndex == 4,
          onTap: () => _navigateToIndex(4),
        ),
        AsMenuDrawerItem.withIcon(
          context: context,
          icon: Icons.input_outlined,
          text: 'Input',
          selected: _selectedIndex == 5,
          onTap: () => _navigateToIndex(5),
        ),
        AsMenuDrawerItem.withIcon(
          context: context,
          icon: Icons.label_outline,
          text: 'Label',
          selected: _selectedIndex == 6,
          onTap: () => _navigateToIndex(6),
        ),
        AsMenuDrawerItem.withIcon(
          context: context,
          icon: Icons.view_list_outlined,
          text: 'ListTile',
          selected: _selectedIndex == 7,
          onTap: () => _navigateToIndex(7),
        ),
        AsMenuDrawerItem.withIcon(
          context: context,
          icon: Icons.hourglass_empty,
          text: 'Loader',
          selected: _selectedIndex == 8,
          onTap: () => _navigateToIndex(8),
        ),
        AsMenuDrawerItem.withIcon(
          context: context,
          icon: Icons.menu_outlined,
          text: 'Menu',
          selected: _selectedIndex == 9,
          onTap: () => _navigateToIndex(9),
        ),
        AsMenuDrawerItem.withIcon(
          context: context,
          icon: Icons.credit_card_outlined,
          text: 'Card',
          selected: _selectedIndex == 10,
          onTap: () => _navigateToIndex(10),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth >= 768;

    return AsScaffold(
      appBar: AsAppBar(
        title: const Text('Alphasow UI Example'),
        leading: isLargeScreen
            ? null
            : Builder(
                builder: (context) => AsIconButton.ghost(
                  icon: Icons.menu,
                  onPressed: () => context.showAsMenuDrawer(
                    header: const AsAppBar(
                      title: Text('Widget'),
                    ).adaptive,
                    items: drawerItems,
                  ),
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
                    themeNotifier?.changeColor(ThemeColor.orange);
                  },
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            color: getLightTheme(ThemeColor.orange)
                                .colorScheme
                                .primary,
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            color: getLightTheme(ThemeColor.orange)
                                .colorScheme
                                .secondary,
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            color: getLightTheme(ThemeColor.orange)
                                .colorScheme
                                .tertiary,
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            color: getLightTheme(ThemeColor.orange)
                                .colorScheme
                                .error,
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      const Expanded(child: Text('Orange')),
                      if (ThemeNotifier.of(context)?.currentThemeColor ==
                          ThemeColor.orange)
                        const Icon(Icons.check, size: 20),
                    ],
                  ),
                ),
                AsMenuDownItem(
                  onTap: () {
                    final themeNotifier = ThemeNotifier.of(context);
                    themeNotifier?.changeColor(ThemeColor.green);
                  },
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            color: getLightTheme(ThemeColor.green)
                                .colorScheme
                                .primary,
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            color: getLightTheme(ThemeColor.green)
                                .colorScheme
                                .secondary,
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            color: getLightTheme(ThemeColor.green)
                                .colorScheme
                                .tertiary,
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            color: getLightTheme(ThemeColor.green)
                                .colorScheme
                                .error,
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      const Expanded(child: Text('Green')),
                      if (ThemeNotifier.of(context)?.currentThemeColor ==
                          ThemeColor.green)
                        const Icon(Icons.check, size: 20),
                    ],
                  ),
                ),
                AsMenuDownItem(
                  onTap: () {
                    final themeNotifier = ThemeNotifier.of(context);
                    themeNotifier?.changeColor(ThemeColor.blue);
                  },
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            color: getLightTheme(ThemeColor.blue)
                                .colorScheme
                                .primary,
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            color: getLightTheme(ThemeColor.blue)
                                .colorScheme
                                .secondary,
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            color: getLightTheme(ThemeColor.blue)
                                .colorScheme
                                .tertiary,
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            color: getLightTheme(ThemeColor.blue)
                                .colorScheme
                                .error,
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      const Expanded(child: Text('Blue')),
                      if (ThemeNotifier.of(context)?.currentThemeColor ==
                          ThemeColor.blue)
                        const Icon(Icons.check, size: 20),
                    ],
                  ),
                ),
                AsMenuDownItem(
                  onTap: () {
                    final themeNotifier = ThemeNotifier.of(context);
                    themeNotifier?.changeColor(ThemeColor.protectU);
                  },
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            color: getLightTheme(ThemeColor.protectU)
                                .colorScheme
                                .primary,
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            color: getLightTheme(ThemeColor.protectU)
                                .colorScheme
                                .secondary,
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            color: getLightTheme(ThemeColor.protectU)
                                .colorScheme
                                .tertiary,
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            color: getLightTheme(ThemeColor.protectU)
                                .colorScheme
                                .error,
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      const Expanded(child: Text('ProtectU')),
                      if (ThemeNotifier.of(context)?.currentThemeColor ==
                          ThemeColor.protectU)
                        const Icon(Icons.check, size: 20),
                    ],
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
              width: 220,
              items: drawerItems,
              resizable: true,
              isOverlay: true,
            ),
          Expanded(
            child: AutoTabsScaffold(
              backgroundColor: Colors.transparent,
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
            title: 'Bottom Navigation',
            icon: Icons.navigation_outlined,
            index: 3,
            selectedIndex: selectedIndex,
            onTap: () => onItemTap(3),
          ),
          SideBarItem(
            title: 'Dialog',
            icon: Icons.chat_bubble_outline,
            index: 4,
            selectedIndex: selectedIndex,
            onTap: () => onItemTap(4),
          ),
          SideBarItem(
            title: 'Input',
            icon: Icons.input_outlined,
            index: 5,
            selectedIndex: selectedIndex,
            onTap: () => onItemTap(5),
          ),
          SideBarItem(
            title: 'Label',
            icon: Icons.label_outline,
            index: 6,
            selectedIndex: selectedIndex,
            onTap: () => onItemTap(6),
          ),
          SideBarItem(
            title: 'ListTile',
            icon: Icons.view_list_outlined,
            index: 7,
            selectedIndex: selectedIndex,
            onTap: () => onItemTap(7),
          ),
          SideBarItem(
            title: 'Loader',
            icon: Icons.hourglass_empty,
            index: 8,
            selectedIndex: selectedIndex,
            onTap: () => onItemTap(8),
          ),
          SideBarItem(
            title: 'Menu',
            icon: Icons.menu_outlined,
            index: 9,
            selectedIndex: selectedIndex,
            onTap: () => onItemTap(9),
          ),
          SideBarItem(
            title: 'Card',
            icon: Icons.credit_card_outlined,
            index: 10,
            selectedIndex: selectedIndex,
            onTap: () => onItemTap(10),
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
