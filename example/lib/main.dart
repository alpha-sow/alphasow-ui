import 'package:alpha_ui/alpha_ui.dart';
import 'package:example/button_widget.dart';
import 'package:example/label_widget.dart';
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
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const ButtonWidget(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Input UI',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                const Input(hintText: 'Email'),
                const SizedBox(height: 10.0),
                const Input(hintText: 'Email', disabled: true),
                const SizedBox(height: 10.0),
                const Input(
                  label: 'Username',
                  hintText: 'alpha_ui',
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    const Flexible(
                      child: Input(
                        hintText: 'Email',
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    Button(
                      child: const Text('Subscribe'),
                      onPressed: () {},
                    )
                  ],
                ),
                const SizedBox(height: 10.0),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Input(
                        label: 'Username',
                        hintText: 'alpha_ui',
                        description: 'This is your public display name.',
                      ),
                      Button(
                        child: const Text('Submit'),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                const LabelWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
