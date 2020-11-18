import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  static DateFormat get dateFormat => DateFormat("yyyy-MM-dd HH:mm:ss");
  String get asString => dateFormat.format(this);
  static DateTime toDateTime(String date) => dateFormat.parse(date);
}
