class AppConstants {
  static const List<String> gradeLevels = [
    'رابع ابتدائي',
    'خامس ابتدائي',
    'سادس ابتدائي',
    'أول إعدادي',
    'ثاني إعدادي',
    'ثالث إعدادي',
  ];

  static const List<String> days = [
    'السبت',
    'الأحد',
    'الاثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة',
  ];

  static const List<String> sessionDurations = ['30', '45', '60', '90', '120'];

  static List<String> get timeSlots {
    final slots = <String>[];
    for (int h = 1; h <= 12; h++) {
      slots.add('${h.toString().padLeft(2, '0')}:00');
      slots.add('${h.toString().padLeft(2, '0')}:30');
    }
    return slots;
  }
}
