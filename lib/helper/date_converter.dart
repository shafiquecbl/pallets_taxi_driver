import 'package:intl/intl.dart';

class DateConverter {
  static DateTime removeAfterDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  static DateTime getDateFromMilliseconds(String milliseconds) {
    return DateTime.fromMillisecondsSinceEpoch(int.parse(milliseconds));
  }

  static getFormatDateFromMilliseconds(String milliseconds) {
    var date = DateTime.fromMillisecondsSinceEpoch(int.parse(milliseconds));
    var format = DateFormat('EEEE, d MMMM y');
    return format.format(date);
  }

  static String getTimeFromMilliseconds(String milliseconds) {
    var date = DateTime.fromMillisecondsSinceEpoch(int.parse(milliseconds));
    var format = DateFormat('hh:mm a');
    return format.format(date);
  }

  static getFormatDate(DateTime date) {
    var format = DateFormat('EEEE, d MMMM y');
    return format.format(date);
  }

  static String getTime(DateTime date) {
    var format = DateFormat('hh:mm a');
    return format.format(date);
  }
}
