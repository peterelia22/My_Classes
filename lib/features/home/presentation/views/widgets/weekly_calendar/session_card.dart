import 'package:flutter/material.dart';
import 'package:my_classes/core/theme/app_text_styles.dart';

import 'calendar_utils.dart';
import 'session_item.dart';

class SessionCard extends StatelessWidget {
  final SessionItem session;

  const SessionCard({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: session.bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            session.groupName,
            style: AppTextStyles.titleSmall.copyWith(color: session.textColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            '${session.time} — ${CalendarUtils.endTime(session.time, session.duration)}',
            style: AppTextStyles.labelSmall.copyWith(
              color: session.subTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
