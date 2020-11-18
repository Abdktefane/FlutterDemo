import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';
import 'package:test_app/app/todo/bloc/bloc/todos_bloc.dart';
import 'package:test_app/data/models/todo_model.dart';

const String token_key = 'TEST_APP_TOKEN_KEY';
enum AuthState { LOOGED_IN, LOGGED_OUT }

@injectable
class AuthStore {
  final BehaviorSubject<AuthState> _controller = BehaviorSubject<AuthState>();

  List<TodoModel> loggedUserTodos;
  User user;

  Stream<AuthState> observeUserAuthState() {
    return _controller.stream;
  }

  bool isExist(User user) => users[user] != null;

  List<TodoModel> getUser(User user) {
    loggedUserTodos = users[user];
    this.user = user;
    _controller.add(AuthState.LOOGED_IN);
    return loggedUserTodos;
  }

  List<TodoModel> addUser(User user) {
    users[user] = getFakeData(user.username);
    this.user = user;
    loggedUserTodos = users[user];
    _controller.add(AuthState.LOOGED_IN);
    return loggedUserTodos;
  }

  void refreshUserData(List<TodoModel> models) {
    users[user] = models;
  }
}

final users = <User, List<TodoModel>>{
  User('user1', 'user1'): [...getFakeData('user1')],
  User('user2', 'user2'): [...getFakeData('user2')],
};

class User extends Equatable {
  final String username;
  final String password;
  User(
    this.username,
    this.password,
  );

  User copyWith({
    String username,
    String password,
  }) {
    return User(
      username ?? this.username,
      password ?? this.password,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        username,
        password,
      ];
}
