import 'package:flutter/material.dart';
import 'package:my_classes/core/theme/app_colors.dart';
import 'package:my_classes/core/theme/app_text_styles.dart';

import 'session_card.dart';
import 'session_item.dart';

class CalendarDayColumn extends StatelessWidget {
  final String day;
  final List<SessionItem> sessions;

  const CalendarDayColumn({
    super.key,
    required this.day,
    required this.sessions,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            alignment: Alignment.center,
            child: Text(
              day,
              style: AppTextStyles.labelSmall.copyWith(
                color: AppColors.textSecondaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Divider(height: 0.5, thickness: 0.5, color: AppColors.borderColor),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: sessions.isEmpty
                  ? const SizedBox.shrink()
                  : Column(
                      children: sessions
                          .map(
                            (s) => Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: SessionCard(session: s),
                            ),
                          )
                          .toList(),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
