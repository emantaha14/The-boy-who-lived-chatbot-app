import 'package:dartz/dartz.dart';
import 'package:harry_potter_chat_bot/features/login/domain/entities/login_entitiy.dart';
import '../../../../core/error_handler/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, Login>> login(String username, String password);
}
