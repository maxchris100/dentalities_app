import 'package:intl/intl.dart';

class DateUtil {
  static String formatQuery(DateTime date, {String? dateFormat}) {
    if (dateFormat != null) {
      return DateFormat(dateFormat).format(date);
    }
    return DateFormat("yyyy-MM-dd").format(date);
  }

  static String formatDateIndonesian(DateTime date, [DateTime? date2]) {
    if (date2 != null) {
      if (date2.difference(date).inDays == 0) {
        return DateFormat("d MMMM yyyy").format(date);
      }
      if (date.year == date2.year) {
        if (date.month == date2.month) {
          // Same month and year
          return "${DateFormat('d').format(date)}–${DateFormat('d MMMM yyyy').format(date2)}";
        } else {
          // Same year, different months
          return "${DateFormat('d MMMM').format(date)} – ${DateFormat('d MMMM yyyy').format(date2)}";
        }
      } else {
        // Different years
        return "${DateFormat('d MMMM yyyy').format(date)} – ${DateFormat('d MMMM yyyy').format(date2)}";
      }
    }
    return DateFormat("d MMMM yyyy").format(date);
  }
}
