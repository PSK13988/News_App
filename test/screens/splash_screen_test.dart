import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:styli/configs/app_assets.dart';

import 'package:styli/screens/splash_screen.dart';

import 'root_widget.dart';

void main() {
  testWidgets('Splash Screen loading smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const RootWidget(widget: SplashScreen()));
    await tester.pump();
    expect(find.image(const AssetImage(logo)), findsOneWidget);
  });

  testWidgets('Splash Screen shown and added another screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(const RootWidget(widget: SplashScreen()));
    await tester.pump();
    expect(find.image(const AssetImage(logo)), findsOneWidget);
    await tester.pumpWidget(RootWidget(widget: Scaffold(body: Container())));
    await tester.pump();
    expect(find.image(const AssetImage(logo)), findsNothing);
  });
}
