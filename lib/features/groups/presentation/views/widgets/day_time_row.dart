import 'package:flutter/material.dart';
import 'package:my_classes/core/constants/app_constants.dart';

import 'app_dropdown.dart';

class DayTimeRow extends StatelessWidget {
  const DayTimeRow({
    super.key,
    required this.dayLabel,
    required this.timeLabel,
    required this.onDaySaved,
    required this.onTimeSaved,
    required this.dayValidator,
    required this.timeValidator,
  });

  final String dayLabel;
  final String timeLabel;
  final void Function(String?) onDaySaved;
  final void Function(String?) onTimeSaved;
  final String? Function(String?) dayValidator;
  final String? Function(String?) timeValidator;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppDropdown(
            labelText: dayLabel,
            hintText: 'اختر اليوم',
            items: AppConstants.days,
            onSaved: onDaySaved,
            validator: dayValidator,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: AppDropdown(
            labelText: timeLabel,
            hintText: 'اختر الوقت',
            items: AppConstants.timeSlots,
            onSaved: onTimeSaved,
            validator: timeValidator,
          ),
        ),
      ],
    );
  }
}
