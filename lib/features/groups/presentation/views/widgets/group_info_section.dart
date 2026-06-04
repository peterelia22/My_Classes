import 'package:flutter/material.dart';
import 'package:my_classes/core/constants/app_constants.dart';
import 'package:my_classes/core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/app_dropdown.dart';
import '../../../../../core/widgets/section_title.dart';

class GroupInfoSection extends StatelessWidget {
  final FormFieldSetter<String> onNameSaved;
  final FormFieldSetter<String> onAcademicYearSaved;
  final FormFieldSetter<String> onGradeLevelSaved;
  final String? initialName;
  final String? initialAcademicYear;
  final String? initialGradeLevel;

  const GroupInfoSection({
    super.key,
    required this.onNameSaved,
    required this.onAcademicYearSaved,
    required this.onGradeLevelSaved,
    this.initialName,
    this.initialAcademicYear,
    this.initialGradeLevel,
  });

  String? _required(String? value, String label) =>
      (value == null || value.trim().isEmpty) ? 'يرجى اختيار $label' : null;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SectionTitle(
          title: 'بيانات المجموعة',
          subtitle: 'المعلومات التعريفية الأساسية',
        ),
        const SizedBox(height: 16),
        CustomTextField(
          labelText: 'اسم المجموعة',
          hintText: 'مثال: المجموعة الأولى',
          obscureText: false,
          onSaved: onNameSaved,
          validator: (v) => _required(v, 'اسم المجموعة'),
          initialValue: initialName,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          labelText: 'العام الدراسي',
          hintText: 'مثال: 2025 - 2026',
          obscureText: false,
          keyboardType: TextInputType.number,
          onSaved: onAcademicYearSaved,
          validator: (v) => _required(v, 'العام الدراسي'),
          initialValue: initialAcademicYear,
        ),
        const SizedBox(height: 16),
        AppDropdown(
          labelText: 'المرحلة / الصف',
          hintText: 'اختر الصف',
          items: AppConstants.gradeLevels,
          onSaved: onGradeLevelSaved,
          validator: (v) => _required(v, 'المرحلة'),
          value: initialGradeLevel,
        ),
      ],
    );
  }
}
