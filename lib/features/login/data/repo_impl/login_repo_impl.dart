import 'package:dartz/dartz.dart';
import 'package:harry_potter_chat_bot/core/error_handler/failures.dart';
import 'package:harry_potter_chat_bot/features/login/data/datasources/login_datasource.dart';
import 'package:harry_potter_chat_bot/features/login/domain/entities/login_entitiy.dart';
import 'package:harry_potter_chat_bot/features/login/domain/repository/login_repo.dart';

import '../../../../core/error_handler/error_exception.dart';
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
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
