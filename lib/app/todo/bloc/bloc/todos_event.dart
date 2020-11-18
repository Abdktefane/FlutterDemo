part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class TodosInitialEvent extends TodosEvent {}

class TodosUpdateEvent extends TodosEvent {
  final TodoModel todo;

  TodosUpdateEvent(this.todo);
}
