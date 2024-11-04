import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toStringFormat() {
    final DateFormat formatter = DateFormat('dd.MM.yyyy');
    return formatter.format(this);
  }

  static DateTime? fromStringFormat(String dateString) {
    final DateFormat formatter = DateFormat('dd.MM.yyyy');
    try {
      return formatter.parse(dateString);
    } catch (e) {
      return null;
    }
  }
}
