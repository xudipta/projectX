import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectx/data/repositories/auth_repository.dart';

import 'bloc/bloc/auth_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context)=>AuthRepository(),
      child: BlocProvider(
        create: (context)=>AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context)
        ),
        child: MaterialApp(
          title: 'Test Application',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Container()
        ),
      ),
    );
  }
}
