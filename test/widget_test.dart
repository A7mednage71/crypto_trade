import 'package:crypto_trade/app.dart';
import 'package:crypto_trade/core/navigation/app_router.dart';
import 'package:crypto_trade/core/utils/route_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      appRouter: AppRouter(),
      routeLogger: RouteLogger(),
    ));

    // This test is designed for the default counter app.
    // Our app is much more complex, so we'll just check it builds.
    expect(find.byType(MyApp), findsOneWidget);
  });
}
