


import 'package:budget_planner_app/functions/date_format.dart';

class StatisticsModel {
  late String message;
  late int spentBudget;
  late List<statistics>? data;

  StatisticsModel.fromJson(Map<String, dynamic> json) {
    message = json['msg'];
    spentBudget = json['data']['spent_budget'];
    if (json['data'] != null) {
      data = List<statistics>.from(
        json['data']['statistics'].map((x) => statistics.fromJson(x)),
      );
    } else {
      data = [];
    }
  }
}

class statistics {
  late String sheetId;
  late String userId;
  late double totalExpenses;
  late double totalBudget;
  late double totalSpent;
  late String createdAt;
  late String updatedAt;

  statistics.fromJson(Map<String, dynamic> json) {
    sheetId = json['_id'];
    userId = json['user_id'];
    totalExpenses = json['total_Expenses'].toDouble();
    totalBudget = json['total_Budget'].toDouble();
    totalSpent = json['total_Spent'].toDouble();
    createdAt = dateFormat(json['created_at']);
    updatedAt = dateFormat(json['updated_at']);
  }
}
