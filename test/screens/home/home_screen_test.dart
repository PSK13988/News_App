import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:styli/apis/api_service.dart';
import 'package:styli/apis/repository/api_repository.dart';
import 'package:styli/configs/app_assets.dart';
import 'package:styli/screens/home/home_controller.dart';
import 'package:styli/screens/home/home_screen.dart';

import '../root_widget.dart';

void main() {
  testWidgets('Home Screen loading smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const RootWidget(widget: HomeScreen()));
    final controller = Get.put(
      HomeController(
        ApiRepositoryImpl(
          ApiServiceImpl(),
        ),
      ),
    );
    expect(find.text(homeTitle), findsOneWidget);
    controller.news.clear();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
  testWidgets('Home Screen news loaded smoke test',
      (WidgetTester tester) async {
    await tester.pumpWidget(const RootWidget(widget: HomeScreen()));
    final controller = Get.put(
      HomeController(
        ApiRepositoryImpl(
          ApiServiceImpl(),
        ),
      ),
    );
    expect(find.text(homeTitle), findsOneWidget);
    controller.update([news]);
    // await tester.pump();
    // expect(find.byType(GridView), findsOneWidget);
  });
}
