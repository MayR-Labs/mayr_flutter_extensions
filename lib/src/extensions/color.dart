part of './../extensions.dart';

extension MayrColorExtensions on Color {
  /// Returns a new color with the specified opacity.
  ///
  /// Example:
  /// ```dart
  /// Colors.blue.withOpacity(0.5);
  /// ```
  Color withOpacity(double opacity) => Color.fromRGBO(red, green, blue, opacity);

  /// Darken the color by a given amount (0.0 to 1.0).
  ///
  /// Example:
  /// ```dart
  /// Colors.blue.darken(0.2); // Make it 20% darker
  /// ```
  Color darken([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1, 'Amount must be between 0 and 1');
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  /// Lighten the color by a given amount (0.0 to 1.0).
  ///
  /// Example:
  /// ```dart
  /// Colors.blue.lighten(0.2); // Make it 20% lighter
  /// ```
  Color lighten([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1, 'Amount must be between 0 and 1');
    final hsl = HSLColor.fromColor(this);
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }
}
