import 'package:cristofer_flutter_template/constants.dart';
import 'package:flutter/material.dart';
import '../router.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Router.generateRoute,
      initialRoute: homeRoute,
    );
  }
}
