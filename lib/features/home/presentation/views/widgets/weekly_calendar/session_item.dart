import 'package:flutter/material.dart';

class SessionItem {
  final String groupName;
  final String time;
  final int duration;
  final Color bgColor;
  final Color textColor;
  final Color subTextColor;

  const SessionItem({
    required this.groupName,
    required this.time,
    required this.duration,
    required this.bgColor,
    required this.textColor,
    required this.subTextColor,
  });
}
