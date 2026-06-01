import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_classes/core/helpers/build_snack_bar.dart';
import 'package:my_classes/features/groups/presentation/cubits/groups_cubit.dart';
import 'package:my_classes/features/groups/presentation/cubits/groups_state.dart';
import 'package:my_classes/features/groups/presentation/views/widgets/groups_view_body.dart';

class GroupsViewBodyBlocConsumer extends StatelessWidget {
  const GroupsViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GroupsCubit, GroupsState>(
      listener: (context, state) {
        if (state is GroupActionSuccess) {
          buildSnackBar(
            context: context,
            title: 'تمت العملية بنجاح',
            message: 'تم حفظ التغييرات على المجموعة',
            contentType: ContentType.success,
          );
        } else if (state is GroupActionFailure) {
          buildSnackBar(
            context: context,
            title: 'تعذر تنفيذ العملية',
            message: 'حدث خطأ أثناء حفظ التغييرات، حاول مرة أخرى',
            contentType: ContentType.failure,
          );
        } else if (state is GroupsFailure) {
          buildSnackBar(
            context: context,
            title: 'فشل تحميل المجموعات',
            message: 'تعذر تحميل المجموعات حالياً، حاول مرة أخرى',
            contentType: ContentType.failure,
          );
        }
      },
      builder: (context, state) {
        return const GroupsViewBody();
      },
    );
  }
}
