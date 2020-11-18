import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class TodoModel extends Equatable {
  const TodoModel({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.createdTime,
    @required this.checked,
  });

  final int id;
  final String title;
  final String description;
  final DateTime createdTime;
  final bool checked;

  TodoModel copyWith({
    int id,
    String title,
    String description,
    DateTime createdTime,
    bool checked,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdTime: createdTime ?? this.createdTime,
      checked: checked ?? this.checked,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      title,
      description,
      createdTime,
      checked,
    ];
  }
}
