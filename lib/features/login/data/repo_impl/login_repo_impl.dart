import 'package:dartz/dartz.dart';
import 'package:harry_potter_chat_bot/core/error_handler/error_handler.dart';
import 'package:harry_potter_chat_bot/core/error_handler/failure.dart';
import 'package:harry_potter_chat_bot/features/login/data/datasources/login_datasource.dart';
import 'package:harry_potter_chat_bot/features/login/domain/entities/login_entitiy.dart';
import 'package:harry_potter_chat_bot/features/login/domain/repository/login_repo.dart';
import '../../../../core/network/network_info.dart';

class LoginRepoImpl implements LoginRepo {
  LoginDataSource loginDataSource;
  NetworkInfo networkInfo;

  LoginRepoImpl({required this.loginDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, Login>> login(String username, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final loginResponse = await loginDataSource.login(username, password);
        return Right(loginResponse);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
