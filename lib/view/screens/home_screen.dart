import 'package:budget_planner_app/constants/appcolor.dart';
import 'package:budget_planner_app/controller/home_controller.dart';
import 'package:budget_planner_app/controller/login_controller.dart';
import 'package:budget_planner_app/controller/register_controller.dart';
import 'package:budget_planner_app/view/widgets/home-element.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key});

  HomeController controllerHome = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:  EdgeInsets.fromLTRB(20.0, 15, 20, 10),
                      child: Text(
                        'Home',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    const Padding(
                      padding:  EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Divider(
                        color: Colors.black12,
                      ),
                    ),
                    const Padding(
                      padding:  EdgeInsets.fromLTRB(30.0, 0, 20, 14),
                      child: Text(
                        'Dashboard',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 30,
                        ),
                      ),
                    ),

                    // here stop

                   homeList(name: "Counters", length: 2),
                   const SizedBox(
                      height: 20,
                    ),
                         homeList(length: 5,name:"Consumption Target" ,),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
