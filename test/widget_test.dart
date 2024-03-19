// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:ingenio_test/injection_container.dart';

import 'package:ingenio_test/main.dart';

void main() {
  testWidgets('List of Team members test', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    await initializeDependencies();
    await tester.pumpWidget(const MyApp());

    await Future.delayed(const Duration(seconds: 4));

    // Perform actions after the delay
    //await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Assert results
    expect(find.text('Stephen Brandon'), findsOneWidget);
    expect(find.text(''), findsNothing);
  });
}
