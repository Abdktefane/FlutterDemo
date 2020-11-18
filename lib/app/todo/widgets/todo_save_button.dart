import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/app/todo/bloc/bloc/todos_bloc.dart';
import 'package:test_app/core/extension/date_time.dart';
import 'package:test_app/data/models/todo_model.dart';

class TodoButton extends StatelessWidget {
  const TodoButton(
    this._todo,
    this._title,
    this._createdTime,
    this._description, {
    Key key,
    String buttonTitle = 'Save',
  })  : _buttonTitle = buttonTitle,
        super(key: key);

  final String _buttonTitle;
  final TodoModel _todo;
  final TextEditingController _title;
  final TextEditingController _createdTime;
  final TextEditingController _description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: RaisedButton(
          color: Theme.of(context).accentColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {
            final TodoModel newModel = _todo.copyWith(
              title: _title.text,
              createdTime: DateTimeExtension.toDateTime(_createdTime.text),
              description: _description.text,
            );
            final event = TodosUpdateEvent(newModel);
            context.read<TodosBloc>().add(event);
            Navigator.of(context).pop();
          },
          child: Text(_buttonTitle)),
    );
  }
}
