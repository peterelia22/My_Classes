import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_classes/core/widgets/custom_progress_hud.dart';
import 'package:my_classes/features/groups/presentation/cubits/groups_cubit.dart';
import 'package:my_classes/features/groups/presentation/cubits/groups_state.dart';
import 'widgets/weekly_calendar/weekly_calendar_widget.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<GroupsCubit, GroupsState>(
            builder: (context, state) {
              if (state is GroupsLoading) {
                return const Center(
                  child: CustomProgressHud(
                    isLoading: true,
                    child: SizedBox.shrink(),
                  ),
                );
              }
              if (state is GroupsSuccess) {
                return WeeklyCalendarWidget(groups: state.groups);
              }
              if (state is GroupActionSuccess ||
                  state is GroupActionFailure ||
                  state is GroupDeleteSuccess) {
                return WeeklyCalendarWidget(
                  groups: context.read<GroupsCubit>().currentGroups,
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
