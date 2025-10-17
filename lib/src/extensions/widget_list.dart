part of './../extensions.dart';

extension MayrWidgetListExtensions on List<Widget> {
  /// Converts this list of widgets to a [Column].
  ///
  /// Example:
  /// ```dart
  /// [Text('A'), Text('B')].toColumn(mainAxisAlignment: MainAxisAlignment.center);
  /// ```
  Column toColumn({
    MainAxisAlignment? mainAxisAlignment,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  }) => Column(
    mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
    mainAxisSize: mainAxisSize,
    crossAxisAlignment: crossAxisAlignment,
    children: this,
  );

  /// Converts this list of widgets to a [Row].
  ///
  /// Example:
  /// ```dart
  /// [Text('A'), Text('B')].toRow(mainAxisAlignment: MainAxisAlignment.spaceEvenly);
  /// ```
  Row toRow({
    MainAxisAlignment? mainAxisAlignment,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  }) => Row(
    mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
    mainAxisSize: mainAxisSize,
    crossAxisAlignment: crossAxisAlignment,
    children: this,
  );

  /// Converts this list of widgets to a [Stack].
  ///
  /// Example:
  /// ```dart
  /// [Container(), Text('Overlay')].toStack(alignment: Alignment.center);
  /// ```
  Stack toStack({
    AlignmentGeometry alignment = AlignmentDirectional.topStart,
    StackFit fit = StackFit.loose,
  }) => Stack(alignment: alignment, fit: fit, children: this);

  /// Converts this list of widgets to a [Wrap].
  ///
  /// Example:
  /// ```dart
  /// [Chip(label: Text('A')), Chip(label: Text('B'))].toWrap();
  /// ```
  Wrap toWrap({
    WrapAlignment alignment = WrapAlignment.start,
    WrapAlignment runAlignment = WrapAlignment.start,
    double spacing = 0.0,
    double runSpacing = 0.0,
  }) => Wrap(
    alignment: alignment,
    runAlignment: runAlignment,
    spacing: spacing,
    runSpacing: runSpacing,
    children: this,
  );
}
