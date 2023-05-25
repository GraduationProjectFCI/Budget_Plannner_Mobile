import 'package:budget_planner_app/controller/deadline_controller.dart';
import 'package:budget_planner_app/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../controller/sheets_controller.dart';
import '../controller/statistics_controller.dart';

Future<void> refrishData() async {
  sheetsController c1 = Get.put(sheetsController());
  StatisticsController c2 = Get.put(StatisticsController());
  HomeController c3 = Get.put(HomeController());
  WidgetsFlutterBinding.ensureInitialized();

  await c1.getSheetData();
  await c2.getStatisticData();
  await c3.getHomeData();
  await c3.getLimitsData();
}

Future<void> loadHomeData() async {
  HomeController c3 = Get.put(HomeController());
  WidgetsFlutterBinding.ensureInitialized();

  await c3.getHomeData();
  await c3.getLimitsData();
}

Future<void> loadSheetData() async {
  sheetsController c1 = Get.put(sheetsController());
  WidgetsFlutterBinding.ensureInitialized();

  await c1.getSheetData();
}

Future<void> loadStatisticData() async {
  StatisticsController c2 = Get.put(StatisticsController());
  WidgetsFlutterBinding.ensureInitialized();

  await c2.getStatisticData();
}

Future<void> loadDeadlinesData() async {
  DeadlineController c3 = Get.put(DeadlineController());
  WidgetsFlutterBinding.ensureInitialized();

  c3.getDeadlineData();
}

Future<void> loadProfileData() async {
  ProfileController c2 = Get.put(ProfileController());
  WidgetsFlutterBinding.ensureInitialized();

  await c2.getProfileData();
}
