# GitHub Copilot Agent Instructions

This directory contains instructions for GitHub Copilot agents working on this repository.

## Flutter Package Structure

This is a Flutter package that provides Flutter-specific extension methods. The package works in conjunction with `mayr_dart_extensions` which provides general Dart extensions.

### Key Guidelines

- **Flutter-Only Focus**: This package should only contain extensions specific to Flutter SDK (widgets, BuildContext, etc.)
- **Dart Extensions**: General Dart type extensions (String, int, DateTime, Duration, etc.) belong in `mayr_dart_extensions`
- **No Duplication**: Do not add extensions that duplicate functionality from `mayr_dart_extensions`

### Testing Requirements

- All extension methods must have corresponding tests
- Run `flutter test` to execute tests
- Use `dart format .` to format code
- Use `dart analyze .` to check for issues

### Code Style

- Follow the existing code patterns in the package
- Use descriptive method names
- Add comprehensive dartdoc comments with examples
- Keep methods focused and single-purpose

### Related Packages

- **mayr_dart_extensions**: General Dart extensions (https://pub.dev/packages/mayr_dart_extensions)
- Users typically install both packages together in Flutter apps
