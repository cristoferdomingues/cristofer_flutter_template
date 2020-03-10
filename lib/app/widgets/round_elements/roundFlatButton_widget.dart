import 'package:cristofer_flutter_template/app/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class RoundFlatButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  RoundFlatButton({this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: FlatButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              splashColor: Styles.primaryColor,
              color: Styles.primaryColor,
              child: new Row(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      this.label,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  new Expanded(
                    child: Container(),
                  ),
                  new Transform.translate(
                    offset: Offset(15.0, 0.0),
                    child: new Container(
                      padding: const EdgeInsets.all(5.0),
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(28.0)),
                        splashColor: Colors.white,
                        color: Colors.white,
                        child: Icon(
                          Icons.card_membership,
                          color: Styles.primaryColor,
                        ),
                        onPressed: () => {},
                      ),
                    ),
                  )
                ],
              ),
              onPressed: this.onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
