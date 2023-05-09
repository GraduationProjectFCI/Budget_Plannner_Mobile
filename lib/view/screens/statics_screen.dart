
import 'package:budget_planner_app/constants/appcolor.dart';
import 'package:budget_planner_app/view/screens/deadlines_screen.dart';
import 'package:budget_planner_app/view/widgets/statistics_element.dart';
import 'package:flutter/material.dart';

class StaticsScreen extends StatelessWidget {
  const StaticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Container(
          margin:
              const EdgeInsets.only(left: 10, right: 10, top: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(17.0, 20, 20, 26),
                child: Text(
                  'Statistics',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 40,
                  ),
                ),
              ),
              
               Padding(
                padding: EdgeInsets.fromLTRB(30.0, 0, 0, 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '3890',
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 75,
                      ),
                    ),
                    Text(
                      'Total spent',
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(40, 0, 30, 0),
                child: Divider(
                  color: Colors.black12,
                ),
              ),
            
              Expanded(
                flex: 10,
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return StatisticsContainer(
                        label: 'Phone Bill', percentage: '45', money: '400');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
