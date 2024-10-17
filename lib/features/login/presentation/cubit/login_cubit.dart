import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_potter_chat_bot/features/login/domain/entities/login_entitiy.dart';
import 'package:harry_potter_chat_bot/features/login/domain/usecase/login_usecase.dart';

import '../../../../core/constants/constants.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase}) : super(LoginInitial());

  void login(String username, String password) async {
    emit(LoginLoading());
    final loginOrFailure = await loginUseCase.call(username, password);
    loginOrFailure.fold(
      (failure) {
        emit(LoginError(errorMessage: mapFailureToMessage(failure)));
      },
      (loginResponse) {
        emit(LoginSuccess(loginResponse: loginResponse));
      },
    );
  }
}
