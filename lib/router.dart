import 'package:cristofer_flutter_template/app/modules/home/home_module.dart';
import 'package:cristofer_flutter_template/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeModule());
      default:
        return MaterialPageRoute(builder: (_) => HomeModule());
    }
  }
}
