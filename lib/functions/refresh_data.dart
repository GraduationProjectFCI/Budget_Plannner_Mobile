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

  c1.getSheetData();
  c2.getStatisticData();
  c3.getHomeData();
  c3.getLimitsData();
}
