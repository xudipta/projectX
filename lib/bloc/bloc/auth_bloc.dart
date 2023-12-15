import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/repositories/auth_repository.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(UnAuthenticated()) {
    on<SignUpRequested>((event, state) async {
      emit(Loading());
      try {
        authRepository.signUp(email: event.email, password: event.password);
      } catch (e) {
        emit(UnAuthenticated());
      }
    });
  }
}
