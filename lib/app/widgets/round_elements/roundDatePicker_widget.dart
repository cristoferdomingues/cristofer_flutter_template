

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

import 'roundInput_widget.dart';

class RoundDatePicker extends StatefulWidget {
  final dynamic value;
  final IconData icon;
  final String hintText;
  final String label;
  final Function onChanged;
  final Function onConfirm;
  final Function validator;
  final bool autovalidate;
  RoundDatePicker(
      {this.value,
      Key key,
      this.label,
      this.icon = Icons.date_range,
      this.hintText,
      this.validator,
      this.autovalidate,
      this.onChanged,
      this.onConfirm})
      : super(key: key);

  @override
  _RoundDatePickerState createState() => _RoundDatePickerState();
}

class _RoundDatePickerState extends State<RoundDatePicker> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return RoundInput(
      icon: widget.icon,
      hintText: widget.hintText,
      label: widget.label,
      controller: _controller,
      validator: widget.validator,
      onTap: () {
        DatePicker.showDatePicker(context,
            showTitleActions: true,
            theme: DatePickerTheme(
                backgroundColor: Colors.blue,
                itemStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                doneStyle: TextStyle(color: Colors.white, fontSize: 16)),
            onChanged: widget.onChanged, onConfirm: (date) {
          _controller.text = new DateFormat.yMMMd().format(date);
          widget.onConfirm(date);
        }, currentTime: DateTime.now(), locale: LocaleType.en);
      },
    );
  }
}
