import 'package:injectable/injectable.dart';

import 'auth_data_source.dart';
import 'auth_store.dart';

@singleton
class AuthRepository {
  final AuthDataSource _authDataSource;
  final AuthStore _authStore;

  AuthRepository(this._authDataSource, this._authStore);

  Future<void> signup(String username, String password) async {
    (await _authDataSource.signup(
      username,
      password,
    ))
        .getOrThrow();
    await login(username, password);
  }

  Future<void> login(String username, String password) async {
    final String token = (await _authDataSource.login(
      username,
      password,
    ))
        .getOrThrow();
    _authStore.save(token);
  }

  Stream<AuthState> observeUserState() => _authStore.observeUserAuthState();
}
