import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../data/repositories/auth/auth_repository.dart';
import '../interactor.dart';

@injectable
class SignupInteractor extends Interactor<_Params> {
  SignupInteractor(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<void> doWork(_Params params) {
    return _authRepository.signup(
      params.username,
      params.password,
    );
  }

  static _Params params(String username, String password) => _Params(
        username: username,
        password: password,
      );
}

class _Params extends Equatable {
  final String username;
  final String password;
  _Params({
    @required this.username,
    @required this.password,
  });

  _Params copyWith({
    String username,
    String password,
  }) {
    return _Params(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [username, password];
}
