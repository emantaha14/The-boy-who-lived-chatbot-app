import 'package:dartz/dartz.dart';
import 'package:harry_potter_chat_bot/core/error_handler/failure.dart';
import 'package:harry_potter_chat_bot/features/signup/domain/entities/signup_entitiy.dart';

abstract class SignupRepo {
  Future<Either<Failure, Signup>> signup(
      String username, String password, String fullName, String email);
}
