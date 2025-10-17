![License](https://img.shields.io/badge/license-MIT-blue.svg?label=Licence)
![Platform](https://img.shields.io/badge/Platform-Flutter-blue.svg)
![Pub Version](https://img.shields.io/pub/v/mayr_flutter_extensions?style=plastic&label=Version)
![Pub.dev Score](https://img.shields.io/pub/points/mayr_flutter_extensions?label=Score&style=plastic)
![Pub Likes](https://img.shields.io/pub/likes/mayr_flutter_extensions?label=Likes&style=plastic)
![Downloads](https://img.shields.io/pub/dm/mayr_flutter_extensions.svg?label=Downloads&style=plastic)
![Build Status](https://img.shields.io/github/actions/workflow/status/MayR-Labs/mayr_flutter_extensions/ci.yaml?label=Build)
![Issues](https://img.shields.io/github/issues/MayR-Labs/mayr_flutter_extensions.svg?label=Issues)

# 🧰 MayR Flutter Extensions

> **Flutter-specific extension methods to supercharge your Flutter development**

A comprehensive collection of Flutter-specific extension methods designed to make your Flutter code cleaner, more expressive, and easier to write. This package focuses exclusively on Flutter widgets and framework features.

## 📦 Package Family

This package is part of the **MayR Extensions** family:

- **[mayr_dart_extensions](https://pub.dev/packages/mayr_dart_extensions)** - General Dart extensions for String, int, DateTime, Duration, List, Map, etc.
- **mayr_flutter_extensions** (this package) - Flutter-specific extensions for Widget, BuildContext, etc.

### 💡 Usage Together

For Flutter applications, you'll typically want to use **both packages** together:

```dart
// In your pubspec.yaml
dependencies:
  mayr_dart_extensions: ^1.0.0      # For general Dart utilities
  mayr_flutter_extensions: ^1.0.0   # For Flutter-specific features
```

This separation ensures:
- ✅ Pure Dart projects can use `mayr_dart_extensions` without Flutter dependencies
- ✅ Flutter projects get the best of both worlds
- ✅ No code duplication between packages
- ✅ Cleaner, more focused codebases

## 🚀 Installation

Add the package to your `pubspec.yaml`:

```bash
flutter pub add mayr_flutter_extensions
```

Or manually add it:

```yaml
dependencies:
  mayr_flutter_extensions: ^1.0.0
```

Then import it:

```dart
import 'package:mayr_flutter_extensions/mayr_flutter_extensions.dart';
```

## ✨ Features

### 🧱 BuildContext Extensions

Quickly access common Flutter objects from `BuildContext`:

#### Navigation & State Access

```dart
// Easy access to common Flutter objects
context.navigator;          // Navigator.of(context)
context.scaffold;           // Scaffold.of(context)
context.form;              // Form.of(context)
context.overlay;           // Overlay.of(context)
context.scaffoldMessenger; // ScaffoldMessenger.of(context)
```

#### SnackBar Helper

```dart
// Show a snackbar with one line
context.showSnackBar(
  'Hello World!',
  duration: Duration(seconds: 2),
  behavior: SnackBarBehavior.floating,
);
```

#### Media Query

```dart
// Access MediaQueryData
context.mediaQuery;
context.widgetSize;           // Size of the widget
context.widgetWidth;          // Width only
context.widgetHeight;         // Height only
context.widgetShortestSide;   // Shortest side (useful for responsive design)
```

#### Theme & Brightness

```dart
// Platform brightness
context.platformBrightness;      // Brightness.dark or Brightness.light
context.platformInDarkMode;      // true if dark mode
context.platformInLightMode;     // true if light mode
```

#### Device Type Detection

```dart
// Responsive design helpers
context.orientation;        // Portrait or landscape
context.isPortrait;        // true if portrait
context.isLandscape;       // true if landscape

// Device type checks
context.isPhone;           // Screen width < 600
context.isSmallTablet;     // 600 <= width < 720
context.isLargeTablet;     // 720 <= width < 1024
context.isTablet;          // isSmallTablet || isLargeTablet
context.isDesktop;         // width >= 1024
```

---

### 🎨 Widget Extensions

#### Basic Transformations

```dart
// Center a widget
Text('Hello').center();

// Make widget expanded
Container().expanded(2);  // flex = 2

// Make widget flexible
Container().flexible(flex: 1);

// Add opacity
Container().opacity(0.5);

// Wrap with SizedBox
Text('Hello').sizedBox(width: 100, height: 50);

// Add constraints
Container().constrained(
  maxWidth: 200,
  maxHeight: 300,
);
```

#### Padding

```dart
// Add padding
Widget().paddingAll(16);
Widget().paddingSymmetric(horizontal: 20, vertical: 10);
Widget().paddingOnly(left: 8, top: 16);
Widget().paddingZero();
```

#### Clipping

```dart
// Clip widget
Container().clipRect();
Container().clipRRect(BorderRadius.circular(12));
Container().clipRounded(16);  // Quick rounded corners
```

#### Positioning

```dart
// Position with Align
Widget().positionAlign(Alignment.center);

// Fill parent with Positioned.fill
Widget().positionedFill();
```

#### Visibility Helpers

```dart
final isLoggedIn = true;
final isLoading = false;

// Conditional visibility
Text('Welcome!').showIf(isLoggedIn);
Text('Please login').hideIf(isLoggedIn);
Text('Content').showUnless(isLoading);
Text('Loading...').hideUnless(isLoading);
```

#### Tap Interactions with InkWellManager

Easily add tap, double-tap, and long-press interactions to any widget:

```dart
// Simple tap
Text('Click me')
  .inkWellManager(() => print('Tapped!'))
  .onTap();

// With custom splash color
Container(
  padding: EdgeInsets.all(16),
  child: Text('Tap me'),
).inkWellManager(
  () => print('Tapped!'),
  color: Colors.blue,
).onTap();

// Long press
Widget().inkWellManager(() => print('Long pressed'))
  .onLongPress();

// Double tap
Widget().inkWellManager(() => print('Double tapped'))
  .onDoubleTap();
```

**Why InkWellManager?**

Instead of manually wrapping widgets in `InkWell` every time, `InkWellManager` provides quick `.onTap()`, `.onDoubleTap()`, and `.onLongPress()` methods — making your code shorter, cleaner, and more maintainable.

---

### 🖼️ Image Extensions

Quickly create CircleAvatar from Image widgets:

```dart
Image.network('https://example.com/avatar.jpg')
  .circleAvatar(
    radius: 40,
    backgroundColor: Colors.grey,
  );
```

---

## 📖 Complete Example

```dart
import 'package:flutter/material.dart';
import 'package:mayr_flutter_extensions/mayr_flutter_extensions.dart';

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo')),
      body: Column(
        children: [
          // Show info based on device type
          Text('Device: ${context.isPhone ? "Phone" : "Tablet"}')
            .paddingAll(16),
          
          // Responsive container
          Container(
            color: Colors.blue,
            child: Text('Hello'),
          )
            .paddingAll(8)
            .opacity(0.8)
            .clipRounded(12)
            .center(),
          
          // Conditional visibility
          Text('Dark mode enabled!')
            .showIf(context.platformInDarkMode),
          
          // Tap interaction
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.amber,
            child: Text('Tap me'),
          )
            .inkWellManager(() {
              context.showSnackBar('Tapped!');
            })
            .onTap(),
        ],
      ),
    );
  }
}
```

---

## 🤝 Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### Quick Start for Contributors

1. Fork the repository
2. Create a feature branch
3. Make your changes (remember: Flutter-specific extensions only!)
4. Add tests for your changes
5. Run tests: `flutter test`
6. Format code: `dart format .`
7. Check for issues: `dart analyze .`
8. Submit a pull request

---

## 📜 License

This package is licensed under the MIT License. See [LICENSE](LICENSE) for details.

Copyright (c) 2025 [MayR Labs](https://mayrlabs.com)

---

## 🌟 Support the Project

If you find this package helpful:

- ⭐ Star the repository on [GitHub](https://github.com/MayR-Labs/mayr_flutter_extensions)
- 👍 Like it on [pub.dev](https://pub.dev/packages/mayr_flutter_extensions)
- 🐛 Report issues or suggest features
- 🔀 Contribute with pull requests
- 📢 Share it with other Flutter developers

---

## 🔗 Links

- **Package**: [pub.dev/packages/mayr_flutter_extensions](https://pub.dev/packages/mayr_flutter_extensions)
- **Repository**: [github.com/MayR-Labs/mayr_flutter_extensions](https://github.com/MayR-Labs/mayr_flutter_extensions)
- **Related Package**: [mayr_dart_extensions](https://pub.dev/packages/mayr_dart_extensions)
- **Organization**: [MayR Labs](https://mayrlabs.com)
- **Issues**: [Report a bug or request a feature](https://github.com/MayR-Labs/mayr_flutter_extensions/issues)

---

Made with ❤️ by [MayR Labs](https://mayrlabs.com)
