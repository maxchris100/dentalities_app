import 'package:intl/intl.dart';
import 'package:html/parser.dart' as html_parser;

class StringUtil {
  static String castToString(dynamic val) {
    if (val != null) {
      return val.toString();
    }
    return "";
  }

  static String parseHtmlToText(String htmlString) {
    final document = html_parser.parse(htmlString);
    return document.body?.text ?? '';
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

  static String dateFormat(dynamic val, {String format = "yyyy-MM-dd"}) {
    if (val == null) return "";

    try {
      DateTime date;

      if (val is DateTime) {
        date = val;
      } else if (val is int) {
        date = DateTime.fromMillisecondsSinceEpoch(val);
      } else if (val is String) {
        date = DateTime.parse(val);
      } else {
        return "";
      }

      return DateFormat(format).format(date);
    } catch (e) {
      return "";
    }
  }
}
