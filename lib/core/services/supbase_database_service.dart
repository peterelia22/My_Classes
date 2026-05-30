import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../core/errors/exceptions.dart';
import 'database_sevice.dart';

class SupabaseDatabaseService implements DatabaseService {
  final _client = Supabase.instance.client;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    try {
      if (documentId != null) {
        await _client.from(path).upsert({...data, 'id': documentId});
      } else {
        await _client.from(path).insert(data);
      }
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    try {
      if (documentId != null) {
        return await _client.from(path).select().eq('id', documentId).single();
      }
      return await _client.from(path).select();
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  @override
  Future<bool> checksIfDataExists({
    required String path,
    required String documentId,
  }) async {
    try {
      final data = await _client
          .from(path)
          .select()
          .eq('id', documentId)
          .maybeSingle();
      return data != null;
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  @override
  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
    required String documentId,
  }) async {
    try {
      await _client.from(path).update(data).eq('id', documentId);
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  @override
  Future<void> deleteData({
    required String path,
    required String documentId,
  }) async {
    try {
      await _client.from(path).delete().eq('id', documentId);
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  @override
  Stream<List<Map<String, dynamic>>> streamCollection({required String path}) {
    return _client
        .from(path)
        .stream(primaryKey: ['id'])
        .map((data) => data.toList());
  }
}
