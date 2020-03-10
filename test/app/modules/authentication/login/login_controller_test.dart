import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:cristofer_flutter_template/app/modules/authentication/login/login_controller.dart';
import 'package:cristofer_flutter_template/app/modules/authentication/login/login_module.dart';

void main() {
  initModule(LoginModule());

  LoginController login;

  setUp(() {
    login = LoginModule.to.get<LoginController>();
  });

  group('LoginController Test', () {
    test("First Test", () {
      expect(login, isInstanceOf<LoginController>());
    });

    test("Set Value", () {
      expect(login.value, equals(0));
      login.increment();
      expect(login.value, equals(1));
    });
  });
}
