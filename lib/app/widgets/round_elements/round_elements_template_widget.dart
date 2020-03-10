import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundElementsTemplateWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final Widget child;
  final bool hasError;
  final String errorMessage;
  RoundElementsTemplateWidget(
      {Key key,
      this.child,
      this.label,
      this.icon,
      this.hasError = false,
      this.errorMessage = ''});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Row(
            children: <Widget>[
              Text(
                label,
                style: TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor(),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Row(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                child: Icon(
                  icon,
                  color: Colors.grey,
                ),
              ),
              Container(
                height: 30.0,
                width: 1.0,
                color: borderColor(),
                margin: const EdgeInsets.only(left: 00.0, right: 10.0),
              ),
              new Expanded(
                child: this.child,
              ),
            ],
          ),
        ),
        renderErrorMessage()
      ],
    );
  }

  Color borderColor() {
    return !this.hasError
        ? Colors.grey.withOpacity(0.5)
        : Colors.red.withOpacity(0.5);
  }

  Widget renderErrorMessage() {
    if (this.hasError) {
      return Padding(
        padding: const EdgeInsets.only(left: 40.0),
        child: Text(
          this.errorMessage,
          style: TextStyle(color: Colors.red, fontSize: 10.0),
        ),
      );
    } else {
      return IgnorePointer();
    }
  }
}
