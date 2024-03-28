

import 'package:dartz/dartz.dart';
import 'package:posts_app_clean_architecture/features/auth/login/domain/entities/login.dart';
import 'package:posts_app_clean_architecture/features/auth/login/domain/repositories/login_repository.dart';
import 'package:posts_app_clean_architecture/resources/error/failures.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, Unit>> call(Login login) async {
    return await repository.login(login);
  }
}
