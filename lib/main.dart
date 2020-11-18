import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/app/auth/bloc/auth_bloc.dart';
import 'package:test_app/app/auth/pages/login_page.dart';
import 'injector/injecotr.dart';

main() {
  initAppDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TestApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AuthBloc>(
        create: (context) => GetIt.I<AuthBloc>(),
        child: LoginPage(),
      ),
    );
  }
}
