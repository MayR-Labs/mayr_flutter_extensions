part of './../extensions.dart';

extension MayrStringExtensions on String {
  /// Converts this string to a [Text] widget.
  ///
  /// Example:
  /// ```dart
  /// 'Hello World'.toText(style: TextStyle(fontSize: 20));
  /// ```
  Text toText({TextStyle? style}) => Text(this, style: style);

  /// Converts this string to a [SelectableText] widget.
  ///
  /// Example:
  /// ```dart
  /// 'Selectable text'.toSelectableText();
  /// ```
  SelectableText toSelectableText({TextStyle? style}) =>
      SelectableText(this, style: style);
}
