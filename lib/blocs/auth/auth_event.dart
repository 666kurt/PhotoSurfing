part of 'auth_bloc.dart';

// Базовое событие
abstract class AuthEvent {
  const AuthEvent();
}

// Событие входа
class AuthSignInEvent extends AuthEvent {
  final String email;
  final String password;

  AuthSignInEvent(this.email, this.password);
}

// Событие регистрации
class AuthSignUpEvent extends AuthEvent {
  final String email;
  final String password;

  AuthSignUpEvent(this.email, this.password);
}

// Событие выхода
class AuthSignOutEvent extends AuthEvent {}
