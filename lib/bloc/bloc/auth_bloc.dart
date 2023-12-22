import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/repositories/auth_repository.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(UnAuthenticated()) {
    on<SignUpRequested>(_onSignUpRequested);
  }

  void _onSignUpRequested(
      SignUpRequested event, Emitter<AuthState> emit) async {
    emit(Loading());
    try {
      await authRepository.signUp(email: event.email, password: event.password);
      // Add any additional logic here after successful sign-up if needed
      emit(
          Authenticated()); // Change to an appropriate state after successful sign-up
    } catch (e) {
      emit(
          UnAuthenticated()); // Change to an appropriate state in case of failure
    }
  }
}
