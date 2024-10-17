import 'package:dartz/dartz.dart';
import 'package:harry_potter_chat_bot/core/error_handler/failures.dart';
import 'package:harry_potter_chat_bot/features/signup/domain/entities/signup_entitiy.dart';
import 'package:harry_potter_chat_bot/features/signup/domain/repository/signup_repo.dart';

class SignupUseCase {
  final SignupRepo signupRepo;

  SignupUseCase({required this.signupRepo});

  Future<Either<Failure, Signup>> call(
      String username, String password, String fullName, String email) async {
    return await signupRepo.signup(username, password, fullName, email);
  }
}
