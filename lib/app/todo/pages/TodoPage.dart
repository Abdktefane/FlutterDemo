import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/app/todo/bloc/bloc/todos_bloc.dart';
import 'package:test_app/app/todo/widgets/todo_dialog.dart';
import 'package:test_app/core/extension/date_time.dart';

class TodosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestApp'),
      ),
      body: BlocBuilder<TodosBloc, TodosState>(
        builder: (context, state) {
          if (state is TodosLoadingState) {
            return CircularProgressIndicator();
          } else if (state is TodosLoadedState) {
            final todos = state.todoList;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (BuildContext context, int index) {
                final todo = todos[index];
                return ListTile(
                    title: Text(todo.title),
                    trailing: Text(todo.createdTime.asString),
                    onTap: () {
                      TodoDialog.show(context, todo);
                    });
              },
            );
          } else {
            throw UnimplementedError();
          }
        },
      ),
    );
  }

  static MaterialPageRoute route() {
    return MaterialPageRoute(
      builder: (BuildContext context) => BlocProvider<TodosBloc>(
        create: (BuildContext _) {
          return GetIt.I<TodosBloc>();
        },
        child: TodosPage(),
      ),
    );
  }
}
