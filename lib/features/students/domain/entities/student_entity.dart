class StudentEntity {
  final String id;
  final String name;
  final String phone;
  final String groupId;
  final String gradeLevel;
  final String email;
  final String? supabaseUserId;

  const StudentEntity({
    required this.id,
    required this.name,
    required this.phone,
    required this.groupId,
    required this.gradeLevel,
    required this.email,
    this.supabaseUserId,
  });
}
