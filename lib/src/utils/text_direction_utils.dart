import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

/// Utility class for handling text direction and number conversions in Kurdish.
class TextDirectionUtils {
  /// Returns the appropriate text direction for a given language code.
  static TextDirection getTextDirection(String languageCode) {
    return languageCode == 'ckb' ? TextDirection.rtl : TextDirection.ltr;
  }

  /// Checks if a language code represents an RTL language.
  static bool isRTLLanguage(String languageCode) {
    return languageCode == 'ckb';
  }

  /// Converts Western Arabic numerals to Kurdish numerals.
  /// Numbers are kept LTR while text remains RTL.
  static String convertToKurdishNumbers(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const kurdish = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    
    // First convert the numbers
    String result = input;
    for (int i = 0; i < english.length; i++) {
      result = result.replaceAll(english[i], kurdish[i]);
    }
    
    // Then wrap just the numbers in LTR marks
    final RegExp numberPattern = RegExp(r'[٠-٩]+');
    result = result.replaceAllMapped(numberPattern, (match) {
      return '\u202D${match.group(0)}\u202C';
    });
    
    return result;
  }

  /// Converts Kurdish numerals back to Western Arabic numerals.
  static String convertFromKurdishNumbers(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const kurdish = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    
    String result = input;
    for (int i = 0; i < kurdish.length; i++) {
      result = result.replaceAll(kurdish[i], english[i]);
    }
    
    return result;
  }

  static TextAlign getTextAlign(String languageCode) {
    return isRTLLanguage(languageCode) ? TextAlign.right : TextAlign.left;
  }

  /// Maps English month names to Kurdish month names
  static const Map<String, String> monthMap = {
    'January': 'کانوونی دووەم',
    'February': 'شوبات',
    'March': 'ئازار',
    'April': 'نیسان',
    'May': 'ئایار',
    'June': 'حوزەیران',
    'July': 'تەممووز',
    'August': 'ئاب',
    'September': 'ئەیلوول',
    'October': 'تشرینی یەکەم',
    'November': 'تشرینی دووەم',
    'December': 'کانوونی یەکەم',
  };

  /// Maps English weekday names to Kurdish weekday names
  static const Map<String, String> weekdayMap = {
    'Monday': 'دووشەممە',
    'Tuesday': 'سێشەممە',
    'Wednesday': 'چوارشەممە',
    'Thursday': 'پێنجشەممە',
    'Friday': 'هەینی',
    'Saturday': 'شەممە',
    'Sunday': 'یەکشەممە',
  };

  /// Special handling for numbers and mixed text
  static TextDirection getMixedTextDirection(String text, String languageCode) {
    if (!isRTLLanguage(languageCode)) return TextDirection.ltr;
    
    // If the text starts with numbers, English characters, or common LTR symbols
    final startsWithLTR = RegExp(r'^[\d\$€£٪%A-Za-z]').hasMatch(text);
    return startsWithLTR ? TextDirection.ltr : TextDirection.rtl;
  }

  /// Get proper alignment for input fields
  static TextAlignVertical getTextAlignVertical(String languageCode) {
    return isRTLLanguage(languageCode) ? TextAlignVertical.center : TextAlignVertical.top;
  }

  /// Format date in Kurdish style
  static String formatDate(DateTime date, {bool useKurdishNumbers = true}) {
    final day = date.day.toString().padLeft(2, '0');
    final month = monthMap[intl.DateFormat('MMMM').format(date)] ?? '';
    final year = date.year.toString();

    final formatted = '$day ی $month $year';
    return useKurdishNumbers ? convertToKurdishNumbers(formatted) : formatted;
  }

  /// Format time in Kurdish style
  static String formatTime(DateTime time, {bool useKurdishNumbers = true}) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    
    final formatted = '$hour:$minute';
    return useKurdishNumbers ? convertToKurdishNumbers(formatted) : formatted;
  }

  /// Format weekday in Kurdish
  static String formatWeekday(DateTime date) {
    final weekday = intl.DateFormat('EEEE').format(date);
    return weekdayMap[weekday] ?? weekday;
  }

  /// Format currency in Kurdish style
  static String formatCurrency(double amount, {
    String currency = 'IQD',
    bool useKurdishNumbers = true,
  }) {
    final formatted = intl.NumberFormat.currency(
      symbol: currency,
      decimalDigits: 0,
    ).format(amount);
    
    return useKurdishNumbers ? convertToKurdishNumbers(formatted) : formatted;
  }

  /// Format percentage in Kurdish style
  static String formatPercentage(double percentage, {
    bool useKurdishNumbers = true,
  }) {
    final formatted = '${percentage.toStringAsFixed(1)}٪';
    return useKurdishNumbers ? convertToKurdishNumbers(formatted) : formatted;
  }

  /// Check if text contains mixed content (numbers, Latin characters, etc.)
  static bool isMixedContent(String text) {
    return RegExp(r'[\d\$€£٪%A-Za-z]').hasMatch(text) &&
           RegExp(r'[\u0600-\u06FF]').hasMatch(text); // Arabic/Persian character range
  }

  /// Format phone number in Kurdish style
  static String formatPhoneNumber(String phoneNumber, {
    bool useKurdishNumbers = true,
  }) {
    // Remove any non-digit characters
    final digits = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
    
    // Format as per Iraqi phone number format
    if (digits.length == 11 && digits.startsWith('964')) {
      final formatted = '(${digits.substring(0, 3)}) ${digits.substring(3, 6)} ${digits.substring(6)}';
      return useKurdishNumbers ? convertToKurdishNumbers(formatted) : formatted;
    }
    
    // Default formatting for other numbers
    final formatted = digits.replaceAllMapped(
      RegExp(r'(\d{3})(\d{3})(\d{4})'),
      (Match m) => '${m[1]} ${m[2]} ${m[3]}'
    );
    
    return useKurdishNumbers ? convertToKurdishNumbers(formatted) : formatted;
  }

  static TextDirection getDirection(String text) {
    if (text.isEmpty) return TextDirection.rtl;
    
    final firstChar = text.runes.first;
    // Check if the first character is Arabic/Persian/Kurdish
    if (firstChar >= 0x0600 && firstChar <= 0x06FF) {
      return TextDirection.rtl;
    }
    return TextDirection.ltr;
  }
} 