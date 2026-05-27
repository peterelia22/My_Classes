import 'package:dartz/dartz.dart';
import 'package:my_classes/core/errors/failures.dart';
import 'package:my_classes/features/auth/login/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signInWithEmail(
    String email,
    String password,
  );

  Future<Either<Failure, void>> resetPassword(String email);

  Future<Either<Failure, void>> signOut();
}
