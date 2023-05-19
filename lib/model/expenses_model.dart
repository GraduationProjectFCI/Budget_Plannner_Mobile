import 'package:budget_planner_app/functions/date_format.dart';

class ExpensesModel {
  late String message;
  late List<Expenses>? expenses;

  ExpensesModel.fromJson(Map<String, dynamic> json) {
    message = json['msg'];
    if (json['expenses'] != null) {
      expenses = List<Expenses>.from(
        json['expenses'].map((x) => Expenses.fromJson(x)),
      );
    } else {
      expenses = [];
    }
  }
}

class Expenses {
  late String sheetId;
  late String labelId;
  late String userId;
  late String label;
  late String? description;
  late int value;
  late String createdAt;
  late String updatedAt;

  Expenses.fromJson(Map<String, dynamic> json) {
    labelId = json['_id'];
    sheetId = json['sheet_id'];
    userId = json['user_id'];
    label = json['label'];
    value = json['value'];
    description = json['description'];

    createdAt = dateFormat(json['created_at']);
    updatedAt = dateFormat(json['updated_at']);
  }
}
