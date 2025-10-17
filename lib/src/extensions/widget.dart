part of './../extensions.dart';

extension MayrWidgetExtensions on Widget {
  /// Wraps this widget in a [Center] widget.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').center();
  /// ```
  Center center({double? heightFactor, double? widthFactor}) =>
      Center(heightFactor: heightFactor, widthFactor: widthFactor, child: this);

  /// Wraps this widget in an [Expanded] widget.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').expanded(2); // Takes 2x the space of other expanded widgets
  /// ```
  Expanded expanded([int flex = 1]) => Expanded(flex: flex, child: this);

  /// Wraps this widget in a [Flexible] widget.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').flexible(flex: 2, fit: FlexFit.tight);
  /// ```
  Flexible flexible({int flex = 1, FlexFit fit = FlexFit.loose}) =>
      Flexible(flex: 1, fit: fit, child: this);

  /// Wraps this widget with an [InkWellManager] for touch interactions.
  ///
  /// Example:
  /// ```dart
  /// Text('Click me').inkWellManager(() => print('Tapped!'));
  /// ```
  InkWellManager inkWellManager(
    void Function()? callback, {
    Color color = Colors.transparent,
  }) => InkWellManager(this, callback, color: color);

  /// Wraps this widget in an [Opacity] widget.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').opacity(0.5); // Makes text semi-transparent
  /// ```
  Opacity opacity(double opacity) => Opacity(opacity: opacity, child: this);

  /// Wraps this widget in a [SizedBox] with optional width and height.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').sizedBox(width: 100, height: 50);
  /// ```
  Widget sizedBox({double? width, double? height}) =>
      SizedBox(height: height, width: width, child: this);

  /// Wraps this widget in a [ConstrainedBox] with optional constraints.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').constrained(maxWidth: 200, minHeight: 50);
  /// ```
  Widget constrained({
    double? maxHeight,
    double? maxWidth,
    double? minHeight,
    double? minWidth,
  }) => ConstrainedBox(
    constraints: BoxConstraints(
      maxHeight: maxHeight ?? double.infinity,
      maxWidth: maxWidth ?? double.infinity,
      minHeight: minHeight ?? 0,
      minWidth: minWidth ?? 0,
    ),
    child: this,
  );

  /// Wraps this widget in an [AspectRatio] widget.
  ///
  /// Example:
  /// ```dart
  /// Container().aspectRatio(16 / 9);
  /// ```
  AspectRatio aspectRatio(double ratio) =>
      AspectRatio(aspectRatio: ratio, child: this);

  /// Wraps this widget in a [FractionallySizedBox] widget.
  ///
  /// Example:
  /// ```dart
  /// Container().fractionallySizedBox(widthFactor: 0.5, heightFactor: 0.8);
  /// ```
  FractionallySizedBox fractionallySizedBox({
    double? widthFactor,
    double? heightFactor,
  }) => FractionallySizedBox(
    widthFactor: widthFactor,
    heightFactor: heightFactor,
    child: this,
  );
}

extension MayrWidgetClipExtensions on Widget {
  /// Wraps this widget in a [ClipRect] widget.
  ///
  /// Example:
  /// ```dart
  /// Image.network('url').clipRect();
  /// ```
  ClipRect clipRect() => ClipRect(child: this);

  /// Wraps this widget in a [ClipRRect] widget with custom border radius.
  ///
  /// Example:
  /// ```dart
  /// Image.network('url').clipRRect(BorderRadius.circular(20));
  /// ```
  ClipRRect clipRRect(BorderRadiusGeometry borderRadius) =>
      ClipRRect(borderRadius: borderRadius, child: this);

  /// Wraps this widget in a [ClipRRect] widget with circular border radius.
  ///
  /// Example:
  /// ```dart
  /// Image.network('url').clipRounded(15); // 15 pixel radius
  /// ```
  ClipRRect clipRounded([double radius = 12]) =>
      clipRRect(BorderRadius.circular(radius));

  /// Wraps this widget in a [ClipOval] widget.
  ///
  /// Example:
  /// ```dart
  /// Image.network('url').clipOval();
  /// ```
  ClipOval clipOval() => ClipOval(child: this);
}

extension MayrWidgetStylingExtensions on Widget {
  /// Wraps this widget in a [DecoratedBox] widget.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').decorated(BoxDecoration(color: Colors.blue));
  /// ```
  DecoratedBox decorated(BoxDecoration decoration) =>
      DecoratedBox(decoration: decoration, child: this);

  /// Wraps this widget in a [Card] widget.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').card(elevation: 4.0);
  /// ```
  Card card({double? elevation, ShapeBorder? shape}) =>
      Card(elevation: elevation, shape: shape, child: this);
}

extension MayrWidgetPaddingExtensions on Widget {
  /// Wraps this widget in a [Padding] widget with equal padding on all sides.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').paddingAll(16.0);
  /// ```
  Widget paddingAll(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);

  /// Wraps this widget in a [Padding] widget with symmetric padding.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').paddingSymmetric(horizontal: 20, vertical: 10);
  /// ```
  Widget paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: this,
      );

  /// Wraps this widget in a [Padding] widget with specific padding on each side.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').paddingOnly(left: 10, top: 5, right: 10, bottom: 5);
  /// ```
  Widget paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) => Padding(
    padding: EdgeInsets.only(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
    ),
    child: this,
  );

  /// Wraps this widget in a [Padding] widget with zero padding.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').paddingZero();
  /// ```
  Widget paddingZero() => Padding(padding: EdgeInsets.zero, child: this);
}

extension MayrWidgetPositionExtensions on Widget {
  /// Wraps this widget in an [Align] widget with the specified alignment.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').positionAlign(Alignment.topLeft);
  /// ```
  Align positionAlign(AlignmentGeometry alignment) =>
      Align(alignment: alignment, child: this);

  /// Wraps this widget in a [Positioned.fill] widget.
  ///
  /// Example:
  /// ```dart
  /// Container().positionedFill();
  /// ```
  Positioned positionedFill() => Positioned.fill(child: this);

  /// Wraps this widget in a [Positioned] widget with optional positioning.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').positioned(top: 10, left: 20);
  /// ```
  Positioned positioned({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) => Positioned(
    top: top,
    bottom: bottom,
    left: left,
    right: right,
    child: this,
  );
}

extension MayrWidgetVisibilityExtensions on Widget {
  /// Hides this widget if the [condition] is true, otherwise shows it.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').hideIf(isHidden);
  /// ```
  Widget hideIf(bool condition) => showIf(!condition);

  /// Hides this widget unless the [condition] is true.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').hideUnless(isVisible);
  /// ```
  Widget hideUnless(bool condition) => showIf(condition);

  /// Shows this widget if the [condition] is true, otherwise hides it.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').showIf(isVisible);
  /// ```
  Widget showIf(bool condition) => condition ? this : const SizedBox.shrink();

  /// Shows this widget unless the [condition] is true.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').showUnless(isHidden);
  /// ```
  Widget showUnless(bool condition) => showIf(!condition);
}

extension MayrWidgetLayoutExtensions on Widget {
  /// Wraps this widget in a [SingleChildScrollView] widget.
  ///
  /// Example:
  /// ```dart
  /// Column(children: [...]).scrollable();
  /// ```
  SingleChildScrollView scrollable({Axis direction = Axis.vertical}) =>
      SingleChildScrollView(scrollDirection: direction, child: this);

  /// Wraps this widget in a [SafeArea] widget.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').safeArea(top: true, bottom: true);
  /// ```
  SafeArea safeArea({bool top = true, bool bottom = true}) =>
      SafeArea(top: top, bottom: bottom, child: this);

  /// Wraps this widget in a [FittedBox] widget.
  ///
  /// Example:
  /// ```dart
  /// Image.network('url').fittedBox(fit: BoxFit.cover);
  /// ```
  FittedBox fittedBox({BoxFit fit = BoxFit.contain}) =>
      FittedBox(fit: fit, child: this);
}

extension MayrWidgetEffectsExtensions on Widget {
  /// Wraps this widget in a [Hero] widget.
  ///
  /// Example:
  /// ```dart
  /// Image.network('url').hero('imageHero');
  /// ```
  Hero hero(String tag) => Hero(tag: tag, child: this);

  /// Wraps this widget in a [RotatedBox] widget.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').rotated(1); // Rotates 90 degrees
  /// ```
  RotatedBox rotated(int quarterTurns) =>
      RotatedBox(quarterTurns: quarterTurns, child: this);

  /// Wraps this widget in a [Transform] widget.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').transform(Matrix4.rotationZ(0.5));
  /// ```
  Transform transform(Matrix4 transform) =>
      Transform(transform: transform, child: this);
}

extension MayrWidgetGestureExtensions on Widget {
  /// Wraps this widget in a [GestureDetector] widget.
  ///
  /// Example:
  /// ```dart
  /// Text('Tap me').gestureDetector(onTap: () => print('Tapped!'));
  /// ```
  GestureDetector gestureDetector({
    VoidCallback? onTap,
    VoidCallback? onDoubleTap,
  }) => GestureDetector(onTap: onTap, onDoubleTap: onDoubleTap, child: this);

  /// Wraps this widget in a [Dismissible] widget.
  ///
  /// Example:
  /// ```dart
  /// Text('Swipe me').dismissible(key: Key('item1'));
  /// ```
  Dismissible dismissible(
    Key key, {
    DismissDirection direction = DismissDirection.horizontal,
  }) => Dismissible(key: key, direction: direction, child: this);
}
