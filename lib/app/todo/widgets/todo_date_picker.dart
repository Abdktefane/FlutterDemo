import 'package:flutter/material.dart';
import 'package:test_app/core/extension/date_time.dart';

class TodoDatePicker extends StatelessWidget {
  final String _label;
  final TextEditingController _controller;

  const TodoDatePicker(
    this._label,
    this._controller, {
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          labelText: _label,
          border: const OutlineInputBorder(),
        ),
        controller: _controller,
        onTap: () {
          _selectDate(context);
        },
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
      context: context,
      initialDate: DateTimeExtension.toDateTime(_controller.text),
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
      initialEntryMode: DatePickerEntryMode.input,
    );

    if (newSelectedDate != null) {
      print(newSelectedDate);
      _controller.text = newSelectedDate.asString;
    }
  }
}
