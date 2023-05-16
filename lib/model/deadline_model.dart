import 'package:budget_planner_app/functions/date_format.dart';

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
    deadlineDate = dateFormat(json['deadline_date']);
    createdAt = dateFormat(json['created_at']);
    updatedAt = dateFormat(json['updated_at']);
    value = json['deadline_value'];
  }
}
