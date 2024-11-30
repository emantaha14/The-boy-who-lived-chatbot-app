import 'package:harry_potter_chat_bot/core/error_handler/error_exception.dart';
import 'package:harry_potter_chat_bot/core/networking/api_services.dart';
import 'package:harry_potter_chat_bot/features/signup/data/model/signup_response_model.dart';

abstract class SignupDatasource {
  Future<SignupResponseModel> signup(
      String username, String password, String fullName, String email);
}

class SignupDataSourceImpl implements SignupDatasource {
  @override
  Future<SignupResponseModel> signup(
      String username, String password, String fullName, String email) async {
    const baseUrl = "http://20.90.179.54:8000/register";
    final response = await ApiServices.postData(urll: baseUrl, data: {
      "username": username,
      "password": password,
      "full_name": fullName,
      "email": email,
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      final signupResponse = SignupResponseModel.fromJson(response.data);
      return signupResponse;
    } else {
      throw ServerException();
    }
  }
}
