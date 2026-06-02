import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_classes/core/constants/app_constants.dart';
import 'package:my_classes/core/theme/app_colors.dart';
import 'package:my_classes/core/theme/app_text_styles.dart';
import 'package:my_classes/core/widgets/custom_button.dart';
import 'package:my_classes/core/widgets/custom_text_field.dart';
import 'package:uuid/uuid.dart';
import '../../../domain/entities/group_entity.dart';
import '../../cubits/groups_cubit.dart';
import '../../cubits/groups_state.dart';
import 'app_dropdown.dart';
import 'day_time_row.dart';
import 'section_title.dart';

class AddGroupBottomSheet extends StatefulWidget {
  const AddGroupBottomSheet({super.key});

  @override
  State<AddGroupBottomSheet> createState() => _AddGroupBottomSheetState();
}

class _AddGroupBottomSheetState extends State<AddGroupBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _name;
  String? _academicYear;
  String? _gradeLevel;
  String? _day1;
  String? _time1;
  String? _day2;
  String? _time2;
  int _sessionDuration = 60;


  void _submit() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    context.read<GroupsCubit>().addGroup(
      GroupEntity(
        id: const Uuid().v4(),
        name: _name!.trim(),
        academicYear: _academicYear!.trim(),
        gradeLevel: _gradeLevel!,
        day1: _day1!,
        time1: _time1!,
        day2: _day2!,
        time2: _time2!,
        sessionDuration: _sessionDuration,
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
                  key: _formKey,
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
                      const SectionTitle(
                        title: 'بيانات المجموعة',
                        subtitle: 'المعلومات التعريفية الأساسية',
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        labelText: 'اسم المجموعة',
                        hintText: 'مثال: المجموعة الأولى',
                        obscureText: false,
                        onSaved: (v) => _name = v,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        labelText: 'العام الدراسي',
                        hintText: 'مثال: 2025 - 2026',
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        onSaved: (v) => _academicYear = v,
                      ),
                      const SizedBox(height: 16),
                      AppDropdown(
                        labelText: 'المرحلة / الصف',
                        hintText: 'اختر الصف',
                        items: AppConstants.gradeLevels,
                        onSaved: (v) => _gradeLevel = v,
                      ),
                      const SizedBox(height: 24),
                      const SectionTitle(
                        title: 'جدول الحصص',
                        subtitle: 'اختر يومين ووقتين للمجموعة',
                      ),
                      const SizedBox(height: 16),
                      DayTimeRow(
                        dayLabel: 'اليوم الأول',
                        timeLabel: 'الوقت الأول',
                        onDaySaved: (v) => _day1 = v,
                        onTimeSaved: (v) => _time1 = v,
                      ),
                      const SizedBox(height: 16),
                      DayTimeRow(
                        dayLabel: 'اليوم الثاني',
                        timeLabel: 'الوقت الثاني',
                        onDaySaved: (v) => _day2 = v,
                        onTimeSaved: (v) => _time2 = v,
                      ),
                      const SizedBox(height: 16),
                      AppDropdown(
                        labelText: 'مدة الجلسة',
                        hintText: 'اختر المدة',
                        items: AppConstants.sessionDurations
                            .map((e) => '$e دقيقة')
                            .toList(),
                        onSaved: (v) => _sessionDuration = int.parse(
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
