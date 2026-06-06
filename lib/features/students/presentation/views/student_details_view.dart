import 'package:flutter/material.dart';
import '../../domain/entities/student_entity.dart';
import 'widgets/student_details/student_details_view_bloc_consumer.dart';

class StudentDetailsView extends StatelessWidget {
  static const String routeName = '/student-details';
  final StudentEntity student;

  const StudentDetailsView({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return StudentDetailsViewBlocConsumer(student: student);
  }
}
