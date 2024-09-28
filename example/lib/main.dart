import 'package:alpha_ui/alpha_ui.dart';
import 'package:flutter/material.dart';

void main() {
  setTheme();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(title: 'alpha_ui'),
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
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Button UI',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                Column(
                  children: [
                    Button(
                      onPressed: () {},
                      child: const Text('Button'),
                    ),
                    const SizedBox(height: 10.0),
                    Button(
                      onPressed: () {},
                      variant: Variant.secondary,
                      child: const Text('Secondary'),
                    ),
                    const SizedBox(height: 10.0),
                    Button(
                      onPressed: () {},
                      variant: Variant.destructive,
                      child: const Text('Destructive'),
                    ),
                    const SizedBox(height: 10.0),
                    Button(
                      onPressed: () {},
                      variant: Variant.outline,
                      child: const Text('Outline'),
                    ),
                    const SizedBox(height: 10.0),
                    Button(
                      onPressed: () {},
                      variant: Variant.ghost,
                      child: const Text('Ghost'),
                    ),
                    const SizedBox(height: 10.0),
                    Button(
                      onPressed: () {},
                      variant: Variant.link,
                      child: const Text('Link'),
                    ),
                    const SizedBox(height: 10.0),
                    Button(
                      onPressed: () {},
                      variant: Variant.outline,
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 10.0,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Button(
                      onPressed: () {},
                      child: const IntrinsicWidth(
                        child: Row(
                          children: [
                            Icon(Icons.mail_outline, size: 18.0),
                            SizedBox(width: 10.0),
                            Text('Login with Email'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Button(
                      onPressed: null,
                      child: IntrinsicWidth(
                        child: Row(
                          children: [
                            ButtonCircularLoader(),
                            const SizedBox(width: 10.0),
                            const Text('Please wait'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Input UI',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                Input(hintText: 'Email'),
                const SizedBox(height: 10.0),
                Input(hintText: 'Email', disabled: true),
                const SizedBox(height: 10.0),
                Input(
                  label: 'Username',
                  hintText: 'alpha_ui',
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Flexible(
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
                      Input(
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
