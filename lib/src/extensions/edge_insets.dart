part of './../extensions.dart';

extension MayrEdgeInsetsExtensions on EdgeInsets {
  /// Get the total horizontal padding (left + right).
  ///
  /// Example:
  /// ```dart
  /// EdgeInsets.all(10).horizontal; // Returns 20.0
  /// ```
  double get horizontal => left + right;

  /// Get the total vertical padding (top + bottom).
  ///
  /// Example:
  /// ```dart
  /// EdgeInsets.all(10).vertical; // Returns 20.0
  /// ```
  double get vertical => top + bottom;

  /// Get the total padding on all sides (if equal, returns that value).
  ///
  /// Example:
  /// ```dart
  /// EdgeInsets.all(10).all; // Returns 10.0
  /// ```
  double get all => left == right && right == top && top == bottom ? left : 0.0;

  /// Copy with modifications.
  ///
  /// Example:
  /// ```dart
  /// EdgeInsets.all(10).copyWith(left: 20); // EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10)
  /// ```
  EdgeInsets copyWith({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) => EdgeInsets.only(
    left: left ?? this.left,
    top: top ?? this.top,
    right: right ?? this.right,
    bottom: bottom ?? this.bottom,
  );
}
