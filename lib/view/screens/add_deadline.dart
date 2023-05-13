import 'package:budget_planner_app/constants/appcolor.dart';
import 'package:budget_planner_app/constants/approutes.dart';
import 'package:budget_planner_app/controller/add_deadlin.dart';
import 'package:budget_planner_app/view/widgets/custom_button.dart';
import 'package:budget_planner_app/view/widgets/date_time.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDeadlineScreen extends StatelessWidget {
  AddDeadlineScreen({super.key});
  TextEditingController dateTimeController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();
  TextEditingController valueController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  AddDeadlineController controller = Get.put(AddDeadlineController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Import',
                  style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 30,
                    ),
                ),
                SizedBox(
                  height: 30,
                ),
                picker(dateTimeController: dateTimeController),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Deadline Name',
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: deadlineController,
                            validator: (Value) {
                              if (Value!.isEmpty) {
                                return "please enter deadline name";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                fillColor: AppColor.hintTextColor),
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
                            controller: valueController,
                            validator: (Value) {
                              if (Value!.isEmpty) {
                                return "please enter deadline name";
                              }
                              return null;
                            },
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
                // Flexible(
                //   child: Container(
                //     padding: const EdgeInsets.all(15),
                //     color: AppColor.hintTextColor,
                //     height: 400,
                //     child: ListView.separated(
                //       separatorBuilder: (context, index) => Divider(),
                //       itemCount: 33,
                //       itemBuilder: (context, index) {
                //         return Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: const [
                //             Text(
                //               'Food',
                //               style: TextStyle(
                //                   fontSize: 20, fontWeight: FontWeight.bold),
                //             ),
                //             Text(
                //               '555 EGP',
                //               style: TextStyle(
                //                   fontSize: 20, fontWeight: FontWeight.bold),
                //             ),
                //           ],
                //         );
                //       },
                //     ),
                //   ),
                // ),
                // Spacer(),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 6, left: 134, right: 134),
                  child: GetBuilder<AddDeadlineController>(
                    builder: (c) => ConditionalBuilder(
                      condition: controller.state.isTrue,
                      builder: (context) => CustomButton(
                        textButton: 'add',
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            controller.sendData(
                              date: dateTimeController.text,
                              name:deadlineController.text ,
                              value: int.parse(valueController.text)  ,
                            ).then((value) {
                              Get.offAllNamed(AppRoutes.bottomNavigationBar);
                            });
                          }
                        },
                      ),
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
