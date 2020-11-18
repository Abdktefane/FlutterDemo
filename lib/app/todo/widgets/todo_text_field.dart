import 'package:flutter/material.dart';

class TodoTextField extends StatelessWidget {
  final String _label;
  final TextEditingController _controller;
  final double v;
  final double h;

  const TodoTextField(
    this._label,
    this._controller, {
    Key key,
    this.v = 8,
    this.h = 0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: v, horizontal: h),
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
