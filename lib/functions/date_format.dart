import 'package:date_format/date_format.dart';

String dateFormat(String originalDateString) {
  return formatDate(DateTime.parse(originalDateString), [D, ' ', dd, ' ', M]);
}



String getHourAndMinuteFromDatetime(String datetimeStr) {
  final dateTime = DateTime.parse(datetimeStr);
  final hour = formatDate(dateTime, [HH]).padLeft(2, '0');
  final minute = formatDate(dateTime, [nn]).padLeft(2, '0');
  return '$hour:$minute';
}