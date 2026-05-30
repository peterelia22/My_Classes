import 'package:dartz/dartz.dart';
import 'package:my_classes/core/errors/failures.dart';
import '../entities/group_entity.dart';

abstract class GroupRepo {
  Future<Either<Failure, List<GroupEntity>>> getGroups();
  Future<Either<Failure, void>> addGroup(GroupEntity group);
  Future<Either<Failure, void>> updateGroup(GroupEntity group);
  Future<Either<Failure, void>> deleteGroup(String id);
}
