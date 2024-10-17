import 'package:harry_potter_chat_bot/features/login/domain/entities/login_entitiy.dart';

class LoginResponseModel extends Login {
  LoginResponseModel({required super.accessToken, required super.tokenType});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
      };
}
