import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/helpers/show_app_bottom_sheet.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/app_delete_confirmation_dialog.dart';
import '../../../../../../core/widgets/app_details_actions_row.dart';
import '../../../../../../core/widgets/app_details_header_card.dart';
import '../../../../../groups/presentation/cubits/groups_cubit.dart';
import '../../../../domain/entities/student_entity.dart';
import '../../../cubits/students_cubit.dart';
import '../student_bottom_sheet.dart';
import 'student_details_contact_card.dart';

class StudentDetailsViewBody extends StatelessWidget {
  final StudentEntity student;

  const StudentDetailsViewBody({super.key, required this.student});

  void _showEditBottomSheet(BuildContext context) {
    showAppBottomSheet(
      context: context,
      providers: [
        BlocProvider.value(value: context.read<StudentsCubit>()),
        BlocProvider.value(value: context.read<GroupsCubit>()),
      ],
      child: StudentBottomSheet(
        student: student,
        groups: context.read<GroupsCubit>().currentGroups,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          student.name,
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
            AppDetailsHeaderCard(
              icon: Icons.person_outline,
              title: student.name,
              subtitle: student.gradeLevel,
            ),
            const SizedBox(height: 20),
            StudentDetailsContactCard(student: student),
            const SizedBox(height: 40),
            AppDetailsActionsRow(
              deleteLabel: 'حذف الطالب',
              onEdit: () => _showEditBottomSheet(context),
              onDelete: () {
                AppDeleteConfirmationDialog.show(
                  context: context,
                  title: 'حذف الطالب',
                  content: 'هل أنت متأكد من رغبتك في حذف الطالب "${student.name}"؟ لا يمكن التراجع عن هذا الإجراء.',
                  onDelete: () => context.read<StudentsCubit>().deleteStudent(student.id),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
