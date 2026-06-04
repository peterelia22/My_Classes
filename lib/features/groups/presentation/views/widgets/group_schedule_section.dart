import 'package:flutter/material.dart';
import 'package:my_classes/core/constants/app_constants.dart';
import 'app_dropdown.dart';
import 'day_time_row.dart';
import 'section_title.dart';

class GroupScheduleSection extends StatelessWidget {
  final FormFieldSetter<String> onDay1Saved;
  final FormFieldSetter<String> onTime1Saved;
  final FormFieldSetter<String> onDay2Saved;
  final FormFieldSetter<String> onTime2Saved;
  final FormFieldSetter<String> onDurationSaved;
  final String? initialDay1;
  final String? initialTime1;
  final String? initialDay2;
  final String? initialTime2;
  final int? initialDuration;

  const GroupScheduleSection({
    super.key,
    required this.onDay1Saved,
    required this.onTime1Saved,
    required this.onDay2Saved,
    required this.onTime2Saved,
    required this.onDurationSaved,
    this.initialDay1,
    this.initialTime1,
    this.initialDay2,
    this.initialTime2,
    this.initialDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SectionTitle(
          title: 'جدول الحصص',
          subtitle: 'اختر يومين ووقتين للمجموعة',
        ),
        const SizedBox(height: 16),
        DayTimeRow(
          dayLabel: 'اليوم الأول',
          timeLabel: 'الوقت الأول',
          onDaySaved: onDay1Saved,
          onTimeSaved: onTime1Saved,
          initialDay: initialDay1,
          initialTime: initialTime1,
        ),
        const SizedBox(height: 16),
        DayTimeRow(
          dayLabel: 'اليوم الثاني',
          timeLabel: 'الوقت الثاني',
          onDaySaved: onDay2Saved,
          onTimeSaved: onTime2Saved,
          initialDay: initialDay2,
          initialTime: initialTime2,
        ),
        const SizedBox(height: 16),
        AppDropdown(
          labelText: 'مدة الجلسة',
          hintText: 'اختر المدة',
          items: AppConstants.sessionDurations
              .map((e) => '$e دقيقة')
              .toList(),
          onSaved: onDurationSaved,
          value: initialDuration != null ? '$initialDuration دقيقة' : null,
        ),
      ],
    );
  }
}
