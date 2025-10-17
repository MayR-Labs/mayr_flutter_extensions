part of './../extensions.dart';

extension MayrDurationExtensions on Duration {
  /// Execute a callback after this duration.
  ///
  /// Example:
  /// ```dart
  /// Duration(seconds: 2).delay(() => print('Delayed!'));
  /// ```
  Future<void> delay(VoidCallback callback) async {
    await Future.delayed(this);
    callback();
  }
}
