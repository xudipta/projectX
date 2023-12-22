import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectx/data/repositories/auth_repository.dart';
import '../../bloc/bloc/auth_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(authRepository: AuthRepository()),
      child: SignUpScreenContent(),
    );
  }
}

class SignUpScreenContent extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignUpScreenContent({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTextField(_emailController, 'Email', Icons.email),
              const SizedBox(height: 16.0),
              _buildTextField(_passwordController, 'Password', Icons.lock,
                  obscureText: true),
              const SizedBox(height: 16.0),
              BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                return ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) {
                        switch (state.runtimeType) {
                          case Authenticated:
                            return Colors.green;
                          case UnAuthenticated:
                            return Colors.red;
                          default:
                            return Colors.grey;
                        }
                      },
                    ),
                  ),
                  onPressed: () {
                    // Dispatch the SignUpRequested event when the button is pressed
                    BlocProvider.of<AuthBloc>(context).add(
                      SignUpRequested(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    );
                  },
                  child: const Text('Sign Up'),
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon,
      {bool obscureText = false}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
