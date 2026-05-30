import 'package:my_classes/core/constants/backend_endpoints.dart';
import 'package:my_classes/core/errors/exceptions.dart';
import 'package:my_classes/core/services/database_sevice.dart';
import '../models/group_model.dart';

class GroupRemoteDatasource {
  final DatabaseService db;
  GroupRemoteDatasource({required this.db});

  Future<List<GroupModel>> getGroups() async {
    try {
      final data = await db.getData(path: BackendEndpoints.groups);
      return (data as List).map((e) => GroupModel.fromJson(e)).toList();
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  Future<void> addGroup(GroupModel group) async {
    try {
      await db.addData(path: BackendEndpoints.groups, data: group.toMap());
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  Future<void> updateGroup(GroupModel group) async {
    try {
      await db.updateData(
        path: BackendEndpoints.groups,
        documentId: group.id,
        data: group.toMap(),
      );
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  Future<void> deleteGroup(String id) async {
    try {
      await db.deleteData(path: BackendEndpoints.groups, documentId: id);
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }
}
