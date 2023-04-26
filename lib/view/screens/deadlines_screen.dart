import 'package:budget_planner_app/constants/appcolor.dart';
import 'package:flutter/material.dart';

class DeadlinesScreen extends StatelessWidget {
  const DeadlinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Container(
          margin:
              const EdgeInsets.only(left: 10, right: 10, top: 16, bottom: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      'Deadlines',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        height: 1.115 * 1.2,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
                CustomContainer(
                    label: 'Phone Bill', date: 'Fri, 30 jan', money: '400'),
                CustomContainer(
                    label: 'Phone Bill', date: 'Fri, 30 jan', money: '400'),
                CustomContainer(
                    label: 'Phone Bill', date: 'Fri, 30 jan', money: '400'),
                CustomContainer(
                    label: 'Phone Bill', date: 'Fri, 30 jan', money: '400'),
                CustomContainer(
                    label: 'Phone Bill', date: 'Fri, 30 jan', money: '400'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  CustomContainer({
    required this.label,
    required this.date,
    required this.money,
    super.key,
  });
  String label;
  String date;
  String money;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.fromLTRB(11, 11, 11, 11),
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${label}',
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w300,
              height: 1.115,
              color: Color(0xff000000),
            ),
          ),
          Text(
            '${date}',
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w300,
              height: 1.115,
              color: Color(0xff000000),
            ),
          ),
          Text(
            '${money} EGP',
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w300,
              height: 1.115,
              color: Color(0xff000000),
            ),
          ),
        ],
      ),
    );
  }
}
