import 'package:flutter/material.dart';
import 'package:my_classes/core/theme/app_colors.dart';
import 'package:my_classes/core/theme/app_text_styles.dart';
import 'package:my_classes/features/students/domain/entities/student_entity.dart';
import 'student_card.dart';

class StudentsViewBody extends StatelessWidget {
  final List<StudentEntity> students;
  const StudentsViewBody({super.key, required this.students});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (students.isEmpty)
              Expanded(
                child: Center(
                  child: Text(
                    'لا يوجد طلاب بعد',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondaryColor,
                    ),
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.only(bottom: 120),
                  itemCount: students.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (_, index) =>
                      StudentCard(student: students[index]),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
