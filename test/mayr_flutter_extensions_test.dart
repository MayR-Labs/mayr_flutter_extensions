import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mayr_flutter_extensions/mayr_flutter_extensions.dart';

void main() {
  group('Widget Extensions', () {
    testWidgets('center wraps widget in Center', (tester) async {
      const testWidget = Text('Test');
      final centeredWidget = testWidget.center();

      expect(centeredWidget, isA<Center>());
      expect(centeredWidget.child, equals(testWidget));
    });

    testWidgets('expanded wraps widget in Expanded', (tester) async {
      const testWidget = Text('Test');
      final expandedWidget = testWidget.expanded(2);

      expect(expandedWidget, isA<Expanded>());
      expect(expandedWidget.flex, equals(2));
      expect(expandedWidget.child, equals(testWidget));
    });

    testWidgets('paddingAll adds padding', (tester) async {
      const testWidget = Text('Test');
      final paddedWidget = testWidget.paddingAll(16);

      expect(paddedWidget, isA<Padding>());
      expect((paddedWidget as Padding).padding, equals(const EdgeInsets.all(16)));
    });

    testWidgets('opacity wraps widget in Opacity', (tester) async {
      const testWidget = Text('Test');
      final opacityWidget = testWidget.opacity(0.5);

      expect(opacityWidget, isA<Opacity>());
      expect((opacityWidget as Opacity).opacity, equals(0.5));
    });

    testWidgets('showIf shows widget when condition is true', (tester) async {
      const testWidget = Text('Test');
      final result = testWidget.showIf(true);

      expect(result, equals(testWidget));
    });

    testWidgets('showIf hides widget when condition is false', (tester) async {
      const testWidget = Text('Test');
      final result = testWidget.showIf(false);

      expect(result, isA<SizedBox>());
      expect((result as SizedBox).width, equals(0));
      expect(result.height, equals(0));
    });

    testWidgets('hideIf hides widget when condition is true', (tester) async {
      const testWidget = Text('Test');
      final result = testWidget.hideIf(true);

      expect(result, isA<SizedBox>());
    });

    testWidgets('hideIf shows widget when condition is false', (tester) async {
      const testWidget = Text('Test');
      final result = testWidget.hideIf(false);

      expect(result, equals(testWidget));
    });
  });

  group('BuildContext Extensions', () {
    testWidgets('widgetWidth returns correct width', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              final width = context.widgetWidth;
              expect(width, greaterThan(0));
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('widgetHeight returns correct height', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              final height = context.widgetHeight;
              expect(height, greaterThan(0));
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('isPhone returns correct value', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              final isPhone = context.isPhone;
              expect(isPhone, isA<bool>());
              return Container();
            },
          ),
        ),
      );
    });
  });

  group('Image Extensions', () {
    test('circleAvatar creates CircleAvatar', () {
      const image = NetworkImage('https://example.com/avatar.jpg');
      final widget = Image(image: image);
      final avatar = widget.circleAvatar(radius: 50);

      expect(avatar, isA<CircleAvatar>());
      expect(avatar.radius, equals(50));
    });
  });

  group('InkWellManager', () {
    testWidgets('onTap creates InkWell with tap callback', (tester) async {
      bool tapped = false;
      final widget = const Text('Test').inkWellManager(() {
        tapped = true;
      }).onTap();

      expect(widget, isA<InkWell>());

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));
      await tester.tap(find.text('Test'));

      expect(tapped, isTrue);
    });

    testWidgets('onLongPress creates InkWell with long press callback', (tester) async {
      bool longPressed = false;
      final widget = const Text('Test').inkWellManager(() {
        longPressed = true;
      }).onLongPress();

      expect(widget, isA<InkWell>());

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));
      await tester.longPress(find.text('Test'));

      expect(longPressed, isTrue);
    });
  });
}
