import 'package:budget_planner_app/constants/appcolor.dart';
import 'package:flutter/material.dart';

import '../../constants/constant.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: const [
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 26,
                ),
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/photo2.jpg'),
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomContainer(label: 'Name', text: 'Mo’men Khaled'),
                CustomContainer(label: 'E-mail', text: 'momenk208@gmail.com'),
                CustomContainer(label: 'Gender', text: 'Male'),
                CustomContainer(label: 'Budget', text: '7000'),
                CustomContainer(label: 'Currency', text: 'Egyption Pound'),
                CustomContainer(label: 'Address', text: 'Egypt- Minya'),
              ],
            ),
          ),
        ));
  }
}

class CustomContainer extends StatelessWidget {
  CustomContainer({super.key, required this.label, required this.text});
  String label;
  String text;

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
      child: Text(
        '${label}: ${text}',
        style: const TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w300,
          height: 1.115,
          color: Color(0xff000000),
        ),
      ),
    );
  }
}
