import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Data/Repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<SignInEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final signIn = await authRepository.signIn(event.email, event.password);
        emit(AuthSignedIn(successfully: signIn));
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });

    on<SignUpEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final signUp=await authRepository.signUp(event.email, event.password, event.userData);
        emit(AuthSignedUp(successfully: signUp));
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });
  }
}