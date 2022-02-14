import 'package:dot_messenger/widgets/messages/empty_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Should see empty message with icon",
      (WidgetTester tester) async {
    // ARRANGE
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: EmptyListWidget(),
        ),
      ),
    );

    // ACT
    final Finder titleFinder = find.text("It's empty here");
    final Finder iconsFinder = find.byIcon(Icons.info_outline);

    // ASSERT
    expect(titleFinder, findsOneWidget);
    expect(iconsFinder, findsOneWidget);
  });

  testWidgets("Should see custom message with custom icon",
      (WidgetTester tester) async {
    // ARRANGE
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: EmptyListWidget(
            title: "No content",
          ),
        ),
      ),
    );

    // ACT
    final Finder titleFinder = find.text("No content");
    final Finder iconsFinder = find.byIcon(Icons.info_outline);

    // ASSERT
    expect(titleFinder, findsOneWidget);
    expect(iconsFinder, findsOneWidget);
  });

  testWidgets("Should see custom message with icon",
      (WidgetTester tester) async {
    // ARRANGE
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: EmptyListWidget(
            title: "No content",
            icon: Icons.error_outline,
          ),
        ),
      ),
    );

    // ACT
    final Finder titleFinder = find.text("No content");
    final Finder iconsFinder = find.byIcon(Icons.error_outline);

    // ASSERT
    expect(titleFinder, findsOneWidget);
    expect(iconsFinder, findsOneWidget);
  });
}
