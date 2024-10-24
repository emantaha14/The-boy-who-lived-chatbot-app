import 'package:dartz/dartz.dart';
import 'package:harry_potter_chat_bot/core/error_handler/failures.dart';
import 'package:harry_potter_chat_bot/features/all_chats/domain/entities/chats_entity.dart';
import 'package:harry_potter_chat_bot/features/all_chats/domain/repository/chats_repo.dart';

class ChatsUseCase {
  final ChatsRepo chatsRepo;

  ChatsUseCase({required this.chatsRepo});

  Future<Either<Failure, List<Chats>>> call() async{
    return await chatsRepo.getAllChats();
  }
}
