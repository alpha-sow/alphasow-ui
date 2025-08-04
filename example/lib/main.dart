import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:example/pages/pages.dart';
import 'package:example/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;
  ThemeColor currentThemeColor = ThemeColor.blue;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  void changeThemeColor(ThemeColor newColor) {
    setState(() {
      currentThemeColor = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlphasowUiApp(
      key: ValueKey('${isDarkMode}_${currentThemeColor.name}'),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: isDarkMode
          ? getDarkTheme(currentThemeColor)
          : getLightTheme(currentThemeColor),
      cupertinoTheme: isDarkMode 
          ? getDarkCupertinoTheme(currentThemeColor) 
          : getLightCupertinoTheme(currentThemeColor),
      home: HomePage(
        title: 'alphasow_ui',
        onThemeToggle: toggleTheme,
        onThemeColorChange: changeThemeColor,
        isDarkMode: isDarkMode,
        currentThemeColor: currentThemeColor,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    required this.title,
    required this.onThemeToggle,
    required this.onThemeColorChange,
    required this.isDarkMode,
    required this.currentThemeColor,
    super.key,
  });

  final String title;
  final VoidCallback onThemeToggle;
  final ValueChanged<ThemeColor> onThemeColorChange;
  final bool isDarkMode;
  final ThemeColor currentThemeColor;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<PageItem> pages = [
    PageItem('Buttons', Icons.smart_button, const ButtonPage()),
    PageItem('Inputs', Icons.input, const InputPage()),
    PageItem('Labels', Icons.label, const LabelPage()),
    PageItem('Alert Dialog', Icons.warning, const DialogPage()),
    PageItem('Loaders', Icons.refresh, const LoaderPage()),
    PageItem('Banners', Icons.campaign, const BannerPage()),
    PageItem('List Tiles', Icons.list, const ListTilePage()),
    PageItem('Avatar', Icons.person, const AvatarPage()),
    PageItem('Menu Dropdown', Icons.menu, const MenuPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return AsScaffold(
      appBar: AsAppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: AsMenuDown.buttonIcon(
              variant: Variant.ghost,
              position: MenuPosition.bottomRight,
              items: [
                AsMenuDownItem.withIcon(
                  text: widget.isDarkMode ? 'Light Mode' : 'Dark Mode',
                  icon: widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  onTap: widget.onThemeToggle,
                ),
                const AsMenuDownItem.divider(),
                AsMenuDownItem(
                  child: ColoredBox(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: widget.currentThemeColor == ThemeColor.red
                          ? const Icon(Icons.check, color: Colors.white)
                          : const SizedBox.shrink(),
                    ),
                  ),
                  onTap: () => widget.onThemeColorChange(ThemeColor.red),
                ),
                AsMenuDownItem(
                  child: ColoredBox(
                    color: Colors.orange,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: widget.currentThemeColor == ThemeColor.orange
                          ? const Icon(Icons.check, color: Colors.white)
                          : const SizedBox.shrink(),
                    ),
                  ),
                  onTap: () => widget.onThemeColorChange(ThemeColor.orange),
                ),
                AsMenuDownItem(
                  child: ColoredBox(
                    color: Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: widget.currentThemeColor == ThemeColor.green
                          ? const Icon(Icons.check, color: Colors.white)
                          : const SizedBox.shrink(),
                    ),
                  ),
                  onTap: () => widget.onThemeColorChange(ThemeColor.green),
                ),
                AsMenuDownItem(
                  child: ColoredBox(
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: widget.currentThemeColor == ThemeColor.blue
                          ? const Icon(Icons.check, color: Colors.white)
                          : const SizedBox.shrink(),
                    ),
                  ),
                  onTap: () => widget.onThemeColorChange(ThemeColor.blue),
                ),
              ],
              icon: Icons.color_lens,
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          AsNavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            labelType: AsNavigationRailLabelType.all,
            destinations: pages.map((page) {
              return AsNavigationRailDestination(
                icon: Icon(page.icon),
                label: page.title,
              );
            }).toList(),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: pages[selectedIndex].page,
          ),
        ],
      ),
    );
  }
}

class PageItem {
  PageItem(this.title, this.icon, this.page);

  final String title;
  final IconData icon;
  final Widget page;
}
