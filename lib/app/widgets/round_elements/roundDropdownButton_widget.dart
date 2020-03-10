
import 'package:flutter/material.dart';

import 'round_elements_template_widget.dart';

class RoundDropdownButton extends StatefulWidget {
  final dynamic value;
  final IconData icon;
  final String hintText;
  final String label;
  final Function onChanged;
  final Function validator;
  final List<RoundDropdownButtonModel> items;

  RoundDropdownButton(
      {this.value,
      this.label,
      this.icon,
      this.hintText,
      this.validator,
      this.onChanged,
      this.items});

  @override
  _RoundDropdownButtonState createState() => _RoundDropdownButtonState();
}

class _RoundDropdownButtonState extends State<RoundDropdownButton> {
  dynamic _value;
  bool _hasError = false;
  String _errorMessage = '';
  @override
  Widget build(BuildContext context) {
    return RoundElementsTemplateWidget(
      label: this.widget.label,
      icon: this.widget.icon,
      hasError: _hasError,
      errorMessage: _errorMessage,
      child: DropdownButtonFormField(
        items: this
            .widget
            .items
            .map<DropdownMenuItem<dynamic>>((RoundDropdownButtonModel data) {
          return DropdownMenuItem<dynamic>(
            value: data.value,
            child: Text(data.label),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            _value = newValue;
          });
          this.widget.onChanged(newValue);
        },
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
        value: this.widget.value ?? this._value,
        decoration: InputDecoration(
            hintText: this.widget.hintText,
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey),
            errorStyle: TextStyle(fontSize: 0.0, height: 0.0),
            suffixIcon: Padding(
              child: null,
              padding: EdgeInsetsDirectional.only(end: 05.0),
            )),
      ),
    );
  }
}

class RoundDropdownButtonModel {
  String label;
  dynamic value;

  RoundDropdownButtonModel({this.label, this.value});

  RoundDropdownButtonModel.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['value'] = this.value;
    return data;
  }
}
