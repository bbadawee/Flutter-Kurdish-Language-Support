import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../utils/text_direction_utils.dart';

class KurdishCupertinoLocalizations implements CupertinoLocalizations {
  const KurdishCupertinoLocalizations();

  static const LocalizationsDelegate<CupertinoLocalizations> delegate = _KurdishCupertinoLocalizationsDelegate();

  @override
  String get alertDialogLabel => 'ئاگادارکردنەوە';

  @override
  String get copyButtonLabel => 'کۆپی';

  @override
  String get cutButtonLabel => 'بڕین';

  @override
  String get pasteButtonLabel => 'پەیست';

  @override
  String get selectAllButtonLabel => 'هەموو هەڵبژێرە';

  @override
  String get todayLabel => 'ئەمڕۆ';

  @override
  String get modalBarrierDismissLabel => 'داخستن';

  @override
  DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.mdy;

  @override
  DatePickerDateTimeOrder get datePickerDateTimeOrder => DatePickerDateTimeOrder.date_time_dayPeriod;

  @override
  String datePickerYear(int yearIndex) {
    return TextDirectionUtils.convertToKurdishNumbers(yearIndex.toString());
  }

  @override
  String datePickerMonth(int monthIndex) {
    return switch (monthIndex) {
      1 => 'کانوونی دووەم',
      2 => 'شوبات',
      3 => 'ئازار',
      4 => 'نیسان',
      5 => 'ئایار',
      6 => 'حوزەیران',
      7 => 'تەممووز',
      8 => 'ئاب',
      9 => 'ئەیلوول',
      10 => 'تشرینی یەکەم',
      11 => 'تشرینی دووەم',
      12 => 'کانوونی یەکەم',
      _ => '',
    };
  }

  @override
  String datePickerDayOfMonth(int dayIndex, [int? monthIndex]) {
    return TextDirectionUtils.convertToKurdishNumbers(dayIndex.toString());
  }

  @override
  String datePickerHour(int hour) => hour.toString();

  @override
  String datePickerMinute(int minute) => minute.toString().padLeft(2, '0');

  @override
  String datePickerMediumDate(DateTime date) {
    return '${datePickerMonth(date.month)} ${date.day}, ${date.year}';
  }

  @override
  String get anteMeridiemAbbreviation => 'پ.ن';

  @override
  String get postMeridiemAbbreviation => 'د.ن';

  @override
  String timerPickerHour(int hour) => hour.toString();

  @override
  String timerPickerMinute(int minute) => minute.toString();

  @override
  String timerPickerSecond(int second) => second.toString();

  @override
  String datePickerHourSemanticsLabel(int hour) => 'کاتژمێر $hour';

  @override
  String datePickerMinuteSemanticsLabel(int minute) => 'خولەک $minute';

  @override
  String tabSemanticsLabel({required int tabIndex, required int tabCount}) {
    return 'تاب $tabIndex لە $tabCount';
  }

  @override
  String get searchTextFieldPlaceholderLabel => 'گەڕان';

  @override
  String timerPickerHourLabel(int hour) => 'کاتژمێر';

  @override
  String timerPickerMinuteLabel(int minute) => 'خولەک';

  @override
  String timerPickerSecondLabel(int second) => 'چرکە';

  @override
  String get noSpellCheckReplacementsLabel => 'هیچ جێگرەوەیەک نەدۆزرایەوە';

  @override
  String datePickerStandaloneMonth(int monthIndex) => datePickerMonth(monthIndex);

  @override
  String datePickerHourSemanticsLabelOne(int hour) => '$hour کاتژمێر';

  @override
  String datePickerHourSemanticsLabelOther(int hour) => '$hour کاتژمێر';

  @override
  String datePickerMinuteSemanticsLabelOne(int minute) => '$minute خولەک';

  @override
  String datePickerMinuteSemanticsLabelOther(int minute) => '$minute خولەک';

  @override
  String get clearButtonLabel => 'پاککردنەوە';

  @override
  String get lookUpButtonLabel => 'سەیرکردن';

  @override
  String get menuDismissLabel => 'داخستنی مێنیو';

  @override
  String get searchWebButtonLabel => 'گەڕان لە ئینتەرنێت';

  @override
  String get shareButtonLabel => 'هاوبەشکردن';

  @override
  String get datePickerDateTimeOrderString => 'date_time_dayPeriod';

  @override
  String get datePickerDateOrderString => 'mdy';

  @override
  String get datePickerHourSemanticsLabelZero => 'کاتژمێر ٠';

  @override
  String get datePickerHourSemanticsLabelTwo => 'کاتژمێر ٢';

  @override
  String get datePickerHourSemanticsLabelFew => 'کاتژمێر';

  @override
  String get datePickerHourSemanticsLabelMany => 'کاتژمێر';

  @override
  String get datePickerMinuteSemanticsLabelZero => 'خولەک ٠';

  @override
  String get datePickerMinuteSemanticsLabelTwo => 'خولەک ٢';

  @override
  String get datePickerMinuteSemanticsLabelFew => 'خولەک';

  @override
  String get datePickerMinuteSemanticsLabelMany => 'خولەک';

  @override
  List<String> get timerPickerHourLabels => const <String>[
    'کاتژمێر',
    'کاتژمێر',
    'کاتژمێر',
    'کاتژمێر',
    'کاتژمێر',
    'کاتژمێر',
  ];

  @override
  List<String> get timerPickerMinuteLabels => const <String>[
    'خولەک',
    'خولەک',
    'خولەک',
    'خولەک',
    'خولەک',
    'خولەک',
  ];

  @override
  List<String> get timerPickerSecondLabels => const <String>[
    'چرکە',
    'چرکە',
    'چرکە',
    'چرکە',
    'چرکە',
    'چرکە',
  ];
}

class _KurdishCupertinoLocalizationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const _KurdishCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ckb';

  @override
  Future<CupertinoLocalizations> load(Locale locale) {
    return SynchronousFuture<CupertinoLocalizations>(const KurdishCupertinoLocalizations());
  }

  @override
  bool shouldReload(_KurdishCupertinoLocalizationsDelegate old) => false;
} 