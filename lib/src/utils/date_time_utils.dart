class KurdishDateTime {
  static String getRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays == 0) {
      return 'ئەمڕۆ';
    } else if (difference.inDays == 1) {
      return 'دوێنێ';
    } else if (difference.inDays == -1) {
      return 'سبەینێ';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} ڕۆژ لەمەوبەر';
    } else {
      return '${-difference.inDays} ڕۆژی تر';
    }
  }

  static String formatDateRange(DateTime start, DateTime end) {
    return '${getKurdishMonth(start.month)} ${start.day} - ${getKurdishMonth(end.month)} ${end.day}, ${end.year}';
  }

  static String getMonthName(int month, {bool abbreviated = false}) {
    final months = [
      'کانونی دووەم',
      'شوبات',
      'ئازار',
      'نیسان',
      'ئایار',
      'حوزەیران',
      'تەمموز',
      'ئاب',
      'ئەیلول',
      'تشرینی یەکەم',
      'تشرینی دووەم',
      'کانونی یەکەم'
    ];
    
    if (month < 1 || month > 12) {
      return 'نادیار';
    }
    
    final monthName = months[month - 1];
    return abbreviated ? monthName.split(' ')[0] : monthName;
  }
}

String getKurdishMonth(int month) {
  if (month < 1 || month > 12) {
    return 'نادیار';
  }
  
  const months = [
    'کانونی دووەم',
    'شوبات',
    'ئازار',
    'نیسان',
    'ئایار',
    'حوزەیران',
    'تەمموز',
    'ئاب',
    'ئەیلول',
    'تشرینی یەکەم',
    'تشرینی دووەم',
    'کانونی یەکەم'
  ];
  return months[month - 1];
}

String getKurdishWeekday(int weekday) {
  if (weekday < 1 || weekday > 7) {
    return 'نادیار';
  }
  
  const days = [
    'دووشەممە',
    'سێشەممە',
    'چوارشەممە',
    'پێنجشەممە',
    'هەینی',
    'شەممە',
    'یەکشەممە'
  ];
  return days[weekday - 1];
}

String getKurdishDayPeriod(int hour) {
  if (hour < 0 || hour > 23) {
    return 'نادیار';
  }
  
  if (hour < 12) {
    return 'بەیانی';
  } else if (hour < 17) {
    return 'دوای نیوەڕۆ';
  } else {
    return 'ئێوارە';
  }
} 