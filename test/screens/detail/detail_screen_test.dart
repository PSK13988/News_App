import 'package:flutter_test/flutter_test.dart';
import 'package:styli/screens/detail/detail_screen.dart';

import '../root_widget.dart';

void main() {
  testWidgets('News Detail Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(RootWidget(widget: DetailScreen(news: news)));
    expect(find.text('News Detail'), findsNWidgets(2));
    expect(find.text('News description'), findsOneWidget);
  });
}
