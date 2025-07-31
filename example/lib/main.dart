import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:example/theme.dart';
import 'package:example/widgets/widgets.dart';
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

class HomePage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: [
          Button.ghost(
            onPressed: onThemeToggle,
            child: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
          )
        ],
      ),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              spacing: 8,
              children: [
                ButtonWidget(),
                InputWidget(),
                LabelWidget(),
                ShowAlertDialog(),
                LoaderWidget(),
                BannerWidget(),
                ListTileUiWidget()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
