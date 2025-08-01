import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:example/pages/widgets.dart';
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
    PageItem('Alert Dialog', Icons.warning, const ShowAlertDialogPage()),
    PageItem('Loaders', Icons.refresh, const LoaderPage()),
    PageItem('Banners', Icons.campaign, const BannerPage()),
    PageItem('List Tiles', Icons.list, const ListTilePage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          ASButton.ghost(
            onPressed: widget.onThemeToggle,
            child: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
          )
        ],
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: pages.map((page) {
              return NavigationRailDestination(
                icon: Icon(page.icon),
                label: Text(page.title),
              );
            }).toList(),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: pages[selectedIndex].page,
            ),
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
