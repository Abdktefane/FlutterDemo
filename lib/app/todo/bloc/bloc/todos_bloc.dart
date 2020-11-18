import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/data/models/todo_model.dart';

part 'todos_event.dart';
part 'todos_state.dart';

@injectable
class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(TodosLoadingState()) {
    initialFakeValue();
  }

  final List<TodoModel> _todoList = <TodoModel>[];
  void initialFakeValue() {
    _todoList.addAll(_getFakeData());
    add(TodosInitialEvent());
  }

  Stream<TodosState> _modifyList(TodoModel todo) async* {
    final int index = _todoList.indexWhere((element) => element.id == todo.id);
    final newModel = _todoList[index].copyWith(
      id: todo.id,
      checked: todo.checked,
      createdTime: todo.createdTime,
      description: todo.description,
      title: todo.title,
    );
    _todoList[index] = newModel;

    yield TodosLoadedState(_todoList);
  }

  @override
  Stream<TodosState> mapEventToState(
    TodosEvent event,
  ) async* {
    if (event is TodosInitialEvent) {
      yield TodosLoadedState(_todoList);
    } else if (event is TodosUpdateEvent) {
      yield* _modifyList(event.todo);
    }
  }
}

List<TodoModel> _getFakeData() => <TodoModel>[
      TodoModel(
        id: 1,
        title: 'title1',
        description: 'description1',
        createdTime: DateTime.now(),
        checked: true,
      ),
      TodoModel(
        id: 2,
        title: 'title2',
        description: 'description2',
        createdTime: DateTime.now(),
        checked: false,
      ),
      TodoModel(
        id: 3,
        title: 'title3',
        description: 'description3',
        createdTime: DateTime.now(),
        checked: true,
      ),
    ];
