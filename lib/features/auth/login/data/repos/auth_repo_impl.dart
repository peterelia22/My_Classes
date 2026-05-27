import 'package:dartz/dartz.dart';
import 'package:my_classes/core/errors/exceptions.dart';
import 'package:my_classes/core/errors/failures.dart';
import 'package:my_classes/core/services/supbase_auth_service.dart';
import 'package:my_classes/features/auth/login/data/models/user_model.dart';
import 'package:my_classes/features/auth/login/domain/entities/user_entity.dart';
import 'package:my_classes/features/auth/login/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final SupabaseAuthService supbaseauthService;
  AuthRepoImpl({required this.supbaseauthService});

  @override
  Future<Either<Failure, void>> resetPassword(String email) {
    throw UnimplementedError();
  }

  @override
  @override
  Future<Either<Failure, UserEntity>> signInWithEmail(
    String email,
    String password,
  ) async {
    try {
      final user = await supbaseauthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromSupabaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('يرجى المحاولة مرة أخرى'));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() {
    throw UnimplementedError();
  }
}
