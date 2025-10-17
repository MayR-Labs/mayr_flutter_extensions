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

            /// New Widget Extensions - Sizing
            const Text(
              'Sizing Extensions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Container(
              color: Colors.orange,
              child: const Text('AspectRatio 16:9'),
            ).aspectRatio(16 / 9),

            const SizedBox(height: 10),

            Container(
              color: Colors.teal,
              child: const Text('50% width'),
            ).fractionallySizedBox(widthFactor: 0.5),

            const SizedBox(height: 20),

            /// New Widget Extensions - Styling
            const Text(
              'Styling Extensions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            const Text('Decorated Box')
                .decorated(
                  const BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                )
                .paddingAll(16),

            const SizedBox(height: 10),

            const Text('Card Widget').card(elevation: 8.0).paddingAll(8),

            const SizedBox(height: 10),

            Container(height: 100, width: 100, color: Colors.green).clipOval(),

            const SizedBox(height: 20),

            /// New Widget Extensions - Layout
            const Text(
              'Layout Extensions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Container(
              height: 150,
              color: Colors.grey[300],
              child:
                  Column(
                    children: List.generate(
                      20,
                      (i) => Text('Scrollable Item $i'),
                    ),
                  ).scrollable(),
            ),

            const SizedBox(height: 10),

            const Text('Safe Area Widget').safeArea(),

            const SizedBox(height: 10),

            Container(
              height: 100,
              width: 100,
              color: Colors.pink,
              child: const Text('FittedBox').fittedBox(fit: BoxFit.contain),
            ),

            const SizedBox(height: 20),

            /// New Widget Extensions - Effects
            const Text(
              'Effects Extensions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            const Text('Hero Tag').hero('demo-hero'),

            const SizedBox(height: 10),

            const Text('Rotated 1x').rotated(1),

            const SizedBox(height: 20),

            /// String Extensions
            const Text(
              'String Extensions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            'String to Text Widget'.toText(
              style: const TextStyle(fontSize: 16, color: Colors.blue),
            ),

            const SizedBox(height: 10),

            'Selectable Text Example'.toSelectableText(),

            const SizedBox(height: 20),

            /// List<Widget> Extensions
            const Text(
              'List<Widget> Extensions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            [
              Container(color: Colors.red, height: 50, width: 50),
              Container(color: Colors.green, height: 50, width: 50),
              Container(color: Colors.blue, height: 50, width: 50),
            ].toRow(mainAxisAlignment: MainAxisAlignment.spaceEvenly),

            const SizedBox(height: 10),

            [
              const Chip(label: Text('Chip 1')),
              const Chip(label: Text('Chip 2')),
              const Chip(label: Text('Chip 3')),
            ].toWrap(spacing: 8),

            const SizedBox(height: 20),

            /// Color Extensions
            const Text(
              'Color Extensions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.blue,
                  child: const Center(child: Text('Original')),
                ),
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.blue.darken(0.2),
                  child: const Center(child: Text('Dark')),
                ),
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.blue.lighten(0.2),
                  child: const Center(child: Text('Light')),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// Theme and Navigation Demo
            const Text(
              'Theme & Navigation Extensions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Text('Primary Color: ${context.primaryColor}'),
            Text('Is Dark Mode: ${context.isDarkMode}'),
            Text('Screen Width: ${context.screenWidth}'),
            Text('Device Pixel Ratio: ${context.devicePixelRatio}'),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                context.showSnackBar('Navigation extensions available!');
              },
              child: const Text('Test Navigation Extension'),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
