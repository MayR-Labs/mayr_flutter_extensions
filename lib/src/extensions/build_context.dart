part of './../extensions.dart';

extension MayrBuildContextExtensions on BuildContext {
  /// Get the closest [NavigatorState] up the widget tree
  NavigatorState get navigator => Navigator.of(this);

  /// Get the nearest [ScaffoldState] up the widget tree
  ScaffoldState get scaffold => Scaffold.of(this);

  /// Get the nearest [FormState] up the widget tree
  FormState get form => Form.of(this);

  /// Get the nearest [OverlayState] up the widget tree
  OverlayState get overlay => Overlay.of(this);
}

extension MayrContextNavigationExtensions on BuildContext {
  /// Push a new page onto the navigation stack.
  ///
  /// Example:
  /// ```dart
  /// context.push(MyPage());
  /// ```
  Future<T?> push<T>(Widget page) => Navigator.of(this).push<T>(
    MaterialPageRoute(builder: (_) => page),
  );

  /// Pop the current page from the navigation stack.
  ///
  /// Example:
  /// ```dart
  /// context.pop();
  /// context.pop('result'); // Pass result back
  /// ```
  void pop<T>([T? result]) => Navigator.of(this).pop(result);

  /// Replace the current page with a new one.
  ///
  /// Example:
  /// ```dart
  /// context.pushReplacement(NewPage());
  /// ```
  Future<T?> pushReplacement<T, TO>(Widget page) =>
      Navigator.of(this).pushReplacement<T, TO>(
        MaterialPageRoute(builder: (_) => page),
      );

  /// Push a named route.
  ///
  /// Example:
  /// ```dart
  /// context.pushNamed('/home');
  /// ```
  Future<T?> pushNamed<T>(String route, {Object? arguments}) =>
      Navigator.of(this).pushNamed<T>(route, arguments: arguments);
}

extension MayrContextThemeExtensions on BuildContext {
  /// Get the current theme.
  ThemeData get theme => Theme.of(this);

  /// Get the primary color from the theme.
  Color get primaryColor => theme.primaryColor;

  /// Get the color scheme from the theme.
  ColorScheme get colorScheme => theme.colorScheme;

  /// Get the text theme from the theme.
  TextTheme get textTheme => theme.textTheme;

  /// Check if the current theme is in dark mode.
  bool get isDarkMode => theme.brightness == Brightness.dark;
}

extension MayrContextScaffoldMessengerExtensions on BuildContext {
  /// Get the nearest scaffold messenger
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  /// Helper function for showing snackbar
  void showSnackBar(
    String content, {
    Duration? duration,
    SnackBarBehavior behavior = SnackBarBehavior.fixed,
  }) => scaffoldMessenger.showSnackBar(
    SnackBar(
      content: Text(content),
      duration: duration ?? const Duration(seconds: 4),
      behavior: behavior,
    ),
  );
}

extension MayrContextMediaQueryExtensions on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  // Size

  Size get widgetSize => mediaQuery.size;

  double get widgetWidth => widgetSize.width;

  double get widgetHeight => widgetSize.height;

  /// Get screen width (alias for widgetWidth for clarity)
  double get screenWidth => widgetWidth;

  /// Get screen height (alias for widgetHeight for clarity)
  double get screenHeight => widgetHeight;

  /// Get padding (safe area insets)
  EdgeInsets get padding => mediaQuery.padding;

  /// Get view insets (keyboard, etc.)
  EdgeInsets get viewInsets => mediaQuery.viewInsets;

  /// Get device pixel ratio
  double get devicePixelRatio => mediaQuery.devicePixelRatio;

  // Brightness

  Brightness get platformBrightness => mediaQuery.platformBrightness;

  bool get platformInDarkMode => platformBrightness == Brightness.dark;
  bool get platformInLightMode => platformBrightness == Brightness.light;
}

extension MayrContextMediaQueryOrientationExtensions on BuildContext {
  Orientation get orientation => mediaQuery.orientation;

  /// check if device is on landscape mode
  bool get isLandscape => orientation == Orientation.landscape;

  /// check if device is on portrait mode
  bool get isPortrait => orientation == Orientation.portrait;

  /// get the shortestSide from screen
  double get widgetShortestSide => widgetSize.shortestSide;

  /// True if the shortestSide is smaller than 600p
  bool get isPhone => widgetShortestSide < 600;

  /// True if the shortestSide is largest than 600p
  bool get isSmallTablet => widgetShortestSide >= 600;

  /// True if the shortestSide is largest than 720p
  bool get isLargeTablet => widgetShortestSide >= 720;

  /// True if the current device is Tablet
  bool get isTablet => isSmallTablet || isLargeTablet;

  /// True if current device is Desktop
  bool get isDesktop => widgetShortestSide >= 1200;
}

extension MayrContextPlatformExtensions on BuildContext {
  /// Check if the platform is iOS
  bool get isIOS => Theme.of(this).platform == TargetPlatform.iOS;

  /// Check if the platform is Android
  bool get isAndroid => Theme.of(this).platform == TargetPlatform.android;

  /// Check if the platform is Web
  bool get isWeb => Theme.of(this).platform == TargetPlatform.fuchsia ||
      Theme.of(this).platform == TargetPlatform.linux ||
      Theme.of(this).platform == TargetPlatform.macOS ||
      Theme.of(this).platform == TargetPlatform.windows;
}

extension MayrContextDialogExtensions on BuildContext {
  /// Show a custom dialog.
  ///
  /// Example:
  /// ```dart
  /// context.showCustomDialog(AlertDialog(title: Text('Hello')));
  /// ```
  Future<T?> showCustomDialog<T>(Widget dialog) => showDialog<T>(
    context: this,
    builder: (_) => dialog,
  );

  /// Show a modal bottom sheet.
  ///
  /// Example:
  /// ```dart
  /// context.showModalBottomSheet(Container(child: Text('Sheet')));
  /// ```
  Future<T?> showModalBottomSheet<T>(Widget content) =>
      showModalBottomSheet<T>(
        context: this,
        builder: (_) => content,
      );
}
