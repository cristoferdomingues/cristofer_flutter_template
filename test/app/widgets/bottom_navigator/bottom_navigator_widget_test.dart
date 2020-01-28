import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cristofer_flutter_template/app/widgets/bottom_navigator/bottom_navigator_widget.dart';

main() {
  testWidgets('BottomNavigatorWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(BottomNavigatorWidget()));
    final textFinder = find.text('BottomNavigator');
    expect(textFinder, findsOneWidget);
  });
}
