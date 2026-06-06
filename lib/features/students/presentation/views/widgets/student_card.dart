import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_classes/core/theme/app_colors.dart';
import 'package:my_classes/core/theme/app_text_styles.dart';
import 'package:my_classes/core/widgets/app_card.dart';
import 'package:my_classes/features/students/domain/entities/student_entity.dart';
import 'package:my_classes/features/students/presentation/cubits/students_cubit.dart';
import '../../../../groups/presentation/cubits/groups_cubit.dart';
import '../student_details_view.dart';

class StudentCard extends StatelessWidget {
  final StudentEntity student;
  const StudentCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          StudentDetailsView.routeName,
          arguments: {
            'student': student,
            'studentsCubit': context.read<StudentsCubit>(),
            'groupsCubit': context.read<GroupsCubit>(),
          },
        );
      },
      child: AppCard(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name,
                    style: AppTextStyles.titleMedium.copyWith(
                      color: AppColors.textPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    student.gradeLevel,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        size: 14,
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        student.phone,
                        style: AppTextStyles.labelSmall.copyWith(
                          color: AppColors.textSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.primaryColor),
          ],
        ),
      ),
    );
  }
}
