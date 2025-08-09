part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class Otpsentsuccess extends AuthState {
  final String message;
  Otpsentsuccess(this.message);
}

class OtpsentFailure extends AuthState {
  final String message;
  OtpsentFailure(this.message);
}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final UserEntity user;
  Authenticated(this.user);
}

class UnAuthenticated extends AuthState {}
