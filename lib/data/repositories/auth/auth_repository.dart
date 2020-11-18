import 'package:injectable/injectable.dart';
import 'package:test_app/core/models/collector.dart';
import 'package:test_app/data/models/todo_model.dart';

import 'auth_data_source.dart';
import 'auth_store.dart';

@singleton
class AuthRepository {
  final AuthDataSource _authDataSource;
  final AuthStore _authStore;

  AuthRepository(this._authDataSource, this._authStore);

  Future<void> login(String username, String password) async {
    try {
      await Future.delayed(Duration(milliseconds: 100));
      if (_authStore.isExist(User(username, password)) == false) {
        throw Exception();
      }
      _authStore.getUser(User(username, password));
    } catch (_) {
      throw TodoException('Not Valid Credential');
    }
  }

  Future<void> signup(String username, String password) async {
    await Future.delayed(Duration(milliseconds: 100));
    try {
      if (_authStore.isExist(User(username, password))) {
        throw Exception();
      }
      _authStore.addUser(User(username, password));
    } catch (_) {
      throw TodoException('User Already Exist');
    }
  }

  List<TodoModel> todos() {
    return _authStore.loggedUserTodos;
  }

  Stream<AuthState> observeUserState() => _authStore.observeUserAuthState();

  void refreshUserData(List<TodoModel> models) {
    _authStore.refreshUserData(models);
  }
}
