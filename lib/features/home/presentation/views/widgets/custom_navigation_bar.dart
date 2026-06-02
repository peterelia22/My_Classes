import 'package:flutter/material.dart';
import 'package:my_classes/core/theme/app_colors.dart';
import 'package:my_classes/core/theme/app_text_styles.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const CustomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceColor,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: 24,
              offset: const Offset(0, -8),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              backgroundColor: Colors.transparent,
              indicatorColor: AppColors.primaryColor.withValues(alpha: 0.12),
              elevation: 0,
              labelTextStyle:
                  WidgetStateProperty.resolveWith<TextStyle?>((states) {
                final bool selected = states.contains(
                  WidgetState.selected,
                );
                return (selected
                        ? AppTextStyles.labelMedium
                        : AppTextStyles.labelSmall)
                    .copyWith(
                  color: selected
                      ? AppColors.primaryColor
                      : AppColors.textSecondaryColor,
                );
              }),
              iconTheme:
                  WidgetStateProperty.resolveWith<IconThemeData?>((states) {
                final bool selected = states.contains(
                  WidgetState.selected,
                );
                return IconThemeData(
                  color: selected
                      ? AppColors.primaryColor
                      : AppColors.textSecondaryColor,
                  size: selected ? 26 : 24,
                );
              }),
            ),
            child: NavigationBar(
              selectedIndex: selectedIndex,
              height: 72,
              onDestinationSelected: onDestinationSelected,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: 'الرئيسية',
                ),
                NavigationDestination(
                  icon: Icon(Icons.groups_outlined),
                  selectedIcon: Icon(Icons.groups),
                  label: 'المجموعات',
                ),
                NavigationDestination(
                  icon: Icon(Icons.people_outlined),
                  selectedIcon: Icon(Icons.people),
                  label: 'الطلاب',
                ),
                NavigationDestination(
                  icon: Icon(Icons.payment_outlined),
                  selectedIcon: Icon(Icons.payment),
                  label: 'المدفوعات',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
