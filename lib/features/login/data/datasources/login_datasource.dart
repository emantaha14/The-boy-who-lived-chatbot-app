import 'package:harry_potter_chat_bot/core/error_handler/error_exception.dart';
import 'package:harry_potter_chat_bot/core/networking/api_services.dart';
import 'package:harry_potter_chat_bot/features/login/data/model/login_response_model.dart';

abstract class LoginDataSource {
  Future<LoginResponseModel> login(String username, String password);
}

class LoginDataSourceImpl implements LoginDataSource {
  @override
  Future<LoginResponseModel> login(String username, String password) async {
    const baseUrl = "http://20.90.179.54:8000/login";
    final response = await ApiServices.postData(
        urll: baseUrl, data: {"username": username, "password": password});

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('200000000');
      print(response.data);
      final loginResponse = LoginResponseModel.fromJson(response.data);
      return loginResponse;
    } else {
      print('nooooooooooooooooooooo responsssssssssssss');
      throw ServerException();
    }
  }
}
