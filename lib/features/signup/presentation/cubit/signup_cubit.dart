import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_potter_chat_bot/core/error_handler/failure.dart';
import 'package:harry_potter_chat_bot/features/signup/domain/entities/signup_entitiy.dart';
import 'package:harry_potter_chat_bot/features/signup/domain/usecase/signup_usecase.dart';

import '../../../../core/constants/constants.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupUseCase signupUseCase;

  SignupCubit({required this.signupUseCase}) : super(SignupInitial());

  void signup(
      String username, String password, String fullName, String email) async {
    emit(SignupLoading());
    final signupOfFailure =
        await signupUseCase.call(username, password, fullName, email);
    signupOfFailure.fold(
      (failure) {
        emit(SignupError(failure: failure));
      },
      (signupResponse) {
        emit(SignupSuccess(signupResponse: signupResponse));
      },
    );
  }
}
