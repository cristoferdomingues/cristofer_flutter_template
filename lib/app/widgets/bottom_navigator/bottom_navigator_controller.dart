import 'package:mobx/mobx.dart';

part 'bottom_navigator_controller.g.dart';

class BottomNavigatorController = _BottomNavigatorBase
    with _$BottomNavigatorController;

abstract class _BottomNavigatorBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
