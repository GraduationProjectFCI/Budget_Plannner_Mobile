import 'package:budget_planner_app/constants/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Widget homeElelmen() => Container(
      //  margin: EdgeInsets.all(30),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColor.backgroundColor,
      ),

      child: Row(
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text(
                'Home Screen',
                style: TextStyle(fontSize: 26),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    'Total : 6000  &',
                    style: TextStyle(fontSize: 17),
                  ),
                  const Text(
                    '  remaining : 2000',
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          CircularPercentIndicator(
            radius: 40.0,
            lineWidth: 8.0,
            percent: 0.30,
            center: new Text("100%"),
            progressColor: Colors.green,
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );







Widget homeList({
required String name ,
required int length  
})=>Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '$name',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => homeElelmen(),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                            itemCount: length,
                          ),
                        ],
                      ),
                    );