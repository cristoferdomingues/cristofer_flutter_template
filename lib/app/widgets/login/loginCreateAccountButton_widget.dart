import 'package:cristofer_flutter_template/app/styles/styles.dart';
import 'package:cristofer_flutter_template/constants.dart';
import 'package:flutter/material.dart';

class CreateAccountButton extends StatefulWidget {
  @override
  _CreateAccountButtonState createState() => _CreateAccountButtonState();
}

class _CreateAccountButtonState extends State<CreateAccountButton> {
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
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.only(left: 20.0),
                  alignment: Alignment.center,
                  child: Text(
                    "DON'T HAVE AN ACCOUNT?",
                    style: TextStyle(color: Styles.primaryColor),
                  ),
                ),
                onPressed: _onCreateAccountPressed),
          ),
        ],
      ),
    );
  }

  _onCreateAccountPressed() {
    Navigator.pushNamed(context, createAccountRoute);
  }
}
