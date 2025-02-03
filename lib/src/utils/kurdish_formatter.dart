import 'text_direction_utils.dart';

class KurdishFormatter {
  static String date(DateTime date) {
    return TextDirectionUtils.formatDate(date);
  }

  static String time(DateTime time) {
    return TextDirectionUtils.formatTime(time);
  }

  static String dateTime(DateTime dateTime) {
    return '${TextDirectionUtils.formatDate(dateTime)} ${TextDirectionUtils.formatTime(dateTime)}';
  }

  static String weekday(DateTime date) {
    return TextDirectionUtils.formatWeekday(date);
  }

  static String fullDate(DateTime date) {
    return '${TextDirectionUtils.formatWeekday(date)}، ${TextDirectionUtils.formatDate(date)}';
  }

  static String currency(double amount, {String currency = 'IQD'}) {
    return TextDirectionUtils.formatCurrency(amount, currency: currency);
  }

  static String percentage(double percentage) {
    return TextDirectionUtils.formatPercentage(percentage);
  }

  static String phoneNumber(String number) {
    return TextDirectionUtils.formatPhoneNumber(number);
  }

  static String numbers(String input) {
    return TextDirectionUtils.convertToKurdishNumbers(input);
  }

  static String formatNumber(dynamic number) {
    if (number == null) return '';
    
    final String numStr = number.toString();
    final Map<String, String> numbers = {
      '0': '٠',
      '1': '١',
      '2': '٢',
      '3': '٣',
      '4': '٤',
      '5': '٥',
      '6': '٦',
      '7': '٧',
      '8': '٨',
      '9': '٩',
    };
    
    return numStr.split('').map((char) => numbers[char] ?? char).join();
  }
} 