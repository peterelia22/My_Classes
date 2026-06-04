import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../domain/entities/group_entity.dart';
import '../../cubits/groups_cubit.dart';
import 'delete_group_dialog.dart';
import 'group_bottom_sheet.dart';
import 'group_details_actions_row.dart';
import 'group_details_info_card.dart';
import 'group_details_schedule_card.dart';

class GroupDetailsViewBody extends StatelessWidget {
  final GroupEntity group;

  const GroupDetailsViewBody({super.key, required this.group});

  void _showEditBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return BlocProvider.value(
          value: context.read<GroupsCubit>(),
          child: GroupBottomSheet(group: group),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          group.name,
          style: AppTextStyles.headlineSmall.copyWith(
            color: AppColors.textPrimaryColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.textPrimaryColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GroupDetailsInfoCard(group: group),
            const SizedBox(height: 20),
            GroupDetailsScheduleCard(group: group),
            const SizedBox(height: 40),
            GroupDetailsActionsRow(
              onEdit: () => _showEditBottomSheet(context),
              onDelete: () => DeleteGroupDialog.show(context, group),
            ),
          ],
        ),
      ),
    );
  }
}
