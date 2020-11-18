part of 'todos_bloc.dart';

abstract class TodosState {
  const TodosState();
}

class TodosLoadingState extends TodosState {}

class TodosLoadedState extends TodosState {
  TodosLoadedState(this.todoList);

  final List<TodoModel> todoList;
}
