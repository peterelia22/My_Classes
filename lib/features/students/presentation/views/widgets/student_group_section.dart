import 'package:flutter/material.dart';
import 'package:my_classes/core/constants/app_constants.dart';
import 'package:my_classes/features/groups/domain/entities/group_entity.dart';
import '../../../../../core/widgets/app_dropdown.dart';
import '../../../../../core/widgets/section_title.dart';

class StudentGroupSection extends StatefulWidget {
  final List<GroupEntity> groups;
  final String? initialGradeLevel;
  final String? initialGroupId;
  final void Function(String?) onGradeLevelChanged;
  final FormFieldSetter<String> onGroupSaved;

  const StudentGroupSection({
    super.key,
    required this.groups,
    required this.onGradeLevelChanged,
    required this.onGroupSaved,
    this.initialGradeLevel,
    this.initialGroupId,
  });

  @override
  State<StudentGroupSection> createState() => _StudentGroupSectionState();
}

class _StudentGroupSectionState extends State<StudentGroupSection> {
  String? selectedGradeLevel;

  @override
  void initState() {
    super.initState();
    selectedGradeLevel = widget.initialGradeLevel;
  }

  List<GroupEntity> get filteredGroups => selectedGradeLevel == null
      ? []
      : widget.groups.where((g) => g.gradeLevel == selectedGradeLevel).toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SectionTitle(
          title: 'المجموعة',
          subtitle: 'اختر السنة الدراسية ثم المجموعة',
        ),
        const SizedBox(height: 16),

        AppDropdown(
          labelText: 'السنة الدراسية',
          hintText: 'اختر السنة',
          items: AppConstants.gradeLevels,
          value: selectedGradeLevel,
          onChanged: (v) {
            setState(() => selectedGradeLevel = v);
            widget.onGradeLevelChanged(v);
          },
          onSaved: (_) {},
        ),
        const SizedBox(height: 16),

        AppDropdown(
          labelText: 'المجموعة',
          hintText: selectedGradeLevel == null
              ? 'اختر السنة الدراسية أولاً'
              : filteredGroups.isEmpty
              ? 'لا توجد مجموعات لهذه السنة'
              : 'اختر المجموعة',
          items: filteredGroups.map((g) => g.name).toList(),
          value: widget.initialGroupId != null
              ? filteredGroups
                        .where((g) => g.id == widget.initialGroupId)
                        .isNotEmpty
                    ? filteredGroups
                          .firstWhere((g) => g.id == widget.initialGroupId)
                          .name
                    : null
              : null,
          onSaved: (name) {
            if (name == null) return;
            final group = filteredGroups.firstWhere((g) => g.name == name);
            widget.onGroupSaved(group.id);
          },
          validator: (v) =>
              (v == null || v.isEmpty) ? 'يرجى اختيار المجموعة' : null,
        ),
      ],
    );
  }
}
