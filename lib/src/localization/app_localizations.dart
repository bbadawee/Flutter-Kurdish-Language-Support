import 'package:flutter/material.dart';
import '../utils/text_direction_utils.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations) 
        ?? AppLocalizations(const Locale('ckb'));
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = 
    _AppLocalizationsDelegate();

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'hello': 'Hello',
      'welcome': 'Welcome',
      'change_language': 'Change Language',
      'settings': 'Settings',
      'profile': 'Profile',
      'cancel': 'Cancel',
      'save': 'Save',
      'delete': 'Delete',
      'edit': 'Edit',
      'close': 'Close',
      'search': 'Search',
      'email': 'Email',
      'password': 'Password',
      'username': 'Username',
      'phone': 'Phone',
      'loading': 'Loading...',
      'error': 'Error',
      'success': 'Success',
      'no_results': 'No results found',
      'required_field': 'This field is required',
      'invalid_email': 'Invalid email',
      'invalid_phone': 'Invalid phone',
      'today': 'Today',
      'yesterday': 'Yesterday',
      'tomorrow': 'Tomorrow',
    },
    'ckb': {
      'hello': 'سڵاو',
      'welcome': 'بەخێربێیت',
      'change_language': 'گۆڕینی زمان',
      'settings': 'ڕێکخستنەکان',
      'profile': 'پرۆفایل',
      'cancel': 'هەڵوەشاندنەوە',
      'save': 'پاشەکەوتکردن',
      'delete': 'سڕینەوە',
      'edit': 'دەستکاریکردن',
      'close': 'داخستن',
      'search': 'گەڕان',
      'email': 'ئیمەیڵ',
      'password': 'وشەی نهێنی',
      'username': 'ناوی بەکارهێنەر',
      'phone': 'ژمارەی مۆبایل',
      'loading': 'چاوەڕێبە...',
      'error': 'هەڵە ڕوویدا',
      'success': 'سەرکەوتوو بوو',
      'no_results': 'هیچ ئەنجامێک نەدۆزرایەوە',
      'required_field': 'ئەم خانەیە پێویستە',
      'invalid_email': 'ئیمەیڵەکە دروست نییە',
      'invalid_phone': 'ژمارەی مۆبایل دروست نییە',
      'today': 'ئەمڕۆ',
      'yesterday': 'دوێنێ',
      'tomorrow': 'سبەینێ',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }

  bool get isRTL => TextDirectionUtils.isRTLLanguage(locale.languageCode);

  String get languageName {
    switch (locale.languageCode) {
      case 'ckb':
        return 'کوردی';
      case 'en':
        return 'English';
      default:
        return 'Unknown';
    }
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['ckb', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
} 