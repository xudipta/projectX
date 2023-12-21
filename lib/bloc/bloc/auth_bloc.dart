import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/repositories/auth_repository.dart';
part 'auth_event.dart';
part 'auth_state.dart';

/* class AuthBloc extends Bloc<AuthEvent, AuthState> {
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
 */

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(UnAuthenticated());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is SignUpRequested) {
      yield* _mapSignUpRequestedToState(event);
    }
  }

  Stream<AuthState> _mapSignUpRequestedToState(SignUpRequested event) async* {
    yield Loading();
    try {
      await authRepository.signUp(email: event.email, password: event.password);
      // Add any additional logic here after successful sign-up if needed
      yield Authenticated(); // Change to an appropriate state after successful sign-up
    } catch (e) {
      yield UnAuthenticated(); // Change to an appropriate state in case of failure
    }
  }
}