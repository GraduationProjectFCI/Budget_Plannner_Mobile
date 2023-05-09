import 'package:budget_planner_app/constants/approutes.dart';
import 'package:budget_planner_app/controller/confirmation_controller.dart';
import 'package:budget_planner_app/helper/cashe_helper.dart';
import 'package:budget_planner_app/view/screens/bottom_navigation_bar_screen.dart';
import 'package:budget_planner_app/view/screens/confirm_screen.dart';
import 'package:budget_planner_app/view/screens/deadlines_screen.dart';
import 'package:budget_planner_app/view/screens/profile_screen.dart';
import 'package:budget_planner_app/view/screens/register_screen.dart';
import 'package:budget_planner_app/view/screens/statics_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  String? token = await CacheHelper.prefs?.getString('token');
  runApp(MyApp(token));
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp(this.token, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'budget planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.register,
      routes: routes,
      // home: token == null ? LoginScreen() : BottomNavigationBarScreen(),
    );
  }
}
