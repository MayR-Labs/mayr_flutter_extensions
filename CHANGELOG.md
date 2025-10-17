# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-01-17

### 🎉 Initial Release

This is the first release of **mayr_flutter_extensions** as a standalone Flutter-specific extension package, separated from the original `mayr_extensions` package.

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
