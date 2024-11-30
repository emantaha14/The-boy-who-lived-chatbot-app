import 'package:harry_potter_chat_bot/features/all_chats/data/model/chats_model.dart';
import '../../../../core/error_handler/error_exception.dart';
import '../../../../core/networking/api_services.dart';

abstract class ChatsDataSource {
  Future<List<ChatsModel>> getAllChats();
}

abstract class CreateChatDataSource {
  Future<ChatsModel> createChat(String chatName);
}

class ChatsDataSourceImpl implements ChatsDataSource {
  @override
  Future<List<ChatsModel>> getAllChats() async {
    const baseUrl = "http://20.90.179.54:8000/chats";
    final response = await ApiServices.getData(
      urll: baseUrl,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> chats = response.data;
      final chatsResponse = chats
          .map(
            (chat) => ChatsModel.fromJson(chat),
          )
          .toList();

      return chatsResponse;
    } else {
      throw ServerException();
    }
  }
}

class CreateChatDataSourceImpl implements CreateChatDataSource {
  @override
  Future<ChatsModel> createChat(String chatName) async {
    const baseUrl = "http://20.90.179.54:8000/chats/create";
    final response = await ApiServices.postData(urll: baseUrl, data: {
      "name": chatName,
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      final createChatResponse = ChatsModel.fromJson(response.data);

      return createChatResponse;
    } else {
      throw ServerException();
    }
  }
}
