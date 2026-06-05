import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_classes/core/theme/app_colors.dart';
import 'package:my_classes/features/groups/presentation/cubits/groups_cubit.dart';
import 'package:my_classes/features/groups/presentation/views/widgets/group_bottom_sheet.dart';
import 'package:my_classes/features/students/presentation/cubits/students_cubit.dart';

import '../../../../students/presentation/views/widgets/student_bottom_sheet.dart';

class AppShellFab extends StatelessWidget {
  final int currentIndex;
  const AppShellFab({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    if (currentIndex == 1) {
      return FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (_) => BlocProvider.value(
              value: context.read<GroupsCubit>(),
              child: const GroupBottomSheet(),
            ),
          );
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      );
    }

    if (currentIndex == 2) {
      return FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (_) => MultiBlocProvider(
              providers: [
                BlocProvider.value(value: context.read<StudentsCubit>()),
                BlocProvider.value(value: context.read<GroupsCubit>()),
              ],
              child: StudentBottomSheet(
                groups: context.read<GroupsCubit>().currentGroups,
              ),
            ),
          );
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      );
    }

    return const SizedBox.shrink();
  }
}
