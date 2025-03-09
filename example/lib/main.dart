import 'package:alpha_ui/alpha_ui.dart';
import 'package:example/button_widget.dart';
import 'package:example/input_widget.dart';
import 'package:example/label_widget.dart';
import 'package:example/show_alert_dailog.dart';
import 'package:flutter/material.dart';

void main() {
  ThemeUI.set();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: theme.primary,
      ),
      home: const HomePage(title: 'alpha_ui'),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                ButtonWidget(),
                InputWidget(),
                LabelWidget(),
                ShowAlertDailog(),
              ],
            ),
          ),
        ],
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        Button(
          child: const Text('Button'),
          onPressed: () {},
        ),
      ],
    );
  }
}
