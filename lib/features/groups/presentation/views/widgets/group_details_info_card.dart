import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../domain/entities/group_entity.dart';

class GroupDetailsInfoCard extends StatelessWidget {
  final GroupEntity group;

  const GroupDetailsInfoCard({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Icon(
            Icons.group_outlined,
            size: 48,
            color: AppColors.primaryColor,
          ),
          const SizedBox(height: 12),
          Text(
            group.name,
            style: AppTextStyles.headlineMedium.copyWith(
              color: AppColors.textPrimaryColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '${group.gradeLevel} — ${group.academicYear}',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
