import 'package:dartz/dartz.dart';
import 'package:harry_potter_chat_bot/features/all_chats/data/datasource/chats_datasource.dart';
import 'package:harry_potter_chat_bot/features/all_chats/domain/entities/chats_entity.dart';
import 'package:harry_potter_chat_bot/features/all_chats/domain/repository/chats_repo.dart';

import '../../../../core/error_handler/error_exception.dart';
import '../../../../core/error_handler/failures.dart';
import '../../../../core/network/network_info.dart';

class ChatsRepoImpl implements ChatsRepo {
  ChatsDataSource chatsDataSource;
  NetworkInfo networkInfo;

  ChatsRepoImpl({required this.chatsDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Chats>>> getAllChats() async {
    if (await networkInfo.isConnected) {
      try {
        final chatsResponse = await chatsDataSource.getAllChats();
        return Right(chatsResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
