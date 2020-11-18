import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

const String token_key = 'TEST_APP_TOKEN_KEY';
enum AuthState { LOOGED_IN, LOGGED_OUT }

@injectable
class AuthStore {
  //For now the init value is LOGGED_OUT but we should read it from SharedPreferences or DB
  final BehaviorSubject<AuthState> _controller =
      BehaviorSubject<AuthState>.seeded(AuthState.LOGGED_OUT);

  void save(String token) {
    // ignore: todo
    // TODO _sharedPreferences.setString(token_key, token);
    _controller.add(AuthState.LOOGED_IN);
  }

  Stream<AuthState> observeUserAuthState() {
    return _controller.stream;
  }
}
