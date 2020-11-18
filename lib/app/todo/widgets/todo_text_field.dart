import 'package:flutter/material.dart';

class TodoTextField extends StatelessWidget {
  final String _label;
  final TextEditingController _controller;

  const TodoTextField(
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
      ),
    );
  }
}
