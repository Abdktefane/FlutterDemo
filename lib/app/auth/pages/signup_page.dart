import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/app/auth/bloc/auth_bloc.dart';
import 'package:test_app/app/auth/widgets/hyper_auth.dart';

class SignupPage extends StatelessWidget {
  SignupPage({
    Key key,
  }) : super(key: key);
  final TextEditingController _usernameController =
      TextEditingController(text: 'user3');
  final TextEditingController _passwordController =
      TextEditingController(text: 'user3');

  @override
  Widget build(BuildContext context) {
    return HyperAuth(
      _usernameController,
      _passwordController,
      () {
        BlocProvider.of<AuthBloc>(context).add(SignupEvent(
          username: _usernameController.text,
          password: _passwordController.text,
        ));
      },
      isLogin: false,
    );
  }

  static MaterialPageRoute route(BuildContext context) {
    return MaterialPageRoute(
      builder: (BuildContext _) => BlocProvider.value(
        value: context.read<AuthBloc>(),
        child: SignupPage(),
      ),
    );
  }
}
