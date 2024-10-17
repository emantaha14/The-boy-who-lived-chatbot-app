import 'package:dartz/dartz.dart';
import 'package:harry_potter_chat_bot/core/error_handler/failures.dart';
import 'package:harry_potter_chat_bot/features/signup/data/datasources/signup_datasource.dart';
import 'package:harry_potter_chat_bot/features/signup/domain/entities/signup_entitiy.dart';
import 'package:harry_potter_chat_bot/features/signup/domain/repository/signup_repo.dart';

import '../../../../core/error_handler/error_exception.dart';
import '../../../../core/network/network_info.dart';

class SignupRepoImpl implements SignupRepo {
  SignupDatasource signupDatasource;
  NetworkInfo networkInfo;

  SignupRepoImpl({required this.signupDatasource, required this.networkInfo});

  @override
  Future<Either<Failure, Signup>> signup(
      String username, String password, String fullName, String email) async {
    if (await networkInfo.isConnected) {
      try {
        final signupResponse =
            await signupDatasource.signup(username, password, fullName, email);
        return Right(signupResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
