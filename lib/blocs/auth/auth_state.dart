part of 'auth_bloc.dart';

abstract class AuthState {
  const AuthState();
}

// Начальное состояние
class AuthInitialState extends AuthState {}

// Состояние загрузки чего-либо
class AuthLoadingState extends AuthState {}

// Состояние, когда пользователь аутентифицирован
class AuthAuthenticatedState extends AuthState {
  final String email;

  AuthAuthenticatedState(this.email);
}

// Состояние ошибки
class AuthErrorState extends AuthState {
  final String message;

  AuthErrorState(this.message);
}

// Состояние, когда пользователь не аутентифицирован
class AuthUnauthenticatedState extends AuthState {}
