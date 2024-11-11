part of 'chats_cubit.dart';

@immutable
sealed class ChatsState {}

final class ChatsInitial extends ChatsState {}

final class ChatsLoadedState extends ChatsState {
  final List<Chats> chatsResponse;

  ChatsLoadedState({required this.chatsResponse});
}

final class ChatsErrorState extends ChatsState {
  final Failure failure;

  ChatsErrorState({required this.failure});
}

final class ChatsLoadingState extends ChatsState {}

final class CreateChatSuccessState extends ChatsState {
  final Chats createChatResponse;

  CreateChatSuccessState({required this.createChatResponse});
}

final class CreateChatsErrorState extends ChatsState {
  final Failure failure;

  CreateChatsErrorState({required this.failure});
}
