

import 'package:dartz/dartz.dart';
import 'package:posts_app_clean_architecture/features/auth/login/domain/entities/login.dart';
import 'package:posts_app_clean_architecture/resources/error/failures.dart';

abstract class LoginRepository {
  Future<Either<Failure, Unit>> login(Login login);

}