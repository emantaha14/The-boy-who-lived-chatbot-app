part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginError extends LoginState {
  final String errorMessage;

  LoginError({required this.errorMessage});
}

final class LoginSuccess extends LoginState {
  final Login loginResponse;

  LoginSuccess({required this.loginResponse});
}

final class LoginLoading extends LoginState {}
