import 'package:injectable/injectable.dart';

import '../../data/repositories/auth/auth_repository.dart';
import '../../data/repositories/auth/auth_store.dart';
import '../interactor.dart';

@injectable
class ObserveAuthState extends SubjectInteractor<void, AuthState> {
  ObserveAuthState(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Stream<AuthState> createObservable(void param) {
    return _authRepository.observeUserState();
  }
}
