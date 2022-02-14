import 'package:dot_messenger/widgets/buttons/social_connect_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Should see label with icon", (WidgetTester tester) async {
    // ARRANGE
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SocialButtonConnect(
            label: "social connect",
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ),
      ),
    );

    // ACT
    final Finder iconFinder = find.byIcon(Icons.account_circle);
    final Finder labelFinder = find.text("social connect");

    // ASSERT
    expect(iconFinder, findsOneWidget);
    expect(labelFinder, findsOneWidget);
  });

  testWidgets("Should on press event called", (WidgetTester tester) async {
    // ARRANGE
    bool onPressedCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SocialButtonConnect(
            label: "social connect",
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              onPressedCalled = true;
            },
          ),
        ),
      ),
    );

    // ACT
    final Finder button = find.byType(ElevatedButton);

    await tester.tap(button);
    await tester.pumpAndSettle();

    // ASSERT
    expect(onPressedCalled, true);
  });
}
