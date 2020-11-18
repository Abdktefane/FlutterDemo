import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/app/auth/bloc/auth_bloc.dart';
import 'package:test_app/app/todo/bloc/bloc/todos_bloc.dart';
import 'package:test_app/app/todo/pages/TodoPage.dart';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestApp'),
      ),
      body: Center(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => GetIt.I<TodosBloc>()),
            BlocProvider(create: (context) => GetIt.I<AuthBloc>()),
          ],
          child: TodosPage(),
        ),
      ),
    );
  }
}
