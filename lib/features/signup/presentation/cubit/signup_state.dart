part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupSuccess extends SignupState {
  final Signup signupResponse;

  SignupSuccess({required this.signupResponse});
}

final class SignupError extends SignupState {
  final String errorMessage;

  SignupError({required this.errorMessage});
}

final class SignupLoading extends SignupState {}
