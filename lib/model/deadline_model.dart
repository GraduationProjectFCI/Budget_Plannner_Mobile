import 'package:intl/intl.dart';

String dateFromat(String originalDateString) {
  String desiredFormat = "EEE, dd, MMM";

  DateTime originalDate = DateTime.parse(originalDateString);
  String formattedDate = DateFormat(desiredFormat).format(originalDate);
  return formattedDate;
}

class DeadlineModel {
  var message;
  late List<Data>? data;

  DeadlineModel.fromJson(Map<String, dynamic> json) {
    message = json['msg'];
    if (json['data'] != null) {
      data = List<Data>.from(
        json['data'].map((x) => Data.fromJson(x)),
      );
    } else {
      data = [];
    }
  }
}

class Data {
  late String? userId;
  late String? sheetId;
  late String? deadlineName;
  late String? deadlineDate;
  late String? createdAt;
  late String? updatedAt;
  int? value;

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    sheetId = json['_id'];
    deadlineName = json['deadline_name'];
    deadlineDate = dateFromat(json['deadline_date']);
    createdAt = dateFromat(json['created_at']);
    updatedAt = dateFromat(json['updated_at']);
    value = json['deadline_value'];
  }
}
