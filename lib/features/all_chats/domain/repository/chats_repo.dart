import 'package:dartz/dartz.dart';
import 'package:harry_potter_chat_bot/features/all_chats/domain/entities/chats_entity.dart';

import '../../../../core/error_handler/failures.dart';

abstract class ChatsRepo {
  Future<Either<Failure, List<Chats>>> getAllChats();
}
