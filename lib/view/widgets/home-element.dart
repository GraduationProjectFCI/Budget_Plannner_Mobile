import 'package:budget_planner_app/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Widget homeElelmen() => Container(
      //  margin: EdgeInsets.all(30),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColor.backgroundColor,
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // const Text(
          //   'Home Screen',
          //   style: TextStyle(fontSize: 26),
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          // CircularPercentIndicator(
          //   radius: 80.0,
          //   lineWidth: 8.0,
          //   percent: 0.30,
          //   center: Text(
          //     "100%",
          //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //   ),
          // progressColor: Colors.green,
          // ),
          Text(
            'Spent',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w100),
          ),
          Text(
            '36666',
            style: TextStyle(fontSize: 85, fontWeight: FontWeight.w100),
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Total : 6000',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              Text(
                'remaining : 2000',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ],
          ),

          // const Spacer(),
        ],
      ),

      //   ],
      // ),
    );

Widget homeList({required String name, required int length}) => Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        // color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: Text(
          //     '$name',
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 20,
          //     ),
          //   ),
          // ),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => homeElelmen(),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: length,
          ),
        ],
      ),
    );
