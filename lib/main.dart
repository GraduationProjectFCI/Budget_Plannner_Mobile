import 'package:budget_planner_app/view/screens/buttom_navigation_bar_screen.dart';
import 'package:budget_planner_app/view/screens/deadlines_screen.dart';
import 'package:budget_planner_app/view/screens/profile_screen.dart';
import 'package:budget_planner_app/view/screens/register_screen.dart';
import 'package:flutter/material.dart';

import 'view/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'budget planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: BottomNavigationBarScreen(),
      home: LoginScreen(),
    );
  }
}
