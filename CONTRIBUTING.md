# Contributing to MayR Flutter Extensions

Thank you for your interest in contributing to **mayr_flutter_extensions**! We welcome contributions from the community and appreciate your help in making this package better.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [How to Contribute](#how-to-contribute)
- [Development Guidelines](#development-guidelines)
- [Pull Request Process](#pull-request-process)
- [Style Guide](#style-guide)
- [Testing](#testing)
- [Questions?](#questions)

## 🤝 Code of Conduct

By participating in this project, you agree to maintain a respectful and inclusive environment for all contributors. Please be kind, professional, and considerate in all interactions.

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK ^3.7.0
- Git
- A code editor (VS Code, Android Studio, IntelliJ, etc.)

### Setting Up Your Development Environment

1. **Fork the repository** on GitHub
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/mayr_flutter_extensions.git
   cd mayr_flutter_extensions
   ```
3. **Install dependencies**:
   ```bash
   flutter pub get
   ```
4. **Create a new branch** for your feature or bugfix:
   ```bash
   git checkout -b feature/your-feature-name
   ```

## 💡 How to Contribute

### Reporting Bugs

If you find a bug, please create an issue with:
- A clear, descriptive title
- Steps to reproduce the issue
- Expected behavior vs actual behavior
- Flutter and Dart version information
- Any relevant code snippets or error messages

### Suggesting Features

We love new ideas! To suggest a feature:
- Check if the feature already exists or has been requested
- Create an issue with a clear description of the feature
- Explain the use case and why it would be valuable
- **Important:** Only suggest Flutter-specific extensions (not general Dart extensions)

### Pull Requests

We actively welcome your pull requests!

## 🛠️ Development Guidelines

### Flutter-Specific Extensions Only

This package focuses **exclusively on Flutter-specific extensions**. General Dart extensions belong in the companion package [mayr_dart_extensions](https://pub.dev/packages/mayr_dart_extensions).

#### ✅ Appropriate for This Package:
- Extensions on `Widget`, `BuildContext`, `TextStyle`, `ThemeData`
- Flutter UI/UX utilities
- Flutter-specific helpers (e.g., `InkWellManager`)

#### ❌ Not Appropriate (Use mayr_dart_extensions):
- Extensions on `String`, `int`, `DateTime`, `Duration`
- Extensions on `List`, `Map`, `Set`
- General Dart utilities without Flutter dependencies

### File Organization

```
lib/
├── mayr_flutter_extensions.dart        # Main export file
└── src/
    ├── extensions.dart                 # Extension imports
    └── extensions/
        ├── build_context.dart          # BuildContext extensions
        ├── widget.dart                 # Widget extensions
        ├── image_widget.dart           # Image extensions
        ├── text_widget.dart            # Text extensions
        ├── text_style.dart             # TextStyle extensions
        ├── stateless_widget.dart       # StatelessWidget extensions
        └── utils/
            └── inkwell_manager.dart    # Helper classes
```

## 📝 Style Guide

### Code Style

- Follow the [Effective Dart](https://dart.dev/guides/language/effective-dart) style guide
- Use `dart format .` to format your code before committing
- Run `dart analyze .` to check for issues
- Keep methods focused and single-purpose (SRP)

### Documentation

- Add comprehensive dartdoc comments for all public APIs
- Include usage examples in documentation
- Use clear, concise language
- Document all parameters and return values

Example:
```dart
/// Returns the width of the widget associated with this [BuildContext].
///
/// This is a convenience getter that accesses [MediaQuery.of(context).size.width].
///
/// Example:
/// ```dart
/// final width = context.widgetWidth;
/// print('Widget width: $width');
/// ```
double get widgetWidth => mediaQuery.size.width;
```

### Naming Conventions

- Use descriptive, clear names
- Extensions should be prefixed with `Mayr` (e.g., `MayrWidgetExtensions`)
- Boolean getters should start with `is` or `has`
- Methods that return a modified widget should be verbs (e.g., `center()`, `expanded()`)

## 🧪 Testing

### Writing Tests

- All new features **must** include tests
- Tests should be placed in the `test/` directory mirroring the `lib/` structure
- Use descriptive test names
- Test edge cases and error conditions

Example test structure:
```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mayr_flutter_extensions/mayr_flutter_extensions.dart';

void main() {
  group('BuildContext Extensions', () {
    testWidgets('widgetWidth returns correct width', (tester) async {
      // Test implementation
    });
  });
}
```

### Running Tests

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/extensions/widget_test.dart

# Run with coverage
flutter test --coverage
```

## 🔄 Pull Request Process

1. **Update Documentation**: Ensure README and dartdocs are updated
2. **Add Tests**: Include tests for new functionality
3. **Run Quality Checks**:
   ```bash
   flutter test
   dart format .
   dart analyze .
   ```
4. **Commit Your Changes**:
   ```bash
   git add .
   git commit -m "feat: add new extension for X"
   ```
   - Use [Conventional Commits](https://www.conventionalcommits.org/) format
   - Common prefixes: `feat:`, `fix:`, `docs:`, `test:`, `refactor:`
5. **Push to Your Fork**:
   ```bash
   git push origin feature/your-feature-name
   ```
6. **Create Pull Request** on GitHub with:
   - Clear title describing the change
   - Description of what was changed and why
   - Link to any relevant issues
   - Screenshots if UI-related

### Review Process

- Maintainers will review your PR
- Address any requested changes
- Once approved, your PR will be merged

## ❓ Questions?

If you have questions:
- Check existing [issues](https://github.com/MayR-Labs/mayr_flutter_extensions/issues)
- Create a new issue with the "question" label
- Reach out to the maintainers

## 📜 License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing to MayR Flutter Extensions! 🎉

Made with ❤️ by the [MayR Labs](https://mayrlabs.com) community
