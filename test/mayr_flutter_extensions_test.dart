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
      expect(
        (paddedWidget as Padding).padding,
        equals(const EdgeInsets.all(16)),
      );
    });

    testWidgets('opacity wraps widget in Opacity', (tester) async {
      const testWidget = Text('Test');
      final opacityWidget = testWidget.opacity(0.5);

      expect(opacityWidget, isA<Opacity>());
      expect((opacityWidget).opacity, equals(0.5));
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
      expect((result as SizedBox).width, equals(0.0));
      expect(result.height, equals(0.0));
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
      final widget =
          const Text('Test').inkWellManager(() {
            tapped = true;
          }).onTap();

      expect(widget, isA<InkWell>());

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));
      await tester.tap(find.text('Test'));

      expect(tapped, isTrue);
    });

    testWidgets('onLongPress creates InkWell with long press callback', (
      tester,
    ) async {
      bool longPressed = false;
      final widget =
          const Text('Test').inkWellManager(() {
            longPressed = true;
          }).onLongPress();

      expect(widget, isA<InkWell>());

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));
      await tester.longPress(find.text('Test'));

      expect(longPressed, isTrue);
    });
  });

  group('New Widget Extensions - Positioning', () {
    testWidgets('positioned wraps widget in Positioned', (tester) async {
      const testWidget = Text('Test');
      final positionedWidget = testWidget.positioned(top: 10, left: 20);

      expect(positionedWidget, isA<Positioned>());
      expect(positionedWidget.top, equals(10));
      expect(positionedWidget.left, equals(20));
    });
  });

  group('New Widget Extensions - Sizing', () {
    testWidgets('aspectRatio wraps widget in AspectRatio', (tester) async {
      const testWidget = Text('Test');
      final aspectWidget = testWidget.aspectRatio(16 / 9);

      expect(aspectWidget, isA<AspectRatio>());
      expect(aspectWidget.aspectRatio, equals(16 / 9));
    });

    testWidgets('fractionallySizedBox wraps widget', (tester) async {
      const testWidget = Text('Test');
      final fractionalWidget =
          testWidget.fractionallySizedBox(widthFactor: 0.5, heightFactor: 0.8);

      expect(fractionalWidget, isA<FractionallySizedBox>());
      expect(fractionalWidget.widthFactor, equals(0.5));
      expect(fractionalWidget.heightFactor, equals(0.8));
    });
  });

  group('New Widget Extensions - Styling', () {
    testWidgets('decorated wraps widget in DecoratedBox', (tester) async {
      const testWidget = Text('Test');
      const decoration = BoxDecoration(color: Colors.blue);
      final decoratedWidget = testWidget.decorated(decoration);

      expect(decoratedWidget, isA<DecoratedBox>());
      expect(decoratedWidget.decoration, equals(decoration));
    });

    testWidgets('card wraps widget in Card', (tester) async {
      const testWidget = Text('Test');
      final cardWidget = testWidget.card(elevation: 4.0);

      expect(cardWidget, isA<Card>());
      expect(cardWidget.elevation, equals(4.0));
    });

    testWidgets('clipOval wraps widget in ClipOval', (tester) async {
      const testWidget = Text('Test');
      final clippedWidget = testWidget.clipOval();

      expect(clippedWidget, isA<ClipOval>());
    });
  });

  group('New Widget Extensions - Layout', () {
    testWidgets('scrollable wraps widget in SingleChildScrollView',
        (tester) async {
      const testWidget = Text('Test');
      final scrollableWidget = testWidget.scrollable();

      expect(scrollableWidget, isA<SingleChildScrollView>());
    });

    testWidgets('safeArea wraps widget in SafeArea', (tester) async {
      const testWidget = Text('Test');
      final safeWidget = testWidget.safeArea(top: true, bottom: true);

      expect(safeWidget, isA<SafeArea>());
      expect(safeWidget.top, equals(true));
      expect(safeWidget.bottom, equals(true));
    });

    testWidgets('fittedBox wraps widget in FittedBox', (tester) async {
      const testWidget = Text('Test');
      final fittedWidget = testWidget.fittedBox(fit: BoxFit.cover);

      expect(fittedWidget, isA<FittedBox>());
      expect(fittedWidget.fit, equals(BoxFit.cover));
    });
  });

  group('New Widget Extensions - Effects', () {
    testWidgets('hero wraps widget in Hero', (tester) async {
      const testWidget = Text('Test');
      final heroWidget = testWidget.hero('testTag');

      expect(heroWidget, isA<Hero>());
      expect(heroWidget.tag, equals('testTag'));
    });

    testWidgets('rotated wraps widget in RotatedBox', (tester) async {
      const testWidget = Text('Test');
      final rotatedWidget = testWidget.rotated(1);

      expect(rotatedWidget, isA<RotatedBox>());
      expect(rotatedWidget.quarterTurns, equals(1));
    });

    testWidgets('transform wraps widget in Transform', (tester) async {
      const testWidget = Text('Test');
      final matrix = Matrix4.rotationZ(0.5);
      final transformedWidget = testWidget.transform(matrix);

      expect(transformedWidget, isA<Transform>());
    });
  });

  group('New Widget Extensions - Gesture', () {
    testWidgets('gestureDetector wraps widget in GestureDetector',
        (tester) async {
      bool tapped = false;
      const testWidget = Text('Test');
      final gestureWidget = testWidget.gestureDetector(onTap: () {
        tapped = true;
      });

      expect(gestureWidget, isA<GestureDetector>());

      await tester.pumpWidget(MaterialApp(home: gestureWidget));
      await tester.tap(find.text('Test'));

      expect(tapped, isTrue);
    });

    testWidgets('dismissible wraps widget in Dismissible', (tester) async {
      const testWidget = Text('Test');
      final dismissibleWidget =
          testWidget.dismissible(const Key('test'), direction: DismissDirection.endToStart);

      expect(dismissibleWidget, isA<Dismissible>());
      expect(dismissibleWidget.key, equals(const Key('test')));
      expect(dismissibleWidget.direction, equals(DismissDirection.endToStart));
    });
  });

  group('String Extensions', () {
    test('toText converts string to Text widget', () {
      const testString = 'Hello World';
      final textWidget = testString.toText();

      expect(textWidget, isA<Text>());
      expect(textWidget.data, equals(testString));
    });

    test('toSelectableText converts string to SelectableText', () {
      const testString = 'Selectable Text';
      final selectableWidget = testString.toSelectableText();

      expect(selectableWidget, isA<SelectableText>());
      expect(selectableWidget.data, equals(testString));
    });
  });

  group('List<Widget> Extensions', () {
    test('toColumn converts list to Column', () {
      final widgets = [const Text('A'), const Text('B')];
      final column = widgets.toColumn(mainAxisAlignment: MainAxisAlignment.center);

      expect(column, isA<Column>());
      expect(column.children.length, equals(2));
      expect(column.mainAxisAlignment, equals(MainAxisAlignment.center));
    });

    test('toRow converts list to Row', () {
      final widgets = [const Text('A'), const Text('B')];
      final row = widgets.toRow(mainAxisAlignment: MainAxisAlignment.spaceEvenly);

      expect(row, isA<Row>());
      expect(row.children.length, equals(2));
      expect(row.mainAxisAlignment, equals(MainAxisAlignment.spaceEvenly));
    });

    test('toStack converts list to Stack', () {
      final widgets = [Container(), const Text('Overlay')];
      final stack = widgets.toStack(alignment: Alignment.center);

      expect(stack, isA<Stack>());
      expect(stack.children.length, equals(2));
      expect(stack.alignment, equals(Alignment.center));
    });

    test('toWrap converts list to Wrap', () {
      final widgets = [
        const Chip(label: Text('A')),
        const Chip(label: Text('B')),
      ];
      final wrap = widgets.toWrap(alignment: WrapAlignment.center);

      expect(wrap, isA<Wrap>());
      expect(wrap.children.length, equals(2));
      expect(wrap.alignment, equals(WrapAlignment.center));
    });
  });

  group('Color Extensions', () {
    test('withOpacity creates color with opacity', () {
      const color = Colors.blue;
      final opaqueColor = color.withOpacity(0.5);

      expect(opaqueColor.alpha, lessThan(color.alpha));
    });

    test('darken makes color darker', () {
      const color = Colors.blue;
      final darkerColor = color.darken(0.2);

      expect(darkerColor, isNot(equals(color)));
    });

    test('lighten makes color lighter', () {
      const color = Colors.blue;
      final lighterColor = color.lighten(0.2);

      expect(lighterColor, isNot(equals(color)));
    });
  });

  group('EdgeInsets Extensions', () {
    test('horizontal returns sum of left and right', () {
      const padding = EdgeInsets.only(left: 10, right: 20);
      expect(padding.horizontal, equals(30));
    });

    test('vertical returns sum of top and bottom', () {
      const padding = EdgeInsets.only(top: 10, bottom: 20);
      expect(padding.vertical, equals(30));
    });

    test('all returns value if all sides are equal', () {
      const padding = EdgeInsets.all(10);
      expect(padding.all, equals(10));
    });

    test('copyWith creates modified copy', () {
      const padding = EdgeInsets.all(10);
      final modified = padding.copyWith(left: 20);

      expect(modified.left, equals(20));
      expect(modified.top, equals(10));
      expect(modified.right, equals(10));
      expect(modified.bottom, equals(10));
    });
  });

  group('Duration Extensions', () {
    test('delay executes callback after duration', () async {
      bool executed = false;
      const duration = Duration(milliseconds: 100);

      await duration.delay(() {
        executed = true;
      });

      expect(executed, isTrue);
    });
  });

  group('BuildContext Extensions - Navigation', () {
    testWidgets('push navigates to new page', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  context.push(const Scaffold(body: Text('New Page')));
                },
                child: const Text('Push'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Push'));
      await tester.pumpAndSettle();

      expect(find.text('New Page'), findsOneWidget);
    });

    testWidgets('pop removes current page', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    context
                        .push(
                          Scaffold(
                            body: Builder(
                              builder: (innerContext) {
                                return ElevatedButton(
                                  onPressed: () => innerContext.pop(),
                                  child: const Text('Pop'),
                                );
                              },
                            ),
                          ),
                        )
                        .then((_) {});
                  },
                  child: const Text('Push First'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Push First'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Pop'));
      await tester.pumpAndSettle();

      expect(find.text('Pop'), findsNothing);
    });
  });

  group('BuildContext Extensions - Theme', () {
    testWidgets('primaryColor returns theme primary color', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(primaryColor: Colors.red),
          home: Builder(
            builder: (context) {
              expect(context.primaryColor, equals(Colors.red));
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('isDarkMode checks theme brightness', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(brightness: Brightness.dark),
          home: Builder(
            builder: (context) {
              expect(context.isDarkMode, isTrue);
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('textTheme returns theme text theme', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              expect(context.textTheme, isA<TextTheme>());
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('colorScheme returns theme color scheme', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              expect(context.colorScheme, isA<ColorScheme>());
              return Container();
            },
          ),
        ),
      );
    });
  });

  group('BuildContext Extensions - MediaQuery', () {
    testWidgets('screenWidth and screenHeight work correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              expect(context.screenWidth, greaterThan(0));
              expect(context.screenHeight, greaterThan(0));
              expect(context.screenWidth, equals(context.widgetWidth));
              expect(context.screenHeight, equals(context.widgetHeight));
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('padding returns EdgeInsets', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              expect(context.padding, isA<EdgeInsets>());
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('viewInsets returns EdgeInsets', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              expect(context.viewInsets, isA<EdgeInsets>());
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('devicePixelRatio returns double', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              expect(context.devicePixelRatio, isA<double>());
              expect(context.devicePixelRatio, greaterThan(0));
              return Container();
            },
          ),
        ),
      );
    });
  });

  group('BuildContext Extensions - Platform', () {
    testWidgets('platform checks return boolean', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              expect(context.isIOS, isA<bool>());
              expect(context.isAndroid, isA<bool>());
              expect(context.isWeb, isA<bool>());
              return Container();
            },
          ),
        ),
      );
    });
  });
}
