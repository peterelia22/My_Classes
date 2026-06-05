import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_classes/core/theme/app_colors.dart';
import 'package:my_classes/core/theme/app_text_styles.dart';
import 'package:my_classes/core/widgets/custom_button.dart';
import 'package:uuid/uuid.dart';
import '../../../domain/entities/group_entity.dart';
import '../../cubits/groups_cubit.dart';
import '../../cubits/groups_state.dart';
import 'group_info_section.dart';
import 'group_schedule_section.dart';

class GroupBottomSheet extends StatefulWidget {
  final GroupEntity? group;

  const GroupBottomSheet({super.key, this.group});

  @override
  State<GroupBottomSheet> createState() => _GroupBottomSheetState();
}

class _GroupBottomSheetState extends State<GroupBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String? name;
  late String? academicYear;
  late String? gradeLevel;
  late String? day1;
  late String? time1;
  late String? day2;
  late String? time2;
  late int sessionDuration;

  bool get isEdit => widget.group != null;

  @override
  void initState() {
    super.initState();
    name = widget.group?.name;
    academicYear = widget.group?.academicYear;
    gradeLevel = widget.group?.gradeLevel;
    day1 = widget.group?.day1;
    time1 = widget.group?.time1;
    day2 = widget.group?.day2;
    time2 = widget.group?.time2;
    sessionDuration = widget.group?.sessionDuration ?? 60;
  }

  void submit() {
    FocusScope.of(context).unfocus();
    if (!formKey.currentState!.validate()) {
      setState(() => autovalidateMode = AutovalidateMode.always);
      return;
    }
    formKey.currentState!.save();
    Navigator.pop(context);

    final entity = GroupEntity(
      id: widget.group?.id ?? const Uuid().v4(),
      name: name!.trim(),
      academicYear: academicYear!.trim(),
      gradeLevel: gradeLevel!,
      day1: day1!,
      time1: time1!,
      day2: day2!,
      time2: time2!,
      sessionDuration: sessionDuration,
    );

    if (isEdit) {
      context.read<GroupsCubit>().updateGroup(entity);
    } else {
      context.read<GroupsCubit>().addGroup(entity);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
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
                      isEdit ? 'تعديل المجموعة' : 'إضافة مجموعة جديدة',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.headlineSmall.copyWith(
                        color: AppColors.textPrimaryColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      isEdit
                          ? 'قم بتحديث بيانات المجموعة وجدول الحصص ثم احفظ.'
                          : 'اختر بيانات المجموعة وجدول الحصص ثم احفظ.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondaryColor,
                      ),
                    ),
                    const SizedBox(height: 24),

                    GroupInfoSection(
                      initialName: name,
                      initialAcademicYear: academicYear,
                      initialGradeLevel: gradeLevel,
                      onNameSaved: (v) => name = v,
                      onAcademicYearSaved: (v) => academicYear = v,
                      onGradeLevelSaved: (v) => gradeLevel = v,
                    ),
                    const SizedBox(height: 24),

                    GroupScheduleSection(
                      initialDay1: day1,
                      initialTime1: time1,
                      initialDay2: day2,
                      initialTime2: time2,
                      initialDuration: sessionDuration,
                      onDay1Saved: (v) => day1 = v,
                      onTime1Saved: (v) => time1 = v,
                      onDay2Saved: (v) => day2 = v,
                      onTime2Saved: (v) => time2 = v,
                      onDurationSaved: (v) => sessionDuration = int.parse(
                        v!.replaceAll(' دقيقة', ''),
                      ),
                    ),
                    const SizedBox(height: 28),

                    BlocBuilder<GroupsCubit, GroupsState>(
                      builder: (context, state) {
                        final isLoading = state is GroupsLoading;
                        return CustomButton(
                          text: isLoading
                              ? 'جاري الحفظ...'
                              : isEdit
                              ? 'حفظ التعديلات'
                              : 'حفظ المجموعة',
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
    );
  }
}
