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

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlphasowUiApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: isDarkMode ? themeDark : theme,
      cupertinoTheme: isDarkMode ? cupertinoThemeDark : cupertinoTheme,
      home: HomePage(
        title: 'alphasow_ui',
        onThemeToggle: toggleTheme,
        isDarkMode: isDarkMode,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    required this.title,
    required this.onThemeToggle,
    required this.isDarkMode,
    super.key,
  });

  final String title;
  final VoidCallback onThemeToggle;
  final bool isDarkMode;

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
  ];

  @override
  Widget build(BuildContext context) {
    return AsScaffold(
      appBar: AsAppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          AsIconButton.ghost(
            onPressed: widget.onThemeToggle,
            icon: widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
          )
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
