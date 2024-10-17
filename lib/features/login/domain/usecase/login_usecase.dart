import 'package:dartz/dartz.dart';
import 'package:harry_potter_chat_bot/core/error_handler/failures.dart';
import 'package:harry_potter_chat_bot/features/login/domain/entities/login_entitiy.dart';
import 'package:harry_potter_chat_bot/features/login/domain/repository/login_repo.dart';

class LoginUseCase {
  final LoginRepo loginRepo;

  LoginUseCase({required this.loginRepo});

  Future<Either<Failure, Login>> call(String username, String password) async {
    return await loginRepo.login(username, password);
  }
}
