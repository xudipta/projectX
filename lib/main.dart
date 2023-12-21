import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectx/data/repositories/auth_repository.dart';

import 'bloc/bloc/auth_bloc.dart';

/* void main() {
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
 */

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Assuming you have access to the AuthBloc through BlocProvider
            BlocProvider.of<AuthBloc>(context).add(
              SignUpRequested('user@example.com', 'password123'),
            );
          },
          child: Text('Sign Up'),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: MaterialApp(
          title: 'Test Application',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SignUpScreen(), // Display the SignUpScreen as the initial screen
        ),
      ),
    );
  }
}