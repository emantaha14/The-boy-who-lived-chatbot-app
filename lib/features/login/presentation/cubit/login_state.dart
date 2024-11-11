part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginError extends LoginState {
  final Failure failure;

  LoginError({required this.failure});
}

final class LoginSuccess extends LoginState {
  final Login loginResponse;

  LoginSuccess({required this.loginResponse});
}

final class LoginLoading extends LoginState {}
