import 'package:intl/intl.dart';

class StringUtil {
  static String castToString(dynamic val) {
    if (val != null) {
      return val.toString();
    }
    return "";
  }

  static String formatMoney(dynamic val,
      {String locale = 'id_ID', String symbol = 'Rp '}) {
    if (val == null) return '';

    try {
      final number = num.tryParse(val.toString());
      if (number == null) return '';

      final formatter = NumberFormat.currency(
          locale: locale, symbol: symbol, decimalDigits: 0);
      return formatter.format(number);
    } catch (e) {
      return '';
    }
  }
}
