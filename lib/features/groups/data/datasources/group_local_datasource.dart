import 'package:isar/isar.dart';
import 'package:my_classes/core/services/isar_service.dart';
import '../models/group_isar_model.dart';

class GroupLocalDatasource {
  final IsarService isarService;
  GroupLocalDatasource({required this.isarService});

  Future<void> upsertGroup(GroupIsarModel group) async {
    await isarService.isar.writeTxn(() async {
      await isarService.isar.groupIsarModels.putByRemoteId(group);
    });
  }

  Future<List<GroupIsarModel>> getGroups() async {
    return await isarService.isar.groupIsarModels.where().findAll();
  }

  Future<void> saveGroup(GroupIsarModel group) async {
    await upsertGroup(group);
  }

  Future<void> saveGroups(List<GroupIsarModel> groups) async {
    await isarService.isar.writeTxn(() async {
      for (final group in groups) {
        await isarService.isar.groupIsarModels.putByRemoteId(group);
      }
    });
  }

  Future<void> deleteGroup(String remoteId) async {
    await isarService.isar.writeTxn(() async {
      await isarService.isar.groupIsarModels
          .filter()
          .remoteIdEqualTo(remoteId)
          .deleteFirst();
    });
  }

  Future<List<GroupIsarModel>> getUnsyncedGroups() async {
    return await isarService.isar.groupIsarModels
        .filter()
        .isSyncedEqualTo(false)
        .findAll();
  }

  Future<void> updateGroup(GroupIsarModel group) async {
    await upsertGroup(group);
  }
}
