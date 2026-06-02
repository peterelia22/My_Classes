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

class AddGroupBottomSheet extends StatefulWidget {
  const AddGroupBottomSheet({super.key});

  @override
  State<AddGroupBottomSheet> createState() => _AddGroupBottomSheetState();
}

class _AddGroupBottomSheetState extends State<AddGroupBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? name;
  String? academicYear;
  String? gradeLevel;
  String? day1;
  String? time1;
  String? day2;
  String? time2;
  int sessionDuration = 60;

  void _submit() {
    FocusScope.of(context).unfocus();
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();

    context.read<GroupsCubit>().addGroup(
      GroupEntity(
        id: const Uuid().v4(),
        name: name!.trim(),
        academicYear: academicYear!.trim(),
        gradeLevel: gradeLevel!,
        day1: day1!,
        time1: time1!,
        day2: day2!,
        time2: time2!,
        sessionDuration: sessionDuration,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return BlocListener<GroupsCubit, GroupsState>(
      listener: (context, state) {
        if (state is GroupActionSuccess) {
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        'إضافة مجموعة جديدة',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.headlineSmall.copyWith(
                          color: AppColors.textPrimaryColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'اختر بيانات المجموعة وجدول الحصص ثم احفظ.',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondaryColor,
                        ),
                      ),
                      const SizedBox(height: 24),

                      GroupInfoSection(
                        onNameSaved: (v) => name = v,
                        onAcademicYearSaved: (v) => academicYear = v,
                        onGradeLevelSaved: (v) => gradeLevel = v,
                      ),
                      const SizedBox(height: 24),

                      GroupScheduleSection(
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
                            text: isLoading ? 'جاري الحفظ...' : 'حفظ المجموعة',
                            onPressed: isLoading ? null : _submit,
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
