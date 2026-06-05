import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_classes/core/helpers/build_snack_bar.dart';
import 'package:my_classes/core/widgets/custom_progress_hud.dart';
import '../../cubits/students_cubit.dart';
import 'students_view_body.dart';

class StudentsViewBodyBlocConsumer extends StatelessWidget {
  const StudentsViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentsCubit, StudentsState>(
      listener: (context, state) {
        if (state is StudentActionFailure) {
          buildSnackBar(
            context: context,
            title: 'خطأ',
            message: state.errorMessage,
            contentType: ContentType.failure,
          );
        }
        if (state is StudentActionSuccess) {
          Future.delayed(const Duration(milliseconds: 300), () {
            if (context.mounted) {
              buildSnackBar(
                context: context,
                title: 'نجح',
                message: 'تم الحفظ بنجاح',
                contentType: ContentType.success,
              );
            }
          });
        }
        if (state is StudentDeleteSuccess) {
          Future.delayed(const Duration(milliseconds: 300), () {
            if (context.mounted) {
              buildSnackBar(
                context: context,
                title: 'نجح',
                message: 'تم حذف الطالب بنجاح',
                contentType: ContentType.success,
              );
            }
          });
        }
      },
      builder: (context, state) {
        final cubit = context.read<StudentsCubit>();
        return CustomProgressHud(
          isLoading: state is StudentsLoading,
          child: state is StudentsFailure && cubit.currentStudents.isEmpty
              ? Center(child: Text(state.errorMessage))
              : StudentsViewBody(students: cubit.currentStudents),
        );
      },
    );
  }
}
