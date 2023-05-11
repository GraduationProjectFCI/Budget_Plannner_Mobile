class SheetModel {
  late String message;
  late List<UserData> data;

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

  UserData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    sheetId = json['_id'];
    sheetType = json['sheet_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
