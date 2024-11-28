import 'package:dartz/dartz.dart';
import 'package:harry_potter_chat_bot/core/error_handler/failure.dart';
import 'package:harry_potter_chat_bot/features/all_chats/domain/entities/chats_entity.dart';
import 'package:harry_potter_chat_bot/features/all_chats/domain/repository/chats_repo.dart';

class ChatsUseCase {
  final ChatsRepo chatsRepo;

  ChatsUseCase({required this.chatsRepo});

  Future<Either<Failure, List<Chats>>> call() async {
    return await chatsRepo.getAllChats();
  }
}

class CreateChatUseCase {
  final CreateChatRepo createChatRepo;

  CreateChatUseCase({required this.createChatRepo});

  Future<Either<Failure, Chats>> call(String chatName) async {
    return await createChatRepo.createChat(chatName);
  }
}
