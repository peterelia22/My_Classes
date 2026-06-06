import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/app_card.dart';
import '../../../../domain/entities/group_entity.dart';
import '../../../../../../core/widgets/detail_row.dart';

class GroupDetailsScheduleCard extends StatelessWidget {
  final GroupEntity group;

  const GroupDetailsScheduleCard({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'مواعيد المجموعة',
          style: AppTextStyles.titleLarge.copyWith(
            color: AppColors.textPrimaryColor,
          ),
        ),
        const SizedBox(height: 10),
        AppCard(
          child: Column(
            children: [
              DetailRow(
                icon: Icons.calendar_today,
                label: 'اليوم الأول',
                value: '${group.day1} في ${group.time1}',
              ),
              const Divider(color: AppColors.dividerColor, height: 24),
              DetailRow(
                icon: Icons.calendar_today,
                label: 'اليوم الثاني',
                value: '${group.day2} في ${group.time2}',
              ),
              const Divider(color: AppColors.dividerColor, height: 24),
              DetailRow(
                icon: Icons.hourglass_top,
                label: 'مدة الحصة',
                value: '${group.sessionDuration} دقيقة',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
