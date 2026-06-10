import 'package:flutter/material.dart';
import 'package:my_classes/core/theme/app_colors.dart';
import 'package:my_classes/features/groups/presentation/views/widgets/group_bottom_sheet.dart';
import '../../../../students/presentation/views/widgets/student_bottom_sheet.dart';

class AppShellFab extends StatelessWidget {
  final int currentIndex;
  const AppShellFab({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    if (currentIndex == 1) {
      return FloatingActionButton(
        onPressed: () => GroupBottomSheet.show(context),
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      );
    }

    if (currentIndex == 2) {
      return FloatingActionButton(
        onPressed: () => StudentBottomSheet.show(context),
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      );
    }

    return const SizedBox.shrink();
  }
}
