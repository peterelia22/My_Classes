import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_classes/core/helpers/build_snack_bar.dart';
import 'package:my_classes/core/widgets/custom_progress_hud.dart';
import '../../cubits/groups_cubit.dart';
import '../../cubits/groups_state.dart';
import 'groups_view_body.dart';

class GroupsViewBodyBlocConsumer extends StatelessWidget {
  const GroupsViewBodyBlocConsumer({super.key});

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
        if (state is GroupActionSuccess) {
          Future.delayed(const Duration(milliseconds: 300), () {
            if (context.mounted) {
              buildSnackBar(
                context: context,
                title: 'نجح',
                message: 'تم حفظ المجموعة بنجاح',
                contentType: ContentType.success,
              );
            }
          });
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is GroupsLoading,
          child: state is GroupsFailure
              ? Center(child: Text(state.errorMessage))
              : state is GroupsSuccess
              ? GroupsViewBody(groups: state.groups)
              : const SizedBox(),
        );
      },
    );
  }
}
