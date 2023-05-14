import 'package:date_format/date_format.dart';

String dateFromat(String originalDateString) {
  return formatDate(DateTime.parse(originalDateString), [D, ' ', dd, ' ', M]);
}

class SheetModel {
  var message;
  List<UserData>? data;

  SheetModel.fromJson(Map<String, dynamic> json) {
    message = json['msg'];
    if (json['data'] != null) {
      data = List<UserData>.from(
        json['data'].map((x) => UserData.fromJson(x)),
      );
    } else {
      data = [];
    }
  }
}

class UserData {
  late String? userId;
  late String? sheetId;
  late String? sheetType;
  late String? createdAt;
  late String? updatedAt;
  int? value;

  UserData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    sheetId = json['_id'];
    sheetType = json['sheet_type'];
    createdAt = dateFromat(json['created_at']);
    updatedAt = dateFromat(json['updated_at']);
    value = json['value'];
  }
}
