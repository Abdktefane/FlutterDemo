part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent with EquatableMixin {
  final String username;
  final String password;
  LoginEvent({
    @required this.username,
    @required this.password,
  });

  LoginEvent copyWith({
    String username,
    String password,
  }) {
    return LoginEvent(
      username: username ?? this.username,
      password: password ?? this.password,
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

class SignupEvent extends AuthEvent with EquatableMixin {
  final String username;
  final String password;
  SignupEvent({
    @required this.username,
    @required this.password,
  });

  SignupEvent copyWith({
    String username,
    String password,
  }) {
    return SignupEvent(
      username: username ?? this.username,
      password: password ?? this.password,
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

class NewAuthStateEvent extends AuthEvent with EquatableMixin {
  final AuthState authState;
  NewAuthStateEvent({
    @required this.authState,
  });

  NewAuthStateEvent copyWith({
    AuthState authState,
  }) {
    return NewAuthStateEvent(
      authState: authState ?? this.authState,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [authState];
}

class AuthLoadingEvent extends AuthEvent {}
