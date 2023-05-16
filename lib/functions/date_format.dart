import 'package:date_format/date_format.dart';

String dateFormat(String originalDateString) {
  return formatDate(DateTime.parse(originalDateString), [D, ' ', dd, ' ', M]);
}
