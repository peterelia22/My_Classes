import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({required super.uId, required super.email});

  factory UserModel.fromSupabaseUser(User user) {
    return UserModel(uId: user.id, email: user.email!);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(uId: json['id'], email: json['email']);
  }

  Map<String, dynamic> toMap() {
    return {'id': uId, 'email': email};
  }
}
