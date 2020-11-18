part of 'auth_bloc.dart';

abstract class AuthBlocState extends Equatable {
  const AuthBlocState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthBlocState {}

class LoadingState extends AuthBlocState {}

class NewAuthState extends AuthBlocState {
  final AuthState authState;

  NewAuthState(this.authState);
}

class AuthLoadingState extends AuthBlocState {}
