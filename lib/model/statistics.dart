


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
  late String label;
  late double totalExpenses;
  late double totalBudgetPercen;
  late double totalSpentPercen;
  late String createdAt;
  late String updatedAt;

  statistics.fromJson(Map<String, dynamic> json) {
    sheetId = json['_id'];
    userId = json['user_id'];
    label = json['label'];
    totalExpenses = json['expensesSum'].toDouble();
    totalBudgetPercen = json['labelPercentageTotal'].toDouble();
    totalSpentPercen = json['labelPercentageSpent'].toDouble();
    createdAt = dateFormat(json['created_at']);
    updatedAt = dateFormat(json['updated_at']);
  }
}
