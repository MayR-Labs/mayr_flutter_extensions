import 'package:flutter/material.dart';
import 'package:mayr_flutter_extensions/mayr_flutter_extensions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const ExampleScreen());
  }
}

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Extensions Demo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// BuildContext Extensions
            const Text(
              'BuildContext Extensions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('MediaQuery width: ${context.widgetWidth}'),
            Text('MediaQuery height: ${context.widgetHeight}'),
            Text('Is dark mode: ${context.platformInDarkMode}'),
            Text('Is light mode: ${context.platformInLightMode}'),
            Text('Is portrait: ${context.isPortrait}'),
            Text('Is landscape: ${context.isLandscape}'),
            Text('Is phone: ${context.isPhone}'),
            Text('Is tablet: ${context.isTablet}'),

            const SizedBox(height: 20),

            /// Widget Extensions
            const Text(
              'Widget Extensions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Padding example
            Container(
              height: 100,
              width: 100,
              color: Colors.blue,
            ).paddingAll(8).opacity(0.5).center(),

            const SizedBox(height: 10),

            // Expanded example
            Row(
              children: [
                Container(height: 50, color: Colors.red).expanded(2),
                Container(height: 50, color: Colors.green).expanded(1),
              ],
            ),

            const SizedBox(height: 20),

            /// InkWellManager Example
            const Text(
              'Tap Interactions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.amber,
              child: const Text('Tap Me', style: TextStyle(fontSize: 18)),
            ).inkWellManager(() {
              context.showSnackBar("Widget tapped!");
            }).onTap(),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.lightGreen,
              child: const Text(
                'Long Press Me',
                style: TextStyle(fontSize: 18),
              ),
            ).inkWellManager(() {
              context.showSnackBar("Widget long pressed!");
            }, color: Colors.green).onLongPress(),

            const SizedBox(height: 20),

            /// Visibility Extensions
            const Text(
              'Visibility Extensions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            const Text('This is visible').showIf(true),
            const Text('This is hidden').hideIf(true),
            const Text('Show unless false').showUnless(false),

            const SizedBox(height: 20),

            /// Clipping Extensions
            const Text(
              'Clipping Extensions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Container(
              height: 80,
              width: 200,
              color: Colors.purple,
            ).clipRounded(16),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
