import 'round_elements_template_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoundInput extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  final Function validator;
  final bool obscureText;
  final String initialValue;
  final Function onTap;
  final Function onChanged;
  final TextInputType keyboardType;
  final bool autovalidate;
  RoundInput(
      {Key key,
      this.label,
      this.controller,
      this.icon,
      this.hintText,
      this.validator,
      this.initialValue,
      this.onTap,
      this.onChanged,
      this.obscureText = false,
      this.autovalidate = false,
      this.keyboardType = TextInputType.text})
      : super(key: key);

  @override
  RoundInputState createState() => RoundInputState();
}

class RoundInputState extends State<RoundInput> {
  bool _hasError = false;
  String _errorMessage = '';
  @override
  Widget build(BuildContext context) {
    return RoundElementsTemplateWidget(
        key: this.widget.key,
        label: this.widget.label,
        icon: this.widget.icon,
        hasError: _hasError,
        errorMessage: _errorMessage,
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: this.widget.hintText,
            hintStyle: TextStyle(color: Colors.grey),
            errorStyle: TextStyle(fontSize: 0.0, height: 0.0)
          ),
          controller: this.widget.controller,
          validator: (value) {
            if (this.widget.validator == null) return null;

            String validationResult = this.widget.validator(value);
            if (validationResult != null && validationResult.isNotEmpty) {
              this.setState(() {
                _hasError = true;
                _errorMessage = validationResult;
              });
              return validationResult;
            } else {
              this.setState(() {
                _hasError = false;
                _errorMessage = '';
              });
              return null;
            }
          },
          obscureText: this.widget.obscureText,
          initialValue: this.widget.initialValue,
          onTap: this.widget.onTap,
          onChanged: this.widget.onChanged,
          keyboardType: this.widget.keyboardType,
          autovalidate: this.widget.autovalidate,
        ));
  }
}
