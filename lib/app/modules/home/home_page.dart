import 'package:cristofer_flutter_template/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

final homeController = HomeController();

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Observer(
              builder: (BuildContext context) {
                return Text('${homeController.value}',
                    style: Theme.of(context).textTheme.display1);
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: homeController.increment,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ));
  }
}
