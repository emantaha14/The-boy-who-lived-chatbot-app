import 'package:harry_potter_chat_bot/features/all_chats/domain/entities/chats_entity.dart';

class ChatsModel extends Chats {
  ChatsModel(
      {required super.name,
      required super.createdAt,
      required super.updatedAt,
      required super.id,
      required super.sessionId,
      required super.userId});


  factory ChatsModel.fromJson(Map<String, dynamic> json) => ChatsModel(
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        id: json["id"],
        sessionId: json["session_id"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "id": id,
        "session_id": sessionId,
        "user_id": userId,
      };
}
