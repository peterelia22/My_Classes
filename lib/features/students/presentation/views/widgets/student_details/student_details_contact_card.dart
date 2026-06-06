import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/app_card.dart';
import '../../../../../../core/widgets/detail_row.dart';
import '../../../../../groups/presentation/cubits/groups_cubit.dart';
import '../../../../domain/entities/student_entity.dart';

class StudentDetailsContactCard extends StatelessWidget {
  final StudentEntity student;

  const StudentDetailsContactCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    final groupsCubit = context.read<GroupsCubit>();
    final group = groupsCubit.currentGroups.cast().firstWhere(
      (g) => g.id == student.groupId,
      orElse: () => null,
    );
    final groupName = group != null ? group.name : 'غير معروف';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'بيانات الطالب',
          style: AppTextStyles.titleLarge.copyWith(
            color: AppColors.textPrimaryColor,
          ),
        ),
        const SizedBox(height: 10),
        AppCard(
          child: Column(
            children: [
              DetailRow(
                icon: Icons.phone,
                label: 'رقم الهاتف',
                value: student.phone.isNotEmpty ? student.phone : 'لا يوجد',
              ),
              const Divider(color: AppColors.dividerColor, height: 24),
              DetailRow(
                icon: Icons.email,
                label: 'البريد الإلكتروني',
                value: student.email.isNotEmpty ? student.email : 'لا يوجد',
              ),
              const Divider(color: AppColors.dividerColor, height: 24),
              DetailRow(icon: Icons.group, label: 'المجموعة', value: groupName),
            ],
          ),
        ),
      ],
    );
  }
}
