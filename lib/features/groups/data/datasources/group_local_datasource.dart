import 'package:isar/isar.dart';
import 'package:my_classes/core/services/isar_service.dart';
import '../models/group_isar_model.dart';

class GroupLocalDatasource {
  final IsarService isarService;
  GroupLocalDatasource({required this.isarService});

  Future<List<GroupIsarModel>> getGroups() async {
    return await isarService.isar.groupIsarModels.where().findAll();
  }

  Future<void> saveGroup(GroupIsarModel group) async {
    await isarService.isar.writeTxn(() async {
      await isarService.isar.groupIsarModels.put(group);
    });
  }

  Future<void> saveGroups(List<GroupIsarModel> groups) async {
    await isarService.isar.writeTxn(() async {
      await isarService.isar.groupIsarModels.putAll(groups);
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
    await isarService.isar.writeTxn(() async {
      await isarService.isar.groupIsarModels.put(group);
    });
  }
}
