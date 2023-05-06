import 'package:budget_planner_app/controller/home_controller.dart';
import 'package:budget_planner_app/controller/login_controller.dart';
import 'package:budget_planner_app/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  // LoginController controller = Get.find();
  HomeController controllerHome = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                const Text(
                  'Home Screen',
                  style: TextStyle(fontSize: 26),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Text(
                //   'Hello ${controller.loginModel!.data!.name}',
                //   style: const TextStyle(fontSize: 26),
                // ),
                ElevatedButton(
                    onPressed: () async {
                      await controllerHome.test();
                    },
                    child: Text('test')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
