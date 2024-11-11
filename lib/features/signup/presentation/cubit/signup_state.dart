part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupSuccess extends SignupState {
  final Signup signupResponse;

  SignupSuccess({required this.signupResponse});
}

final class SignupError extends SignupState {
  final Failure failure;

  SignupError({required this.failure});
}

final class SignupLoading extends SignupState {}
