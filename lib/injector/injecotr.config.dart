// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../app/auth/bloc/auth_bloc.dart';
import '../data/repositories/auth/auth_data_source.dart';
import '../data/repositories/auth/auth_repository.dart';
import '../data/repositories/auth/auth_store.dart';
import '../domain/interactors/login_interactor.dart';
import '../domain/observers/observe_user_auth.dart';
import '../domain/interactors/signup_interactor.dart';
import '../app/todo/bloc/bloc/todos_bloc.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<AuthDataSource>(() => AuthDataSource());
  gh.factory<AuthStore>(() => AuthStore());
  gh.factory<TodosBloc>(() => TodosBloc());
  gh.factory<LoginInteractor>(() => LoginInteractor(get<AuthRepository>()));
  gh.factory<ObserveAuthState>(() => ObserveAuthState(get<AuthRepository>()));
  gh.factory<SignupInteractor>(() => SignupInteractor(get<AuthRepository>()));
  gh.factory<AuthBloc>(() => AuthBloc(
        get<LoginInteractor>(),
        get<SignupInteractor>(),
        get<ObserveAuthState>(),
      ));

  // Eager singletons must be registered in the right order
  gh.singleton<AuthRepository>(
      AuthRepository(get<AuthDataSource>(), get<AuthStore>()));
  return get;
}
