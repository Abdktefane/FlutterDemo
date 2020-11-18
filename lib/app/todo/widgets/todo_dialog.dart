import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/app/todo/bloc/bloc/todos_bloc.dart';
import 'package:test_app/app/todo/widgets/todo_date_picker.dart';
import 'package:test_app/app/todo/widgets/todo_save_button.dart';
import 'package:test_app/app/todo/widgets/todo_text_field.dart';
import 'package:test_app/core/extension/date_time.dart';
import 'package:test_app/data/models/todo_model.dart';

class TodoDialog extends StatelessWidget {
  TodoDialog(this._todo, {Key key, String dialogTitle = 'Details'})
      : _dialogTitle = dialogTitle,
        _title = TextEditingController(text: _todo.title),
        _createdTime = TextEditingController(text: _todo.createdTime.asString),
        _description = TextEditingController(text: _todo.description),
        super(key: key);

  final String _dialogTitle;
  final TextEditingController _title;
  final TextEditingController _createdTime;
  final TextEditingController _description;

  final TodoModel _todo;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text(_dialogTitle)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 20,
      content: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TodoTextField('Title', _title),
            TodoTextField('Description', _description),
            TodoDatePicker('Created Time', _createdTime),
            TodoButton(_todo, _title, _createdTime, _description),
          ],
        ),
      ),
    );
  }

  static Future<void> show(BuildContext context, TodoModel todo) async {
    return showGeneralDialog<void>(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, child) {
        final scaleTween = CurveTween(curve: Curves.fastOutSlowIn);
        final sclaeAnimation = scaleTween.animate(a1);
        return ScaleTransition(
          scale: sclaeAnimation,
          child: child,
        );
      },
      transitionDuration: Duration(milliseconds: 250),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (_, animation1, animation2) {
        return BlocProvider.value(
          value: BlocProvider.of<TodosBloc>(context),
          child: TodoDialog(todo),
        );
      },
    );
  }
}
