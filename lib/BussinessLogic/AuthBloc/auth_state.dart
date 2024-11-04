abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSignedIn extends AuthState {
  final bool successfully;
  AuthSignedIn({required this.successfully});
}

class AuthSignedUp extends AuthState {
  final bool successfully;
  AuthSignedUp({required this.successfully });
}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}