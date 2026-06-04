import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_classes/core/helpers/build_snack_bar.dart';
import 'package:my_classes/core/widgets/custom_progress_hud.dart';
import '../../../../domain/entities/group_entity.dart';
import '../../../cubits/groups_cubit.dart';
import '../../../cubits/groups_state.dart';
import 'group_details_view_body.dart';

class GroupDetailsViewBlocConsumer extends StatelessWidget {
  final GroupEntity group;

  const GroupDetailsViewBlocConsumer({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GroupsCubit, GroupsState>(
      listener: (context, state) {
        if (state is GroupActionFailure) {
          buildSnackBar(
            context: context,
            title: 'خطأ',
            message: state.errorMessage,
            contentType: ContentType.failure,
          );
        }
        if (state is GroupActionSuccess || state is GroupDeleteSuccess) {
          buildSnackBar(
            context: context,
            title: 'نجح',
            message: state is GroupDeleteSuccess
                ? 'تم حذف المجموعة بنجاح'
                : 'تم تحديث المجموعات بنجاح',
            contentType: ContentType.success,
          );
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        final cubit = context.read<GroupsCubit>();
        final currentGroup = cubit.currentGroups.cast<GroupEntity>().firstWhere(
          (g) => g.id == group.id,
          orElse: () => group,
        );

        return CustomProgressHud(
          isLoading: state is GroupsLoading,
          child: GroupDetailsViewBody(group: currentGroup),
        );
      },
    );
  }
}
