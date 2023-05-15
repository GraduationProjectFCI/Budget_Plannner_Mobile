import 'package:budget_planner_app/view/screens/home_screen.dart';
import 'package:budget_planner_app/view/screens/login_screen.dart';
import 'package:budget_planner_app/view/screens/profile_screen.dart';
import 'package:budget_planner_app/view/screens/register_screen.dart';
import 'package:budget_planner_app/view/screens/statics_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';

import '../../constants/app_color.dart';
import '../../controller/bottom_navigationbar_controller.dart';
import 'confirm_screen.dart';
import 'deadlines_screen.dart';
import 'sheets_screen.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  BottomNavigationBarScreen({super.key});
  BottomNavigationBarController controller =
      Get.put(BottomNavigationBarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: PageView(
          onPageChanged: (value) {
            controller.animateToPage(value);
          },
          controller: controller.pageController,
          children: [
            HomeScreen(),
            SheetsScreen(),
            StaticsScreen(),
            DeadlinesScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: GetBuilder<BottomNavigationBarController>(
          builder: (controller) => BottomNavigationBar(
            fixedColor: AppColor.buttonColor,
            elevation: 20,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Image.asset(
                  'assets/home.png',
                  fit: BoxFit.cover,
                ),
                activeIcon: Image.asset(
                  'assets/home_active.png',
                  color: AppColor.buttonColor,
                  fit: BoxFit.cover,
                ),
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                label: 'Sheets',
                icon: Image.asset(
                  'assets/sheets.png',
                  fit: BoxFit.cover,
                ),
                activeIcon: Image.asset(
                  'assets/sheets_active.png',
                  color: AppColor.buttonColor,
                  fit: BoxFit.cover,
                ),
              ),
              BottomNavigationBarItem(
                label: 'States',
                icon: Image.asset(
                  'assets/states.png',
                  fit: BoxFit.cover,
                ),
                activeIcon: Image.asset(
                  'assets/states_active.png',
                  color: AppColor.buttonColor,
                  fit: BoxFit.cover,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Target',
                icon: Image.asset(
                  'assets/target.png',
                  fit: BoxFit.cover,
                ),
                activeIcon: Image.asset(
                  'assets/target_active.png',
                  color: AppColor.buttonColor,
                  fit: BoxFit.cover,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: Image.asset(
                  'assets/profile.png',
                  fit: BoxFit.cover,
                ),
                activeIcon: Image.asset(
                  'assets/profile_active.png',
                  color: AppColor.buttonColor,
                  fit: BoxFit.cover,
                ),
              ),
            ],
            onTap: (value) {
              controller.changeSelecteValue(value);
              print('ddsadsadas ${controller.navigatorValue}');
              print('value = $value');
            },
            currentIndex: controller.navigatorValue,
          ),
        ),
      ),
    );
  }
}
