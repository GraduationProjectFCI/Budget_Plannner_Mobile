import 'package:budget_planner_app/view/screens/deadline_info.dart';
import 'package:budget_planner_app/view/screens/sheet_info.dart';
import 'package:flutter/material.dart';

import '../view/screens/bottom_navigation_bar_screen.dart';
import '../view/screens/confirm_screen.dart';
import '../view/screens/deadlines_screen.dart';
import '../view/screens/home_screen.dart';
import '../view/screens/login_screen.dart';
import '../view/screens/profile_screen.dart';
import '../view/screens/register_screen.dart';
import '../view/screens/sheets_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String sheets = '/sheets';
  static const String profile = '/profile';
  static const String confirmation = '/confirmation';
  static const String deadlines = '/deadline';
  static const String home = '/home';
  static const String sheetInfo = '/sheetInfo';
  static const String deadlineInfo = '/deadlineInfo';
  static const String bottomNavigationBar = '/bottom_navigationbarscreen';
}

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.login: (context) => LoginScreen(),
  AppRoutes.register: (context) => RegisterScreen(),
  AppRoutes.confirmation: (context) => ConfirmScreen(),
  AppRoutes.sheets: (context) => SheetsScreen(),
  AppRoutes.profile: (context) => ProfileScreen(),
  AppRoutes.deadlines: (context) => DeadlinesScreen(),
  AppRoutes.home: (context) => HomeScreen(),
  AppRoutes.sheetInfo: (context) => SheetInfo(),
  AppRoutes.deadlineInfo: (context) => DeadlineInfo(),
  AppRoutes.bottomNavigationBar: (context) => BottomNavigationBarScreen(),
};
