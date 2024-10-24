import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_potter_chat_bot/core/constants/constants.dart';
import 'package:harry_potter_chat_bot/features/all_chats/domain/usecase/chats_usecase.dart';

import '../../domain/entities/chats_entity.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  final ChatsUseCase chatsUseCase;

  ChatsCubit({required this.chatsUseCase}) : super(ChatsInitial());

  void getAllChats() async {
    emit(ChatsLoadingState());
    final chatsOrFailure = await chatsUseCase.call();
    chatsOrFailure.fold(
      (failure) {
        emit(ChatsErrorState(errorMessage: mapFailureToMessage(failure)));
      },
      (chatsResponse) {
        emit(ChatsLoadedState(chatsResponse: chatsResponse));
      },
    );
  }
}
