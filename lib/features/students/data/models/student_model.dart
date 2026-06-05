import '../../domain/entities/student_entity.dart';

class StudentModel extends StudentEntity {
  const StudentModel({
    required super.id,
    required super.name,
    required super.phone,
    required super.groupId,
    required super.gradeLevel,
    required super.email,
    super.supabaseUserId,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
    id: json['id'],
    name: json['name'],
    phone: json['phone'] ?? '',
    groupId: json['group_id'],
    gradeLevel: json['grade_level'] ?? '',
    email: json['email'] ?? '',
    supabaseUserId: json['supabase_user_id'],
  );

  Map<String, dynamic> toMap() => {
    'name': name,
    'phone': phone,
    'group_id': groupId,
    'grade_level': gradeLevel,
    'email': email,
    'supabase_user_id': supabaseUserId,
  };
  factory StudentModel.fromEntity(StudentEntity e) => StudentModel(
    id: e.id,
    name: e.name,
    phone: e.phone,
    groupId: e.groupId,
    gradeLevel: e.gradeLevel,
    email: e.email,
    supabaseUserId: e.supabaseUserId,
  );
}
