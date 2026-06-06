import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_classes/core/helpers/build_snack_bar.dart';
import 'package:my_classes/core/widgets/custom_progress_hud.dart';
import '../../../../domain/entities/student_entity.dart';
import '../../../cubits/students_cubit.dart';
import 'student_details_view_body.dart';

class StudentDetailsViewBlocConsumer extends StatelessWidget {
  final StudentEntity student;

  const StudentDetailsViewBlocConsumer({super.key, required this.student});

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
        if (state is StudentActionSuccess || state is StudentDeleteSuccess) {
          buildSnackBar(
            context: context,
            title: 'نجح',
            message: state is StudentDeleteSuccess
                ? 'تم حذف الطالب بنجاح'
                : 'تم تحديث بيانات الطالب بنجاح',
            contentType: ContentType.success,
          );
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        final cubit = context.read<StudentsCubit>();
        final currentStudent = cubit.currentStudents.cast<StudentEntity>().firstWhere(
          (s) => s.id == student.id,
          orElse: () => student,
        );

        return CustomProgressHud(
          isLoading: state is StudentsLoading,
          child: StudentDetailsViewBody(student: currentStudent),
        );
      },
    );
  }
}
