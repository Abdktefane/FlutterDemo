import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/core/models/collector.dart';
import '../../../data/repositories/auth/auth_store.dart';
import '../../../domain/interactors/login_interactor.dart';
import '../../../domain/interactors/signup_interactor.dart';
import '../../../domain/observers/observe_user_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthBlocState>
    with Collecter<AuthEvent, AuthBlocState> {
  AuthBloc(
    this._loginInteractor,
    this._signupInteractor,
    this._observeAuthState,
  ) : super(AuthInitial()) {
    _subscription = _observeAuthState.observe().listen((AuthState authState) {
      add(NewAuthStateEvent(authState: authState));
    });
    _observeAuthState(null);
  }

  final LoginInteractor _loginInteractor;

  final SignupInteractor _signupInteractor;

  final ObserveAuthState _observeAuthState;

  StreamSubscription<AuthState> _subscription;

  @override
  Stream<AuthBlocState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is LoginEvent) {
      final stream = _loginInteractor(LoginInteractor.params(
        event.username,
        event.password,
      ));
      collect(stream);
    } else if (event is SignupEvent) {
      final stream = _signupInteractor(SignupInteractor.params(
        event.username,
        event.password,
      ));
      collect(stream);
    } else if (event is AuthLoadingEvent) {
      yield lodingState();
    } else if (event is NewAuthStateEvent) {
      yield NewAuthState(event.authState);
    } else if (event is ErrorEvent) {
      yield ErrorState(event.message);
    }
  }

  void dispose() {
    _subscription.cancel();
  }

  @override
  AuthEvent lodingEvent() => AuthLoadingEvent();

  @override
  AuthBlocState lodingState() => AuthLoadingState();

  @override
  AuthEvent errorEvent(TodoException ex) {
    return ErrorEvent(ex.message);
  }
}
