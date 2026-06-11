import 'package:flutter/material.dart';
import 'package:my_classes/core/theme/app_colors.dart';
import 'package:my_classes/core/theme/app_text_styles.dart';
import 'package:my_classes/features/students/domain/entities/student_entity.dart';
import 'package:my_classes/features/groups/domain/entities/group_entity.dart';

class PaymentItemCard extends StatelessWidget {
  final StudentEntity student;
  final GroupEntity? group;
  final bool isPaid;
  final ValueChanged<bool> onTogglePayment;

  const PaymentItemCard({
    super.key,
    required this.student,
    this.group,
    required this.isPaid,
    required this.onTogglePayment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(16),
      ),
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
                  '${group?.name ?? 'بدون مجموعة'} • ${student.gradeLevel}',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondaryColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () => onTogglePayment(!isPaid),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isPaid ? Colors.green.withAlpha(26) : Colors.redAccent.withAlpha(26),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isPaid ? Colors.green : Colors.redAccent,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    isPaid ? Icons.check_circle : Icons.cancel,
                    color: isPaid ? Colors.green : Colors.redAccent,
                    size: 18,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    isPaid ? 'دفع' : 'لم يدفع',
                    style: AppTextStyles.labelLarge.copyWith(
                      color: isPaid ? Colors.green : Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
