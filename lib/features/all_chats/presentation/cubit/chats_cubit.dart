import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_potter_chat_bot/core/error_handler/failure.dart';
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
        emit(ChatsErrorState(failure: failure));
      },
      (chatsResponse) {
        emit(ChatsLoadedState(chatsResponse: chatsResponse));
      },
    );
  }

  int _selectedIndex = -1;

  void changeSelectedIndex(int index) {
    _selectedIndex = index;
    emit(ChatsIndexChangedState(
      selectedIndex: _selectedIndex,
    ));
  }

  int get selectedIndex => _selectedIndex;
}

class CreateChatCubit extends Cubit<ChatsState> {
  final CreateChatUseCase createChatUseCase;

  CreateChatCubit({required this.createChatUseCase}) : super(ChatsInitial());

  void createChat(String chatName) async {
    emit(ChatsLoadingState());
    final createChatOrFailure = await createChatUseCase.call(chatName);
    createChatOrFailure.fold(
      (failure) {
        emit(CreateChatsErrorState(failure: failure));
      },
      (createChatResponse) {
        emit(CreateChatSuccessState(createChatResponse: createChatResponse));
      },
    );
  }
}
