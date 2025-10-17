# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-01-17

### 🎉 Initial Release

This is the first release of **mayr_flutter_extensions** as a standalone Flutter-specific extension package, separated from the original `mayr_extensions` package.

### Added - New Extensions

#### 🎨 Widget Extensions - Positioning & Sizing
- `positioned({top, bottom, left, right})` - Wraps widget in Positioned with custom positioning for Stack layouts
- `aspectRatio(double ratio)` - Maintains aspect ratio (e.g., 16:9 for videos)
- `fractionallySizedBox({widthFactor, heightFactor})` - Sizes widget as fraction of parent

#### 🎨 Widget Extensions - Styling
- `decorated(BoxDecoration decoration)` - Wraps widget in DecoratedBox with custom decoration
- `card({elevation, shape})` - Wraps widget in Material Card
- `clipOval()` - Clips widget to oval shape

#### 🎨 Widget Extensions - Layout
- `scrollable({direction})` - Wraps widget in SingleChildScrollView (vertical or horizontal)
- `safeArea({top, bottom})` - Wraps widget in SafeArea with optional sides
- `fittedBox({fit})` - Wraps widget in FittedBox with BoxFit options

#### 🎨 Widget Extensions - Effects & Gestures
- `hero(String tag)` - Wraps widget in Hero for page transition animations
- `rotated(int quarterTurns)` - Wraps widget in RotatedBox (rotates by 90° increments)
- `transform(Matrix4 transform)` - Wraps widget in Transform with matrix transformations
- `gestureDetector({onTap, onDoubleTap})` - Wraps widget in GestureDetector for gesture handling
- `dismissible(Key key, {direction})` - Wraps widget in Dismissible for swipe-to-dismiss functionality

#### 🧭 BuildContext Extensions - Navigation
- `push(Widget page)` - Navigate to new page with MaterialPageRoute
- `pop([result])` - Go back with optional result
- `pushReplacement(Widget page)` - Replace current route with new page
- `pushNamed(String route, {arguments})` - Navigate by named route with arguments

#### 🧭 BuildContext Extensions - Theme Access
- `theme` - Get current ThemeData
- `primaryColor` - Quick access to theme primary color
- `colorScheme` - Access current ColorScheme
- `textTheme` - Access TextTheme styles
- `isDarkMode` - Check if dark mode is active (based on theme brightness)

#### 🧭 BuildContext Extensions - MediaQuery Shortcuts
- `screenWidth` / `screenHeight` - Convenient aliases for screen dimensions
- `padding` - Get safe area insets (notch, status bar, etc.)
- `viewInsets` - Get system UI insets (keyboard, navigation bar, etc.)
- `devicePixelRatio` - Get device pixel density

#### 🧭 BuildContext Extensions - Platform Detection
- `isIOS` - Check if running on iOS platform
- `isAndroid` - Check if running on Android platform
- `isWeb` - Check if running on web platform (uses `kIsWeb` constant)

#### 🧭 BuildContext Extensions - Dialogs
- `showCustomDialog(Widget dialog)` - Show Material dialog with less boilerplate
- `showSheet(Widget content)` - Show modal bottom sheet with less boilerplate

#### 🔧 String Extensions
- `toText({style})` - Convert String to Text widget
- `toSelectableText({style})` - Convert String to SelectableText widget

#### 🔧 List<Widget> Extensions
- `toColumn({mainAxisAlignment, mainAxisSize, crossAxisAlignment})` - Convert widget list to Column
- `toRow({mainAxisAlignment, mainAxisSize, crossAxisAlignment})` - Convert widget list to Row
- `toStack({alignment, fit})` - Convert widget list to Stack
- `toWrap({alignment, runAlignment, spacing, runSpacing})` - Convert widget list to Wrap

#### 🎨 Color Extensions
- `withOpacity(double opacity)` - Create color with specified opacity
- `darken([double amount])` - Make color darker using HSL color space (default 10%)
- `lighten([double amount])` - Make color lighter using HSL color space (default 10%)

#### 📐 EdgeInsets Extensions
- `horizontal` - Get total horizontal padding (left + right)
- `vertical` - Get total vertical padding (top + bottom)
- `all` - Get uniform padding value (if all sides are equal)
- `copyWith({left, top, right, bottom})` - Create modified copy of EdgeInsets

### Package Philosophy

This package is part of the **MayR Extensions** family:
- **mayr_dart_extensions** - General Dart extensions (String, int, DateTime, Duration, List, Map, etc.)
- **mayr_flutter_extensions** - Flutter-specific extensions (Widget, BuildContext, etc.)

This separation ensures:
- Pure Dart projects can use general extensions without Flutter dependencies
- Flutter projects can use both packages together for complete functionality
- No code duplication between packages
- Cleaner, more focused codebases

### Features

#### 🧱 BuildContext Extensions
- **Navigation & State Access**: `navigator`, `scaffold`, `form`, `overlay`, `scaffoldMessenger`
- **SnackBar Helper**: `showSnackBar()` for quick snackbar display
- **Media Query**: `mediaQuery`, `widgetSize`, `widgetWidth`, `widgetHeight`, `widgetShortestSide`
- **Theme & Brightness**: `platformBrightness`, `platformInDarkMode`, `platformInLightMode`
- **Device Detection**: `orientation`, `isPortrait`, `isLandscape`, `isPhone`, `isSmallTablet`, `isLargeTablet`, `isTablet`, `isDesktop`

#### 🎨 Widget Extensions
- **Basic Transformations**: `center()`, `expanded()`, `flexible()`, `opacity()`, `sizedBox()`, `constrained()`
- **Padding**: `paddingAll()`, `paddingSymmetric()`, `paddingOnly()`, `paddingZero()`
- **Clipping**: `clipRect()`, `clipRRect()`, `clipRounded()`
- **Positioning**: `positionAlign()`, `positionedFill()`
- **Visibility Helpers**: `showIf()`, `hideIf()`, `showUnless()`, `hideUnless()`

#### 🔘 Tap Interactions
- **InkWellManager**: Helper class for cleaner tap handling
  - `inkWellManager()` - Setup tap handler
  - `onTap()` - Single tap
  - `onDoubleTap()` - Double tap
  - `onLongPress()` - Long press

#### 🖼️ Image Extensions
- `circleAvatar()` - Convert Image to CircleAvatar with customization options

### Changed from Original Package

#### Removed (Now in mayr_dart_extensions)
- Bool extensions (choose, toInt, toYesNo, not)
- String extensions (camelCase, snakeCase, mask, isEmail, etc.)
- Number extensions (clampMin, clampMax, formatAsCurrency, etc.)
- DateTime extensions (addDays, format, toAge, etc.)
- Duration extensions (delay, toReadableString, etc.)
- List/Iterable extensions (firstOrNull, chunked, mapIndexed, etc.)
- Map extensions (getOrNull, mapKeys, merge, etc.)
- Set extensions (toggle, intersects, isSubsetOf, etc.)
- Object extensions (let, also)
- Dynamic extensions (nullOnDebug, maybe, orDefault)
- Humanize extensions (humanizeNumber, humanizeOrdinal, etc.)
- MayrDateTimeFormats utility class

### Migration Guide

If you were using the original `mayr_extensions` package:

1. **Install both packages**:
   ```yaml
   dependencies:
     mayr_dart_extensions: ^1.0.0
     mayr_flutter_extensions: ^1.0.0
   ```

2. **Update imports**:
   ```dart
   // For general Dart extensions
   import 'package:mayr_dart_extensions/mayr_dart_extensions.dart';

   // For Flutter-specific extensions
   import 'package:mayr_flutter_extensions/mayr_flutter_extensions.dart';
   ```

3. **No code changes needed** - All extensions work the same way, they're just in different packages now!

---

For older versions, see the history of the original `mayr_extensions` package.
