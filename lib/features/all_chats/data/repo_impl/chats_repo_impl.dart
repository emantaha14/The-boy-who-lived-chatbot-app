import 'package:dartz/dartz.dart';
import 'package:harry_potter_chat_bot/core/error_handler/error_handler.dart';
import 'package:harry_potter_chat_bot/core/error_handler/failure.dart';
import 'package:harry_potter_chat_bot/features/all_chats/data/datasource/chats_datasource.dart';
import 'package:harry_potter_chat_bot/features/all_chats/domain/entities/chats_entity.dart';
import 'package:harry_potter_chat_bot/features/all_chats/domain/repository/chats_repo.dart';
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
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}

class CreateChatRepoImpl implements CreateChatRepo {
  CreateChatDataSource createChatDataSource;
  NetworkInfo networkInfo;

  CreateChatRepoImpl(
      {required this.createChatDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, Chats>> createChat(String chatName) async {
    if (await networkInfo.isConnected) {
      try {
        final chatsResponse = await createChatDataSource.createChat(chatName);
        return Right(chatsResponse);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
