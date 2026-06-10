import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:my_classes/core/helpers/show_app_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_classes/core/helpers/build_snack_bar.dart';
import 'package:my_classes/core/theme/app_colors.dart';
import 'package:my_classes/core/theme/app_text_styles.dart';
import 'package:my_classes/core/widgets/custom_button.dart';
import 'package:my_classes/features/groups/domain/entities/group_entity.dart';
import 'package:my_classes/features/students/domain/entities/student_entity.dart';
import 'package:my_classes/features/students/presentation/cubits/students_cubit.dart';
import 'package:uuid/uuid.dart';
import '../../../../groups/presentation/cubits/groups_cubit.dart';
import 'student_info_section.dart';
import 'student_group_section.dart';

class StudentBottomSheet extends StatefulWidget {
  final StudentEntity? student;
  final List<GroupEntity> groups;

  const StudentBottomSheet({super.key, this.student, required this.groups});

  static void show(BuildContext context, {StudentEntity? student}) {
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
  State<StudentBottomSheet> createState() => _StudentBottomSheetState();
}

class _StudentBottomSheetState extends State<StudentBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String? name;
  late String? phone;
  late String? email;
  late String? password;
  late String? gradeLevel;
  late String? groupId;

  bool _submitted = false;
  bool get isEdit => widget.student != null;

  @override
  void initState() {
    super.initState();
    name = widget.student?.name;
    phone = widget.student?.phone;
    email = widget.student?.email;
    password = null;
    gradeLevel = widget.student?.gradeLevel;
    groupId = widget.student?.groupId;
  }

  void submit() {
    FocusScope.of(context).unfocus();
    if (!formKey.currentState!.validate()) {
      setState(() => autovalidateMode = AutovalidateMode.always);
      return;
    }
    formKey.currentState!.save();
    _submitted = true;

    final entity = StudentEntity(
      id: widget.student?.id ?? const Uuid().v4(),
      name: name!.trim(),
      phone: phone!.trim(),
      email: email!.trim(),
      groupId: groupId!,
      gradeLevel: gradeLevel!,
      supabaseUserId: widget.student?.supabaseUserId,
    );

    if (isEdit) {
      context.read<StudentsCubit>().updateStudent(entity);
    } else {
      context.read<StudentsCubit>().addStudent(
        student: entity,
        password: password!.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return BlocListener<StudentsCubit, StudentsState>(
      listener: (context, state) {
        if (state is StudentActionFailure) {
          _submitted = false;
          buildSnackBar(
            context: context,
            title: 'خطأ',
            message: state.errorMessage,
            contentType: ContentType.failure,
          );
        }
        if (state is StudentsSuccess && _submitted) {
          Navigator.pop(context);
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: SafeArea(
            top: false,
            child: AnimatedPadding(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOut,
              padding: EdgeInsets.only(bottom: bottomInset),
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                child: Form(
                  key: formKey,
                  autovalidateMode: autovalidateMode,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // drag handle
                      Center(
                        child: Container(
                          width: 48,
                          height: 5,
                          decoration: BoxDecoration(
                            color: AppColors.borderColor,
                            borderRadius: BorderRadius.circular(999),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        isEdit ? 'تعديل بيانات الطالب' : 'إضافة طالب جديد',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.headlineSmall.copyWith(
                          color: AppColors.textPrimaryColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        isEdit
                            ? 'قم بتحديث بيانات الطالب ثم احفظ.'
                            : 'أدخل بيانات الطالب وبيانات الدخول ثم احفظ.',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondaryColor,
                        ),
                      ),
                      const SizedBox(height: 24),

                      StudentInfoSection(
                        initialName: name,
                        initialPhone: phone,
                        initialEmail: email,
                        isEdit: isEdit,
                        onNameSaved: (v) => name = v,
                        onPhoneSaved: (v) => phone = v,
                        onEmailSaved: (v) => email = v,
                        onPasswordSaved: isEdit ? null : (v) => password = v,
                      ),
                      const SizedBox(height: 24),

                      StudentGroupSection(
                        groups: widget.groups,
                        initialGradeLevel: gradeLevel,
                        initialGroupId: groupId,
                        onGradeLevelChanged: (v) =>
                            setState(() => gradeLevel = v),
                        onGroupSaved: (v) => groupId = v,
                      ),
                      const SizedBox(height: 28),

                      BlocBuilder<StudentsCubit, StudentsState>(
                        builder: (context, state) {
                          final isLoading = state is StudentsLoading;
                          return CustomButton(
                            text: isLoading
                                ? 'جاري الحفظ...'
                                : isEdit
                                ? 'حفظ التعديلات'
                                : 'إضافة الطالب',
                            onPressed: isLoading ? null : submit,
                            isLoading: isLoading,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
