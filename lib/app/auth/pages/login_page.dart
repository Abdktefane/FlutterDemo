import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/app/auth/bloc/auth_bloc.dart';
import 'package:test_app/app/auth/widgets/hyper_auth.dart';
import 'package:test_app/app/auth/widgets/todo_error_dialog.dart';
import 'package:test_app/app/todo/pages/TodoPage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key key,
  }) : super(key: key);

  final TextEditingController _usernameController =
      TextEditingController(text: 'user1');
  final TextEditingController _passwordController =
      TextEditingController(text: 'user1');

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthBlocState>(
      listener: (_, state) {
        if (state is ErrorState) {
          TodoErrorDialog.show(context, state.message);
        } else if (state is NewAuthState) {
          Navigator.of(context).popUntil((route) => route.isFirst);
          Navigator.of(context).push(TodosPage.route());
        }
      },
      child: HyperAuth(
        _usernameController,
        _passwordController,
        () {
          BlocProvider.of<AuthBloc>(context).add(LoginEvent(
            username: _usernameController.text,
            password: _passwordController.text,
          ));
        },
      ),
    );
  }
}
