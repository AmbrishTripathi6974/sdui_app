import 'package:flutter_test/flutter_test.dart';
import 'package:sdui_client/main.dart';

void main() {
  testWidgets('Home screen renders title', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Wait for API call
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Verify title from server JSON
    expect(find.text('Welcome to SDUI App'), findsOneWidget);
  });
}
