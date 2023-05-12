import 'package:budget_planner_app/constants/appcolor.dart';
import 'package:budget_planner_app/constants/approutes.dart';
import 'package:budget_planner_app/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImportScreen extends StatelessWidget {
  const ImportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Import',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  CustomButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.bottomNavigationBar);
                    },
                    textButton: 'Save Sheet',
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 140,
                    child: Column(
                      children: [
                        const Text(
                          'Labels',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DropdownButton(
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          dropdownColor: AppColor.buttonColor,
                          borderRadius: BorderRadius.circular(10),
                          iconSize: 50,
                          items: const [
                            DropdownMenuItem(
                              child: Text('food'),
                              value: 'food',
                            ),
                            DropdownMenuItem(
                              child: Text('drink'),
                              value: 'drink',
                            ),
                            DropdownMenuItem(
                              child: Text('transport'),
                              value: 'transport',
                            ),
                            DropdownMenuItem(
                              child: Text('wifi'),
                              value: 'wifi',
                            ),
                          ],
                          onChanged: (value) {
                            print(value);
                          },
                          hint: const Text('Select Label'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                        const Text(
                          'Values',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              suffix: const Text('EGP'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              fillColor: AppColor.hintTextColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                color: AppColor.hintTextColor,
                height: 400,
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: 33,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Food',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '555 EGP',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColor.hintTextColor,
                    ),
                    child: const Text(
                      'Total',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColor.hintTextColor,
                    ),
                    child: const Text(
                      '555 EGP',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
