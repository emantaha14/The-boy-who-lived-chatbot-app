import 'package:harry_potter_chat_bot/features/signup/domain/entities/signup_entitiy.dart';

class SignupResponseModel extends Signup {
  SignupResponseModel(
      {required super.username,
      required super.email,
      required super.fullName,
      required super.password});

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      SignupResponseModel(
        username: json["username"],
        email: json["email"],
        fullName: json["full_name"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "full_name": fullName,
        "password": password,
      };
}
