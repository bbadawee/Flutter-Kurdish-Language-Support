import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import '../utils/text_direction_utils.dart';

class KurdishMaterialLocalizations implements MaterialLocalizations {
  const KurdishMaterialLocalizations();

  static const LocalizationsDelegate<MaterialLocalizations> delegate = _KurdishMaterialLocalizationsDelegate();

  @override
  String get alertDialogLabel => 'ئاگادارکردنەوە';

  @override
  String get closeButtonTooltip => 'داخستن';

  @override
  String get okButtonLabel => 'باشە';

  @override
  String get cancelButtonLabel => 'هەڵوەشاندنەوە';

  @override
  String get searchFieldLabel => 'گەڕان';

  @override
  String get selectAllButtonLabel => 'هەموو هەڵبژێرە';

  @override
  bool get reorderDragStartLabel => true;

  @override
  String get backButtonTooltip => 'گەڕانەوە';

  @override
  String get nextMonthTooltip => 'مانگی داهاتوو';

  @override
  String get previousMonthTooltip => 'مانگی پێشوو';

  @override
  String get nextPageTooltip => 'لاپەڕەی داهاتوو';

  @override
  String get previousPageTooltip => 'لاپەڕەی پێشوو';

  @override
  String get showMenuTooltip => 'پیشاندانی مێنیو';

  @override
  String get drawerLabel => 'مێنیوی ناڤیگەیشن';

  @override
  String get popupMenuLabel => 'مێنیوی پۆپ ئەپ';

  @override
  String get dialogLabel => 'دیالۆگ';

  @override
  String get expandedIconTapHint => 'بچووک کردنەوە';

  @override
  String get collapsedIconTapHint => 'گەورە کردن';

  @override
  ScriptCategory get scriptCategory => ScriptCategory.tall;

  @override
  TimeOfDayFormat timeOfDayFormat({bool alwaysUse24HourFormat = false}) {
    return TimeOfDayFormat.h_colon_mm_space_a;
  }

  @override
  String formatDecimal(int number) {
    return TextDirectionUtils.convertToKurdishNumbers(number.toString());
  }

  @override
  String formatFullDate(DateTime date) {
    final months = [
      'کانوونی دووەم',
      'شوبات',
      'ئازار',
      'نیسان',
      'ئایار',
      'حوزەیران',
      'تەممووز',
      'ئاب',
      'ئەیلوول',
      'تشرینی یەکەم',
      'تشرینی دووەم',
      'کانوونی یەکەم',
    ];
    
    return '${date.day}ی ${months[date.month - 1]}ی ${date.year}';
  }

  @override
  String formatShortDate(DateTime date) {
    return intl.DateFormat.yMd('ckb').format(date);
  }

  @override
  String formatMediumDate(DateTime date) {
    final weekdays = [
      'یەکشەممە',
      'دووشەممە',
      'سێشەممە',
      'چوارشەممە',
      'پێنجشەممە',
      'هەینی',
      'شەممە',
    ];
    return '${weekdays[date.weekday % 7]}, ${formatMonthYear(date)}';
  }

  @override
  String formatCompactDate(DateTime date) {
    return intl.DateFormat.yMd('ckb').format(date);
  }

  @override
  String formatYear(DateTime date) {
    return intl.DateFormat.y('ckb').format(date);
  }

  @override
  String formatMonthYear(DateTime date) {
    final months = [
      'کانوونی دووەم',
      'شوبات',
      'ئازار',
      'نیسان',
      'ئایار',
      'حوزەیران',
      'تەممووز',
      'ئاب',
      'ئەیلوول',
      'تشرینی یەکەم',
      'تشرینی دووەم',
      'کانوونی یەکەم',
    ];
    return '${months[date.month - 1]} ${date.year}';
  }

  @override
  List<String> get narrowWeekdays => const <String>[
    'ی',  // یەکشەممە
    'د',  // دووشەممە
    'س',  // سێشەممە
    'چ',  // چوارشەممە
    'پ',  // پێنجشەممە
    'ه',  // هەینی
    'ش',  // شەممە
  ];

  @override
  int get firstDayOfWeekIndex => 6; // Saturday

  @override
  String formatHour(TimeOfDay timeOfDay, {bool alwaysUse24HourFormat = false}) {
    return timeOfDay.hour.toString().padLeft(2, '0');
  }

  @override
  String formatMinute(TimeOfDay timeOfDay) {
    return timeOfDay.minute.toString().padLeft(2, '0');
  }

  @override
  String formatTimeOfDay(TimeOfDay timeOfDay, {bool alwaysUse24HourFormat = false}) {
    return '${formatHour(timeOfDay, alwaysUse24HourFormat: alwaysUse24HourFormat)}:${formatMinute(timeOfDay)}';
  }

  @override
  String aboutListTileTitle(String applicationName) {
    return 'دەربارەی $applicationName';
  }

  @override
  String get licensesPageTitle => 'مۆڵەتەکان';

  @override
  String pageRowsInfo(int firstRow, int lastRow, int rowCount, bool rowCountIsApproximate) {
    return '$firstRow–$lastRow لە $rowCount';
  }

  @override
  String get rowsPerPageTitle => 'ڕیز لە هەر لاپەڕەیەک:';

  @override
  String get selectedRowCountTitleOne => '١ دانە هەڵبژێردرا';

  @override
  String selectedRowCountTitle(int count) {
    return '$count دانە هەڵبژێردرا';
  }

  @override
  String formatShortMonthDay(DateTime date) {
    return '${date.day}/${date.month}';
  }

  @override
  String get reorderItemDown => 'بۆ خوارەوە';

  @override
  String get reorderItemLeft => 'بۆ چەپ';

  @override
  String get reorderItemRight => 'بۆ ڕاست';

  @override
  String get reorderItemUp => 'بۆ سەرەوە';

  @override
  String get reorderItemToEnd => 'گواستنەوە بۆ کۆتایی';

  @override
  String get reorderItemToStart => 'گواستنەوە بۆ سەرەتا';

  @override
  String get keyboardKeyAlt => 'Alt';

  @override
  String get keyboardKeyAltGraph => 'AltGr';

  @override
  String get keyboardKeyBackspace => 'Backspace';

  @override
  String get keyboardKeyCapital => 'Capital';

  @override
  String get keyboardKeyChannelDown => 'Channel Down';

  @override
  String get keyboardKeyChannelUp => 'Channel Up';

  @override
  String get keyboardKeyControl => 'Ctrl';

  @override
  String get keyboardKeyDelete => 'Del';

  @override
  String get keyboardKeyEject => 'Eject';

  @override
  String get keyboardKeyEnd => 'End';

  @override
  String get keyboardKeyEscape => 'Esc';

  @override
  String get keyboardKeyFn => 'Fn';

  @override
  String get keyboardKeyHome => 'Home';

  @override
  String get keyboardKeyInsert => 'Insert';

  @override
  String get keyboardKeyMeta => 'Meta';

  @override
  String get keyboardKeyMetaMacOs => 'Command';

  @override
  String get keyboardKeyMetaWindows => 'Win';

  @override
  String get keyboardKeyNumLock => 'Num Lock';

  @override
  String get keyboardKeyNumpad1 => 'Num 1';

  @override
  String get keyboardKeyNumpad2 => 'Num 2';

  @override
  String get keyboardKeyNumpad3 => 'Num 3';

  @override
  String get keyboardKeyNumpad4 => 'Num 4';

  @override
  String get keyboardKeyNumpad5 => 'Num 5';

  @override
  String get keyboardKeyNumpad6 => 'Num 6';

  @override
  String get keyboardKeyNumpad7 => 'Num 7';

  @override
  String get keyboardKeyNumpad8 => 'Num 8';

  @override
  String get keyboardKeyNumpad9 => 'Num 9';

  @override
  String get keyboardKeyNumpad0 => 'Num 0';

  @override
  String get keyboardKeyNumpadAdd => 'Num +';

  @override
  String get keyboardKeyNumpadComma => 'Num ,';

  @override
  String get keyboardKeyNumpadDecimal => 'Num .';

  @override
  String get keyboardKeyNumpadDivide => 'Num /';

  @override
  String get keyboardKeyNumpadEnter => 'Num Enter';

  @override
  String get keyboardKeyNumpadEqual => 'Num =';

  @override
  String get keyboardKeyNumpadMultiply => 'Num *';

  @override
  String get keyboardKeyNumpadParenLeft => 'Num (';

  @override
  String get keyboardKeyNumpadParenRight => 'Num )';

  @override
  String get keyboardKeyNumpadSubtract => 'Num -';

  @override
  String get keyboardKeyPageDown => 'PgDown';

  @override
  String get keyboardKeyPageUp => 'PgUp';

  @override
  String get keyboardKeyPower => 'Power';

  @override
  String get keyboardKeyPowerOff => 'Power Off';

  @override
  String get keyboardKeyPrintScreen => 'Print Screen';

  @override
  String get keyboardKeyScrollLock => 'Scroll Lock';

  @override
  String get keyboardKeySelect => 'Select';

  @override
  String get keyboardKeySpace => 'Space';

  @override
  String get keyboardKeyShift => 'Shift';

  @override
  String get keyboardKeyCapsLock => 'Caps Lock';

  @override
  String get keyboardKeysOperatingSystem => 'سیستەمی کارپێکردن';

  @override
  String get keyboardKeysSelect => 'هەڵبژاردن';

  @override
  String get keyboardKeysToggle => 'گۆڕین';

  @override
  String get keyboardKeysNumLock => 'Num Lock';

  @override
  String get keyboardKeysControl => 'Ctrl';

  @override
  String get keyboardKeysAlt => 'Alt';

  @override
  String get keyboardKeysShift => 'Shift';

  @override
  String get keyboardKeysEnter => 'Enter';

  @override
  String get keyboardKeysHome => 'Home';

  @override
  String get keyboardKeysEnd => 'End';

  @override
  String get keyboardKeysPageUp => 'Page Up';

  @override
  String get keyboardKeysPageDown => 'Page Down';

  @override
  String get keyboardKeysBackspace => 'Backspace';

  @override
  String get keyboardKeysDelete => 'Delete';

  @override
  String get keyboardKeysEscape => 'Escape';

  @override
  String get keyboardKeysInsert => 'Insert';

  @override
  String get keyboardKeysSpace => 'Space';

  @override
  String get keyboardKeysTab => 'Tab';

  @override
  String get keyboardKeysUpArrow => 'Up Arrow';

  @override
  String get keyboardKeysDownArrow => 'Down Arrow';

  @override
  String get keyboardKeysLeftArrow => 'Left Arrow';

  @override
  String get keyboardKeysRightArrow => 'Right Arrow';

  @override
  String get keyboardKeysPrintScreen => 'Print Screen';

  @override
  String get keyboardKeysPause => 'Pause';

  @override
  String get keyboardKeysBreak => 'Break';

  @override
  String get keyboardKeysMenu => 'Menu';

  @override
  String get keyboardKeysWindows => 'Windows';

  @override
  String get keyboardKeysContext => 'Context';

  @override
  String get keyboardKeysMeta => 'Meta';

  @override
  String get keyboardKeysCommand => 'Command';

  @override
  String get keyboardKeysFunction => 'Function';

  @override
  String get keyboardKeysClear => 'Clear';

  @override
  String get keyboardKeysF1 => 'F1';

  @override
  String get keyboardKeysF2 => 'F2';

  @override
  String get keyboardKeysF3 => 'F3';

  @override
  String get keyboardKeysF4 => 'F4';

  @override
  String get keyboardKeysF5 => 'F5';

  @override
  String get keyboardKeysF6 => 'F6';

  @override
  String get keyboardKeysF7 => 'F7';

  @override
  String get keyboardKeysF8 => 'F8';

  @override
  String get keyboardKeysF9 => 'F9';

  @override
  String get keyboardKeysF10 => 'F10';

  @override
  String get keyboardKeysF11 => 'F11';

  @override
  String get keyboardKeysF12 => 'F12';

  @override
  String get keyboardKeysNumpad => 'Numpad';

  @override
  String get keyboardKeysNumpadEnter => 'Numpad Enter';

  @override
  String get keyboardKeysNumpadAdd => 'Numpad +';

  @override
  String get keyboardKeysNumpadSubtract => 'Numpad -';

  @override
  String get keyboardKeysNumpadMultiply => 'Numpad *';

  @override
  String get keyboardKeysNumpadDivide => 'Numpad /';

  @override
  String get keyboardKeysNumpadDecimal => 'Numpad .';

  @override
  String get keyboardKeysNumpadComma => 'Numpad ,';

  @override
  String get keyboardKeysNumpadEqual => 'Numpad =';

  @override
  String get keyboardKeysNumpadParenLeft => 'Numpad (';

  @override
  String get keyboardKeysNumpadParenRight => 'Numpad )';

  @override
  String scrimOnTapHint(String modalRouteContentName) => 'داخستنی $modalRouteContentName';

  @override
  String tabLabel({required int tabIndex, required int tabCount}) {
    return 'تاب $tabIndex لە $tabCount';
  }

  @override
  String get anteMeridiemAbbreviation => 'پ.ن';

  @override
  String get postMeridiemAbbreviation => 'د.ن';

  @override
  String licensesPackageDetailTextZero(int licenseCount) => 'هیچ مۆڵەتێک نییە';

  @override
  String licensesPackageDetailTextOne(int licenseCount) => '١ مۆڵەت';

  @override
  String licensesPackageDetailTextOther(int licenseCount) => '$licenseCount مۆڵەت';

  @override
  String pageRowsInfoTitleRaw(int firstRow, int lastRow, int rowCount, bool rowCountIsApproximate) {
    return '$firstRow–$lastRow لە $rowCount';
  }

  @override
  String remainingTextFieldCharacterCountZero(int remaining) => 'هیچ پیتێک نەماوە';

  @override
  String remainingTextFieldCharacterCountOne(int remaining) => '١ پیت ماوە';

  @override
  String remainingTextFieldCharacterCountOther(int remaining) => '$remaining پیت ماوە';

  @override
  DateTime? parseCompactDate(String? inputString) {
    if (inputString == null) return null;
    try {
      return DateTime.parse(inputString);
    } catch (e) {
      return null;
    }
  }

  @override
  String get bottomSheetLabel => 'شیتی خوارەوە';

  @override
  String get calendarModeButtonLabel => 'گۆڕین بۆ ڕۆژژمێر';

  @override
  String get clearButtonTooltip => 'پاککردنەوە';

  @override
  String get menuBarMenuLabel => 'مێنیوی بار';

  @override
  String get modalBarrierDismissLabel => 'داخستن';

  @override
  String get inputTimeModeButtonLabel => 'گۆڕین بۆ تێکردنی دەق';

  @override
  String get invalidTimeLabel => 'کاتێکی دروست بنووسە';

  @override
  String get viewLicensesButtonLabel => 'بینینی مۆڵەتەکان';

  @override
  String get selectYearSemanticsLabel => 'هەڵبژاردنی ساڵ';

  @override
  String get timePickerDialHelpText => 'کات هەڵبژێرە';

  @override
  String get timePickerHourLabel => 'کاتژمێر';

  @override
  String get timePickerInputHelpText => 'کات بنووسە';

  @override
  String get timePickerMinuteLabel => 'خولەک';

  @override
  String get unspecifiedDate => 'بەرواری دیاری نەکراو';

  @override
  String get unspecifiedDateRange => 'ماوەی بەرواری دیاری نەکراو';

  @override
  String get dateHelpText => 'ڕۆژ/مانگ/ساڵ';

  @override
  String get dateInputLabel => 'بەروار بنووسە';

  @override
  String get dateOutOfRangeLabel => 'دەرەوەی مەودایە';

  @override
  String get datePickerHelpText => 'بەروار هەڵبژێرە';

  @override
  String get dateRangeEndLabel => 'بەرواری کۆتایی';

  @override
  String get dateRangeStartLabel => 'بەرواری دەستپێک';

  @override
  String get dateSeparator => '/';

  @override
  String get deleteButtonTooltip => 'سڕینەوە';

  @override
  String get dialModeButtonLabel => 'گۆڕین بۆ مۆدی هەڵبژێری کاتژمێر';

  @override
  String get firstPageTooltip => 'لاپەڕەی یەکەم';

  @override
  String get hideAccountsLabel => 'شاردنەوەی هەژمارەکان';

  @override
  String get inputDateModeButtonLabel => 'گۆڕین بۆ تێکردنی دەق';

  @override
  String get lastPageTooltip => 'دوا لاپەڕە';

  @override
  String get licensesPackageDetailTextFew => 'مۆڵەتەکان';

  @override
  String get licensesPackageDetailTextMany => 'مۆڵەتەکان';

  @override
  String get licensesPackageDetailTextTwo => 'مۆڵەتەکان';

  @override
  String get moreButtonTooltip => 'زیاتر';

  @override
  String get openAppDrawerTooltip => 'کردنەوەی مێنیوی ناڤیگەیشن';

  @override
  String get passwordVisibilityIconTapHint => 'پیشاندان/شاردنەوەی وشەی نهێنی';

  @override
  String get pasteButtonLabel => 'پەیست';

  @override
  String get showAccountsLabel => 'پیشاندانی هەژمارەکان';

  @override
  String get signedInLabel => 'چوونە ژوورەوە';

  @override
  String get timePickerHourModeAnnouncement => 'هەڵبژاردنی کاتژمێر';

  @override
  String get timePickerMinuteModeAnnouncement => 'هەڵبژاردنی خولەک';

  @override
  String get tooltipTapActionLabel => 'کرتە بکە';

  @override
  String get tooltipLongTapActionLabel => 'کرتەی درێژ بکە';

  @override
  String get viewDetailsTooltip => 'بینینی وردەکارییەکان';

  @override
  String get collapsedHint => 'بچووککراوە';

  @override
  String get continueButtonLabel => 'بەردەوام بە';

  @override
  String get copyButtonLabel => 'کۆپی';

  @override
  String get currentDateLabel => 'ئەمڕۆ';

  @override
  String get cutButtonLabel => 'بڕین';

  @override
  String get dateRangePickerHelpText => 'ماوەی بەروار هەڵبژێرە';

  @override
  String get expandedHint => 'گەورەکراوە';

  @override
  String get expansionTileCollapsedHint => 'دووجار کرتە بکە بۆ گەورەکردن';

  @override
  String get expansionTileCollapsedTapHint => 'گەورەکردن بۆ بینینی زیاتر';

  @override
  String get expansionTileExpandedHint => 'دووجار کرتە بکە بۆ بچووککردنەوە';

  @override
  String get expansionTileExpandedTapHint => 'بچووککردنەوە';

  @override
  String get invalidDateFormatLabel => 'فۆرماتی بەروار هەڵەیە';

  @override
  String get invalidDateRangeLabel => 'ماوەی بەروار هەڵەیە';

  @override
  String get lookUpButtonLabel => 'سەیرکردن';

  @override
  String get menuDismissLabel => 'داخستنی مێنیو';

  @override
  String get refreshIndicatorSemanticLabel => 'نوێکردنەوە';

  @override
  String get saveButtonLabel => 'پاشەکەوتکردن';

  @override
  String get scanTextButtonLabel => 'سکانکردنی دەق';

  @override
  String get scrimLabel => 'سکریم';

  @override
  String get searchWebButtonLabel => 'گەڕان لە ئینتەرنێت';

  @override
  String get selectedDateLabel => 'بەرواری هەڵبژێردراو';

  @override
  String get shareButtonLabel => 'هاوبەشکردن';

  @override
  String dateRangeEndDateSemanticLabel(String formattedDate) => 'بەرواری کۆتایی $formattedDate';

  @override
  String dateRangeStartDateSemanticLabel(String formattedDate) => 'بەرواری دەستپێک $formattedDate';

  @override
  String licensesPackageDetailText(int count) => count == 1 ? '١ مۆڵەت' : '$count مۆڵەت';

  @override
  String pageRowsInfoTitle(int firstRow, int lastRow, int rowCount, bool rowCountIsApproximate) {
    return '$firstRow–$lastRow لە $rowCount';
  }

  @override
  String remainingTextFieldCharacterCount(int remaining) {
    return remaining == 1 ? '١ پیت ماوە' : '$remaining پیت ماوە';
  }

  @override
  // TODO: implement closeButtonLabel
  String get closeButtonLabel => throw UnimplementedError();
}

class _KurdishMaterialLocalizationsDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  const _KurdishMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ckb';

  @override
  Future<MaterialLocalizations> load(Locale locale) {
    return SynchronousFuture<MaterialLocalizations>(const KurdishMaterialLocalizations());
  }

  @override
  bool shouldReload(_KurdishMaterialLocalizationsDelegate old) => false;
} 