part of 'chats_cubit.dart';

@immutable
sealed class ChatsState {}

final class ChatsInitial extends ChatsState {}

final class ChatsLoadedState extends ChatsState {
  final List<Chats> chatsResponse;
  ChatsLoadedState({required this.chatsResponse});
}

final class ChatsErrorState extends ChatsState {
  final String errorMessage;
  ChatsErrorState({required this.errorMessage});
}

final class ChatsLoadingState extends ChatsState {

}
