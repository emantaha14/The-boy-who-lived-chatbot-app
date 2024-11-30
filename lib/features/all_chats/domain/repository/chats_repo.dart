import 'package:dartz/dartz.dart';
import 'package:harry_potter_chat_bot/core/error_handler/failure.dart';
import 'package:harry_potter_chat_bot/features/all_chats/domain/entities/chats_entity.dart';

abstract class ChatsRepo {
  Future<Either<Failure, List<Chats>>> getAllChats();
}

abstract class CreateChatRepo {
  Future<Either<Failure, Chats>> createChat(String chatName);
}
