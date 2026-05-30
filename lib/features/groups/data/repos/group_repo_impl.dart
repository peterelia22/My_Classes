import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:my_classes/core/errors/exceptions.dart';
import 'package:my_classes/core/errors/failures.dart';
import 'package:my_classes/core/network/network_info.dart';
import 'package:my_classes/features/groups/data/datasources/group_local_datasource.dart';
import 'package:my_classes/features/groups/data/datasources/group_remote_datasource.dart';
import 'package:my_classes/features/groups/data/models/group_isar_model.dart';
import 'package:my_classes/features/groups/data/models/group_model.dart';
import 'package:my_classes/features/groups/domain/entities/group_entity.dart';
import 'package:my_classes/features/groups/domain/repos/group_repo.dart';
import 'package:uuid/uuid.dart';

class GroupRepoImpl implements GroupRepo {
  final GroupRemoteDatasource remote;
  final GroupLocalDatasource local;
  final NetworkInfo network;

  GroupRepoImpl({
    required this.remote,
    required this.local,
    required this.network,
  });

  @override
  Future<Either<Failure, List<GroupEntity>>> getGroups() async {
    try {
      if (await network.isConnected) {
        final groups = await remote.getGroups();
        final isarGroups = groups
            .map((e) => GroupIsarModel.fromEntity(e, isSynced: true))
            .toList();
        await local.saveGroups(isarGroups);
        return Right(groups);
      } else {
        final localGroups = await local.getGroups();
        return Right(localGroups.map((e) => e.toEntity()).toList());
      }
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return Left(ServerFailure('لا يوجد اتصال بالإنترنت'));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ أثناء تحميل المجموعات'));
    }
  }

  @override
  Future<Either<Failure, void>> addGroup(GroupEntity group) async {
    try {
      final isarModel = GroupIsarModel.fromEntity(group, isSynced: false)
        ..remoteId = const Uuid().v4();

      await local.saveGroup(isarModel);

      if (await network.isConnected) {
        final remoteModel = GroupModel.fromEntity(
          group,
          id: isarModel.remoteId,
        );
        await remote.addGroup(remoteModel);
        isarModel.isSynced = true;
        await local.saveGroup(isarModel);
      }

      return const Right(null);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return Left(
        ServerFailure('تم الحفظ محلياً وسيتم المزامنة عند عودة الإنترنت'),
      );
    } catch (e) {
      return Left(ServerFailure('حدث خطأ أثناء إضافة المجموعة'));
    }
  }

  @override
  Future<Either<Failure, void>> updateGroup(GroupEntity group) async {
    try {
      final isarModel = GroupIsarModel.fromEntity(group, isSynced: false);
      await local.updateGroup(isarModel);

      if (await network.isConnected) {
        await remote.updateGroup(GroupModel.fromEntity(group, id: group.id));
        isarModel.isSynced = true;
        await local.updateGroup(isarModel);
      }

      return const Right(null);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return Left(
        ServerFailure('تم التعديل محلياً وسيتم المزامنة عند عودة الإنترنت'),
      );
    } catch (e) {
      return Left(ServerFailure('حدث خطأ أثناء تعديل المجموعة'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteGroup(String id) async {
    try {
      await local.deleteGroup(id);

      if (await network.isConnected) {
        await remote.deleteGroup(id);
      }

      return const Right(null);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return Left(
        ServerFailure('تم الحذف محلياً وسيتم المزامنة عند عودة الإنترنت'),
      );
    } catch (e) {
      return Left(ServerFailure('حدث خطأ أثناء حذف المجموعة'));
    }
  }
}
