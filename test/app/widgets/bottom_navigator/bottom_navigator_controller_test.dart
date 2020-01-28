import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:cristofer_flutter_template/app/widgets/bottom_navigator/bottom_navigator_controller.dart';
import 'package:cristofer_flutter_template/app/app_module.dart';

void main() {
  initModule(AppModule());
  BottomNavigatorController bottomnavigator;

  setUp(() {
    bottomnavigator = AppModule.to.bloc<BottomNavigatorController>();
  });

  group('BottomNavigatorController Test', () {
    test("First Test", () {
      expect(bottomnavigator, isInstanceOf<BottomNavigatorController>());
    });

    test("Set Value", () {
      expect(bottomnavigator.value, equals(0));
      bottomnavigator.increment();
      expect(bottomnavigator.value, equals(1));
    });
  });
}
