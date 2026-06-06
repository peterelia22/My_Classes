import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import 'app_card.dart';

class AppDetailsHeaderCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const AppDetailsHeaderCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Icon(
            icon,
            size: 48,
            color: AppColors.primaryColor,
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: AppTextStyles.headlineMedium.copyWith(
              color: AppColors.textPrimaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondaryColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
