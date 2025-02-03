import '../utils/kurdish_formatter.dart';

extension NumberExtensions on num {
  String toKurdishDigits() {
    return KurdishFormatter.formatNumber(this);
  }
  
  String toKurdishCurrency({String currency = 'IQD'}) {
    return KurdishFormatter.currency(toDouble(), currency: currency);
  }
  
  String toKurdishPercentage() => KurdishFormatter.percentage(toDouble());
}

extension StringNumberExtensions on String {
  String toKurdishDigits() {
    return KurdishFormatter.formatNumber(this);
  }
} 